# Copyright Abdi, Ghodsi 2020
#  Paper: Discriminant component analysis via distance correlation maximization
#  Lida Abdi, l-abdi@cse.shirazu.ac.ir 
#  Ali Ghodsi, aghodsi@uwaterloo.ca



#from scipy.spatial.distance import pdist, squareform
import numpy as np
#from numpy import linalg as LA
#from scipy.linalg import eig
import pandas as pd
from sklearn import preprocessing
from sklearn.model_selection import StratifiedKFold
from sklearn.neighbors import KNeighborsClassifier
from scipy.linalg import eigh
#from scipy.sparse.linalg import eigsh

# Compute RBF kernel
def kernel_RBF(X,Y,p1):
    K = np.zeros((X.shape[0],Y.shape[0]))
    for i,x in enumerate(X):
        for j,y in enumerate(Y):
            K[i,j] = np.exp(-1*np.linalg.norm(x-y)/(2*p1**2))
    return K

# Compute Delta kernel
def kernel_Delta(X,Y):
    K = np.zeros((X.shape[0],Y.shape[0]))
    for i,x in enumerate(X):
        for j,y in enumerate(Y):
            K[i,j] = float(x == y)
    return K

# Read dataset "name"
def read_Data(name):
    f = open(name, 'r')
    rows = []
    for line in f:
        # Split on any whitespace (including tab characters)
        row = line.split(',')
        # Append to our list of lists:
        rows.append(row)      
    X = np.array(rows)
    return X


def normalize(X): 
    df = pd.DataFrame(X)
    min_max_scaler = preprocessing.MinMaxScaler()
    np_scaled = min_max_scaler.fit_transform(df)
    df_normalized = pd.DataFrame(np_scaled)
    return df_normalized


def ddr(test,train,trainL,d):
    
    test = np.array(test, dtype = float)
    train = np.array(train, dtype = float)
    
    num = train.shape
    ky = kernel_Delta(trainL,trainL)
    r = np.random.rand(1,1)
    train_tp = train.transpose()

    train_tp = np.array(train_tp, dtype = float)
    Z = np.dot(train, train_tp)
    
    Z = Z + (r * np.identity(num[0]))
    G =  np.dot(np.dot(train, ky), train_tp)

    #### Find eigenvalues and sort them #######

    eigvals, eigvecs = eigh(G, Z)
    index = np.argsort(eigvals)
    nindex = np.flipud(index)
    U = eigvecs[:,nindex]
    U = np.array(U, dtype = float)
    U = U[:,0:d]
     
    #### Embed test and train data #######
    embeding_train = np.dot(U.transpose(),train)
    embeding_test = np.dot(U.transpose(), test)
    
    #### Transpose test and train data #######
    embeding_train_t = embeding_train.T
    embeding_test_t = embeding_test.T

    return (embeding_train_t , embeding_test_t)

    
def kddr(test,train,trainL,d,sigma):
    
    ky = kernel_Delta(trainL,trainL)
    k = kernel_RBF(train.transpose(),train.transpose(),sigma)
       
    G = np.dot(np.dot(k, ky), k)
    Z = np.dot(k, k)
    r = np.random.rand(1,1)
    num = train.shape
    Z = Z + (r * np.identity(num[1]))
     
    #### Find eigenvalues and sort them #######
    eigvals, eigvecs = eigh(G, Z)
    index = np.argsort(eigvals)
    nindex = np.flipud(index)
    U = eigvecs[:,nindex]
    U = np.array(U, dtype = float)
    U = U[:,0:d]
     
    #### Embed test and train data #######
    embeding_train = np.dot(U.transpose(),k)
    k_test = kernel_RBF(train.transpose(),test.transpose(),sigma)
    embeding_test = np.dot(U.transpose(), k_test)
    
    #### Transpose test and train data #######
    embeding_train_t = embeding_train.T
    embeding_test_t = embeding_test.T

    return (embeding_train_t , embeding_test_t)





