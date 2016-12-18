function f = negentropy_multy(W, X)
    G = @(x) log(cosh(x));
    %G = @(x) -exp((-x.^2)./2);
    f = 0;
   
    %Optimization
    for i=1:n
        f = f - mean(G(W(i, :) *  X));
    end
end
