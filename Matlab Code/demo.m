clear;clc;close all;

name = 'Balance.txt';

[X,Y] = readDataForClassification(name);
X = normalize(X);
[train,test,trainL,testL] = divideTestTrain(X,Y,name);

dimension = 2; % Embedding dimension

% dDR
[embedingX,embedingTest] = dDR(train,test,trainL,dimension);
dDR_E = classifier(embedingX,embedingTest,trainL,testL);

% KdDR
p1 = 0.5; % p1 should be tuned by cross validation
[embedingX, embedingTest] = KdDR(train,trainL,test,p1,dimension);
KdDR_E = classifier(embedingX,embedingTest,trainL,testL);


fprintf('Data %s for dimension %d\n\n',name,dimension);
disp('***** dDR *****');   
fprintf('Error of dDR is: %f\n\n', dDR_E);     
disp('***** KdDR *****');  
fprintf('Error of KdDR is: %f\n', KdDR_E);  
disp('*****************************************************************************');

