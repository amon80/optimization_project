function y = negentropy_single(w, X, W_known)
    G = @(x) log(cosh(x));
    %G = @(x) -exp((-x.^2)./2);
    %W_known is given as a matrix n*p where
    %n is the number of components
    %p is the size of already estimated components
    %Each column is an estimated component
    p = size(W_known, 2);
    sum = zeros(size(w));
    for i=1:p
        sum = sum + (w' * W_known(:,i)* W_known(:,i));
    end
    w = w - sum;
    y = - mean(G(w' * X));
end