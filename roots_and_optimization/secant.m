function [root, ea, iter] = secant(func, xprev, xcurr, es, maxit, varargin)

if nargin < 3, error('at least 3 input argumetns required'), end
if nargin < 4 || isempty(es), es = 0.0001; end
if nargin < 5 || isempty(maxit), maxit = 50; end
iter = 0;
while (1)
    xnew = xcurr - (func(xcurr) * (xprev - xcurr)) / (func(xprev) - func(xcurr));
    xprev = xcurr;
    xcurr = xnew;
    iter = iter + 1;
    
    if xcurr ~= 0, ea = abs((xcurr - xprev)/xcurr) * 100; end
    fprintf("i=%d, x_i=%f, |ea|=%f\n", iter, xcurr, ea);
    if ea <= es || iter >= maxit, break; end
end
root = xcurr;
end