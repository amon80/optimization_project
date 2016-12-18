function [f gradf] = negentropy_single(w, X, W_known)
    G = @(x) log(cosh(x));
    %G = @(x) -exp((-x.^2)./2);
    p = size(W_known, 2);
    sum = zeros(size(w));
    for i=1:p
        sum = sum + (w' * W_known(:,i)* W_known(:,i));
    end
    w = w - sum;
    f = - mean(G(w' * X));
    
    if nargout > 1
        g = @(x) tanh(x);
        %g = @(x) x.*exp((-x.^2)./2)
        y = zeros(size(X));
        for i=1:size(w,1)
            y(i,:) = g(w'*X);
        end
        gradf = - mean(X.*y, 2);
    end
end