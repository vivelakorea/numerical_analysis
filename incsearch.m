function xb = incsearch(func, xmin, xmax, ns)
% incsearch(func, xmin, xmax, ns):
%   find brackets of x that contain sign changes of 
%   a function on an interval
% input:
%   func = name of function
%   xmin, xmax = endpoints of interval
%   ns = (optional) number of subintervals along x
%     used to search for barckets
% output:
%   xb(k,1) is the lower bound of the kth sign change
%   xb(k,2) is the upper bound of the kth sign change
%   If no brackets found, xb = [].

if nargin < 4, ns = 50; end

% Incremental search
x = linspace(xmin, xmax, ns);
f = func(x);
nb = 0; xb = [];
for k = 1 : length(x) - 1
    if sign(f(k)) ~= sign(f(k+1))
        nb = nb + 1;
        xb(nb, 1) = x(k);
        xb(nb, 2) = x(k+1);
    end
end
end

