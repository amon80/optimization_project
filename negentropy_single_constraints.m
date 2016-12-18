function [c, ceq, gradc, gradceq] = negentropy_single_constraints(w)
c = [];
ceq = norm(w)^2 - 1;

if nargout > 2
    gradc = [];
    gradceq = w.*2;
end
end
