function [x, fx, ea, iter] = recursive_goldmin(f, iter, xl, xu, es, maxit, varargin)

if nargin < 4, error('at least 4 input arguments required'); end
if nargin < 5 || isempty(es), es = 0.0001; end
if nargin < 6 || isempty(maxit), maxit = 50; end

% fprintf("%f %f\n", xl, xu);

phi = (1 + sqrt(5)) / 2;
d = (phi - 1) * (xu - xl);
x1 = xl + d;
x2 = xu - d;
if f(x1, varargin{:}) < f(x2, varargin{:})
    xopt = x1;
    if xopt ~= 0, ea = (2-phi) * abs((xu - xl) / xopt) * 100; end
    if ea < es || iter > maxit
        x = xopt;
        fx = f(x, varargin{:});
        return
    end
    [x, fx, ea, iter] = recursive_goldmin(f, iter + 1, x2, xu, es, maxit, varargin);
else
    xopt = x2;
    if xopt ~= 0, ea = (2-phi) * abs((xu - xl) / xopt) * 100; end
    if ea < es || iter > maxit
        x = xopt;
        fx = f(x, varargin{:});
        return
    end
    [x, fx, ea, iter] = recursive_goldmin(f, iter + 1, xl, x1, es, maxit, varargin);
end
    
end
