n = 10;

M = rand(n,n);
v = rand(n,1);

t = cputime;
x1 = gauss_pivoting(M,v);
disp(cputime - t)
disp(x1)

t = cputime;
x2 = M\v;
disp(cputime - t)
disp(x2)

t = cputime;
x3 = inv(M)*v;
disp(cputime - t)
disp(x3)




