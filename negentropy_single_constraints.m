function [c, ceq] = negentropy_single_constraints(w)
c = [];
ceq = norm(w) - 1;
end