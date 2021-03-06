function [x, fx, ea, iter] = recursive_parabolic(func, x1, x2, x3, iter, es, maxit, varargin)
if nargin < 5, error('at least 5 input arguments required'); end
if nargin < 6 || isempty(es), es = 0.0001; end
if nargin < 7 || isempty(maxit), maxit = 50; end
% fprintf("%f %f %f\n", x1, x2, x3);

tmp1 = (x2 - x1)^2*(func(x2, varargin{:}) - func(x3, varargin{:})) - (x2 - x3)^2*(func(x2, varargin{:}) - func(x1, varargin{:}));
tmp2 = (x2 - x1)*(func(x2, varargin{:}) - func(x3, varargin{:})) - (x2 - x3)*(func(x2, varargin{:}) - func(x1, varargin{:}));
x4 = x2 - (1/2)*tmp1/tmp2;

ea = abs((x2 - x4) / x4);
if ea < es || iter >= maxit
    x = x4;
    fx = func(x4, varargin{:});
    return
end

if x4 > x2
    [x, fx, ea, iter] = recursive_parabolic(func, x2, x4, x3, iter + 1, es, maxit, varargin);
else
    [x, fx, ea, iter] = recursive_parabolic(func, x1, x4, x2, iter + 1, es, maxit, varargin);
end

end