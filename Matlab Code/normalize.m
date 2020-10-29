function out = normalize(X)

% X is p*n matrix of data

max_t = max(X,[],2);
min_t= min(X,[],2);

MAX = repmat(max_t,[1,size(X,2)]);
MIN = repmat(min_t,[1,size(X,2)]);

out = (X - MIN) ./ (MAX - MIN);
out(find(isnan(out))) = 0;






