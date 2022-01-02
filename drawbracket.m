xmin = 3; xmax = 6; ns = 100; func = @(x) sin(10*x) + cos(3*x);
xp = linspace(xmin, xmax, 1000);
yp = func(xp);
plot(xp, yp)
hold on

xaxisp = xp * 0;
plot(xp, xaxisp)
hold on

xb = incsearch(func, xmin, xmax, ns);
scatter(xb(:, 1), xb(:, 1)*0, 'black');
hold on
scatter(xb(:, 2), xb(:, 2)*0, 'black');
