function x = gauss_pivoting(A, b)

n = size(A, 1);
x = zeros(n, 1);

% forward
for i = 1:n-1
    % idx of maximum in subcolumn
    [pivot, idx] = max(abs(A(i:n,i)));
    idx = idx + i - 1;
    A([i, idx],:) = A([idx, i],:);
    b([i, idx]) = b([idx, i]);
    for j = i+1:n
        factor = A(j, i) / pivot;
        A(j,i:n) = A(j,i:n) - factor * A(i,i:n);
        b(j) = b(j) - factor * b(i);
    end
end

% backward
for i = n:-1:1
    tmp = A(i,i+1:n) * x(i+1:n);
    x(i) = (b(i) - tmp)/A(i,i);
end
end