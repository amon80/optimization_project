function [c, ceq] = negentropy_single_constraints(w)
c = [];
ceq = norm(w)^2 - 1;
end
