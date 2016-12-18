function h = hessinterior(w,lambda,X)
    h = zeros(size(X,1), size(X,1));
    g = @ (x) 1 - tanh(x).^2;
    
    tmp = g(w'*X);
    [nrow, ncol] = size(h);
    for i=1:nrow
        for j=1:ncol
            h(i,j) = -mean(tmp.*X(i,:).*X(j,:));
        end
    end
    
    h1 = eye(size(h));
    h1 = h1.*2;
    h = h + lambda.eqnonlin(1)*h1;
end
