function Kernel = computeKernel(input1,input2,p1,type)
% input is a pxn matrix of data, each column is a data point

if strcmp(type,'delta')
    % delta kernel on Y
    input1 = input1(:);
    n = size(input1,1);
    Y1 = repmat(input1,[1,n]);
    Y2 = repmat(input1',[n,1]);
    Kernel = double(Y1==Y2);
    
else
    % RBF kernel
    n1sq = sum(input1.^2,1);
    n1 = size(input1,2);
    n2sq = sum(input2.^2,1);
    n2 = size(input2,2);
    D = (ones(n2,1)*n1sq)' + ones(n1,1)*n2sq -2 * input1' * input2;
    Kernel = exp((-D/(2*p1^2)));   
    
end


end
