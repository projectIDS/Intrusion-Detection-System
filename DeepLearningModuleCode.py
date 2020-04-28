


import keras
from keras.models import Sequential
from keras.layers import Dense
import matplotlib.pyplot as plt
import pandas as pd
from keras.wrappers.scikit_learn import KerasRegressor
from sklearn.model_selection import GridSearchCV
from keras.activations import relu, sigmoid
from keras.layers import Dense, Activation

data = pd.read_csv('dataset2.csv')

data.drop(['Source IP','Destination IP','Ethernet type','Protocols in frame','Bytes since last PSH flag','Bytes in Flight'], axis = 1, inplace = True) 

data = data.dropna(axis=0, subset=['IP Version','IP Header Length','Total Length','Source Port','Destination Port','TCP Length','Relative Sequence No','Relative Ack No','Raw Ack No','ACK Flag','PUSH Flag','SYN Flag','Time Since First Frame in TCP Stream','Time Since Previous Frame in this TCP Stream'])

data = data.sample(frac=1).reset_index(drop=True)


test_data = pd.read_csv('test.csv')
test_data.drop(['Source IP','Destination IP','Ethernet type','Protocols in frame','Bytes since last PSH flag','Bytes in Flight'], axis = 1, inplace = True) 

test_data = data.dropna(axis=0, subset=['IP Version','IP Header Length','Total Length','Source Port','Destination Port','TCP Length','Relative Sequence No','Relative Ack No','Raw Ack No','ACK Flag','PUSH Flag','SYN Flag','Time Since First Frame in TCP Stream','Time Since Previous Frame in this TCP Stream'])


print('Total : ',len(data))
benign = data[data['Result']==0]
ddos = data[data['Result']==1]
print('BENIGN : ',len(benign))
print('DDoS : ',len(ddos))



x = pd.DataFrame(data.iloc[:,:-1].values) 
y = data.iloc[:,19].values


x_test = pd.DataFrame(test_data.iloc[0:181204,:-1].values) 
y_test = test_data.iloc[0:181204,19].values


from sklearn.preprocessing import StandardScaler
scalar = StandardScaler()
x = scalar.fit_transform(x)
x_test = scalar.fit_transform(x_test)



import seaborn as sns
import numpy as np
from sklearn.decomposition import PCA
pca = PCA(n_components=3)
x_train = pca.fit_transform(x)
#x_test = pca.fit_transform(x_test)

#x_test = pca.fit_transform(x_test)
explained_variance = pca.explained_variance_ratio_

explained_variance


#Model training 

from tensorflow.keras.callbacks import EarlyStopping

classifier = Sequential()

classifier.add(Dense(output_dim=5, init='uniform', activation='relu', input_dim=3))

classifier.add(Dense(output_dim=6, init='uniform', activation='relu'))


classifier.add(Dense(output_dim=5, init='uniform', activation='relu'))

classifier.add(Dense(output_dim=1, init='uniform', activation='sigmoid'))

classifier.compile(optimizer='adam', loss='binary_crossentropy', metrics = ['accuracy'])

monitor = EarlyStopping(monitor='val_loss', min_delta=1e-3, patience=5, verbose=1, mode='auto',
        restore_best_weights=True)

hist = classifier.fit(x_train,y,nb_epoch=50,validation_split = 0.2,callbacks=[monitor],verbose = 1,shuffle= True)


x_test = pca.fit_transform(x_test)
#Predictions on new dataset
y_pred = classifier.predict(x_test)
y_pred = y_pred>0.5


#Confusion matrix
import seaborn as sns
from sklearn.metrics import confusion_matrix, accuracy_score
cm = confusion_matrix(y_test,y_pred)
sns.heatmap(cm, annot = True, fmt = 'd')
Accuracy = accuracy_score(y_test,y_pred)


#Exporting model
import pickle
with open('deep_model','wb') as f: 
    pickle.dump(classifier,f)
    