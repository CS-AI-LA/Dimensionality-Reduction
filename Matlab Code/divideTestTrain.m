function [train,test,trainL,testL] = divideTestTrain(X,L,name)

if (~strcmp(name,'mnistAll'))
    n = size(X,2);
    n_train = round(0.7 * n);
    I = randperm(n);
    I_train = I(1:n_train);
    train = X(:,I_train);
    trainL = L(I_train);
    X(:,I_train) = [];
    L(I_train) = [];
    test = X;
    testL = L;
else
    train = X(:,1:1000);
    test = X(:,1001:end);
    trainL = L(:,1:1000);
    testL = L(:,1001:end);
end

end