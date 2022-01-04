function P = polyMult(A, B)

% make length or A, B power of 2 which contains room for A*B's coefficients
n = length(A) + length(B);
n = 2^(ceil(log2(n)));

for i = length(A)+1:n
    A(i) = 0;
end
for i = length(B)+1:n
    B(i) = 0;
end

% fft
FA = fft(A);
FB = fft(B);

% ifft
P = ifft(FA .* FB);

end