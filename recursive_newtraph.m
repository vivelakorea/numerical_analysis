function [root, ea, iter] = recursive_newtraph(func, dfunc, xr, es, maxit, iter)

xrold = xr;
f =  matlabFunction(func);
df =  matlabFunction(dfunc);
xr = xr - f(xr) / df(xr);

ea =  abs((xrold - xr)  / xr);
if ea < es || iter > maxit
    root = xr;
    return
end

[root, ea, iter] = recursive_newtraph(func, dfunc, xr, es, maxit, iter + 1);

end