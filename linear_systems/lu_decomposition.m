function [L, A] = lu_decomposition(A)

n = size(A, 1);
L = eye(n);

% forward
for i = 1:n-1
    pivot = A(i, i);
    for j = i+1:n
        factor = A(j, i) / pivot;
        A(j,i:n) = A(j,i:n) - factor * A(i,i:n);
        L(j,i) = factor;
    end
end

end