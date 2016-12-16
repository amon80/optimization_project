function y = negentropy_multy(W, X)
    G = @(x) log(cosh(x));
    %G = @(x) -exp((-x.^2)./2);
    y = 0;
   
    %Optimization
    for i=1:n
        y = y - mean(G(W(i, :) *  X));
    end
end
