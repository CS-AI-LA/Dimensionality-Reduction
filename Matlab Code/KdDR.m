function [embedingX, embedingTest] = KdDR(X,Y,test,kernel_param,d)
% Function KdDr performs kernel dimensionality reduction
% using dCor dependency measure.



K = computeKernel(X,X,kernel_param, 'train');
Ky = computeKernel(Y,[],[],'delta');
G = K * Ky * K ;
r = rand(1);
Z = (K * K) + (r * eye(size(K,1)));
[Beta , D] = eigendec(G,Z,d,'LM');
embedingX = Beta' * K;
K_test = computeKernel(X,test,kernel_param, 'test');
embedingTest = Beta' * K_test; % Test embedding

