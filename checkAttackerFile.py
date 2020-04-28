import os

def is_file_empty(file_path):
	""" Check if file is empty by confirming if its size is 0 bytes"""
	# Check if file exist and it is empty
	return os.path.exists(file_path) and os.stat(file_path).st_size == 0

file_path = 'attackerIP.txt'


# check if file exist and it is empty
is_empty = is_file_empty(file_path)


if is_empty:
	print('===============================================================================')
	print('...............................You Are Safe:)..................................')
	print('===============================================================================')
else:
	print('===============================================================================')
	print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Attacker Detected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
	print('!!!!!!!!!!!!!!!!!!!!!!!!!Starting Mitigation Phase!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
	print('===============================================================================')

