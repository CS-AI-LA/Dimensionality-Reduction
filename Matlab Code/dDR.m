function [embedingX,embedingTest] = dDR(X,test,Y,d)
% Function dDR (dCor_based dimensionality reduction) performs
% dimensionality reduction using dCor dependency measure.

ky = computeKernel(Y', [],[],'delta'); % kernel on response variable Y
r = rand(1);
Z = (X * X');
Z = Z + (r * eye(size(Z,1)));
G = X * ky * X';
[U , D] = eigendec(G,Z,d,'LM');
embedingX = U' * X;
embedingTest = U' * test; % Test embedding


end

