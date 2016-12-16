function [c, ceq] = negentropy_multy_constraints(W)
c = [];
n = size(W,1);
ceq = [];
i = 1;
%Norms constraints
for j=1:n
    ceq(i) = norm(W(i,:))^2 - 1;
    i = i + 1;
end

%Ortho constraints
for j=1:n-1
    for k=j+1:n
        ceq(i) = (W(j,:) * W(k,:)');
        i = i+1;
    end
end
end

