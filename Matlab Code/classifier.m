function error = classifier(train,test,Y,Y_test)


D = pdist2(test', train', 'euclidean');
[~,idx] = sort(D, 2, 'ascend');
idx = idx(:,1);
prediction = Y(idx); 
error = sum(Y_test ~= prediction)/size(test,2);


