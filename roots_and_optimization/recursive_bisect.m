function [root, fx, ea, iter] = recursive_bisect(func, xl, xu, es, maxit, iter)

xmid = (xl + xu) / 2.;
ea = (xu - xmid) / xmid;
if ea <= es || iter >= maxit
    root = xmid; fx = func(xmid);
    return
end

if func(xmid) > 0
    xu = xmid;
    [root, fx, ea, iter] = recursive_bisect(func, xl, xu, es, maxit, iter + 1);
elseif func(xmid) < 0
    xl = xmid;
    [root, fx, ea, iter] = recursive_bisect(func, xl, xu, es, maxit, iter + 1);
else
    ea = 0;
    root = xmid;
    fx = func(xmid);
end

end