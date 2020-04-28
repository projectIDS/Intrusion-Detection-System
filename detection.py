def boolstr_to_floatstr(v):
    if v == 'True':
        return '1'
    elif v == 'False':
        return '0'
    else:
        return v

import pandas as pd

import pickle
import numpy as np

with open('deep_model','rb') as f: 
    model = pickle.load(f)


#Import dataset for prediction
data = pd.read_csv('LivePCFDataset.csv')
data.columns = ['Frame Length','Capture Length','Protocols in frame','Ethernet type','IP Version','IP Header Length','Total Length','Time to live','Protocol','Source IP','Destination IP','Source Port','Destination Port','TCP Length','Relative Sequence No','Raw Sequence No ','Relative Ack No','Raw Ack No','ACK Flag','PUSH Flag','SYN Flag','Bytes in Flight','Bytes since last PSH flag','Time Since First Frame in TCP Stream','Time Since Previous Frame in this TCP Stream']
data.drop(['Source IP','Destination IP','Ethernet type','Protocols in frame','Bytes since last PSH flag','Bytes in Flight'], axis = 1, inplace = True) 
data = data.dropna(axis=0, subset=['IP Version','IP Header Length','Total Length','Source Port','Destination Port','TCP Length','Relative Sequence No','Relative Ack No','Raw Ack No','ACK Flag','PUSH Flag','SYN Flag','Time Since First Frame in TCP Stream','Time Since Previous Frame in this TCP Stream'])

data1 = pd.read_csv('LivePCFDataset.csv')
data1.columns = ['Frame Length','Capture Length','Protocols in frame','Ethernet type','IP Version','IP Header Length','Total Length','Time to live','Protocol','Source IP','Destination IP','Source Port','Destination Port','TCP Length','Relative Sequence No','Raw Sequence No ','Relative Ack No','Raw Ack No','ACK Flag','PUSH Flag','SYN Flag','Bytes in Flight','Bytes since last PSH flag','Time Since First Frame in TCP Stream','Time Since Previous Frame in this TCP Stream']
data1 = data1.dropna(axis=0, subset=['IP Version','IP Header Length','Total Length','Source Port','Destination Port','TCP Length','Relative Sequence No','Relative Ack No','Raw Ack No','ACK Flag','PUSH Flag','SYN Flag','Time Since First Frame in TCP Stream','Time Since Previous Frame in this TCP Stream'])



x = pd.DataFrame(data.iloc[:,:].values) 
#y = data.iloc[:,19].values

#Feature Scaling
from sklearn.preprocessing import StandardScaler
scalar = StandardScaler()
x = scalar.fit_transform(x)


from sklearn.decomposition import PCA
pca = PCA(n_components=3)
x = pca.fit_transform(x)

pca.explained_variance_ratio_

y_pred = model.predict(x)
y_pred = (y_pred > 0.5)
y_pred = np.vectorize(boolstr_to_floatstr)(y_pred).astype(int)


y_list = np.concatenate(y_pred).astype(None)

y_index = np.where(y_list==1)
y_index = np.asarray(y_index)
y_index = y_index[0]

index = []
for i in y_index:
    index.append(data1.iloc[i,9])
    
unique_ip , count = np.unique(index,return_counts=True)

ip = []
for j in count:
    if j>60000:
        ind = np.where(count==j)
        ip.append(unique_ip[ind[0][0]])

f = open("attackerIP.txt", "w")
for m in ip:
    f.write(str(m)+'\n')
f.close()

print('ip details File Created successfully...')
