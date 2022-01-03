% must be edited
function x = jacobi(func, es, maxit, iter, varargin)

disp(varargin)
xnew = num2cell(func(varargin{:}));

if iter + 1 >= maxit
    x = xnew;
    return
end

for i=1:length(xnew)
    if abs((varargin{i} - xnew{i})/xnew{i}) >= es
        x = jacobi(func, es, maxit, iter+1, xnew);
        return
    end
end

x = xnew;

end