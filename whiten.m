function [X] = whiten(X,fudgefactor)
X = bsxfun(@minus, X, mean(X,1));
A = (X'*X)/(size(X,1));
[V,D] = eig(A);
X = X*V*diag(1./(diag(D)+fudgefactor).^(1/2))*V';
end