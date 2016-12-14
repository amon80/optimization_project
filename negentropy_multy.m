function y = negentropy_multy(W, X)
    G = @(x) log(cosh(x));
    %G = @(x) -exp((-x.^2)./2);
    y = 0;
    n = size(W,1);
    
    %Parallel deflation
    WxWT = inv(W * W');
    [F D] = eig(WxWT);
    Dinv = inv(D);
    Dinvsquare = sqrt(Dinv);
    WxWTsquare = F*Dinvsquare*F';
    W = WxWTsquare*W;
   
    %Optimization
    for i=1:n
        y = y - mean(G(W(i, :) *  X));
    end
end