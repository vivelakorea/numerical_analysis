m = 68.1;
ch = 0.25;
g = 9.8;

step_size = 0.1;
n = 300;
v_real = real_solution(step_size, n, m, c, g);

t = (0:n) * step_size;
plot(t, v_real, 'red')
hold on


step_size = 2;
n = 15;
v_euler = euler_solution(step_size, n, m, c, g);
v_centered = centered_solution(step_size, n, m, c, g);

t = (0:n) * step_size;
plot(t, v_euler, 'green')
hold on
plot(t, v_centered, 'blue')

ylim([0 60])

function v = real_solution(step_size, n, m, c, g)
    t = (0:n) * step_size;
    v = sqrt(g * m / c) * tanh( sqrt(g * c / m) * t);
end

function v = euler_solution(step_size, n, m, c, g)
    v = zeros(1, n+1);
    v(1) = 0;
    for i = 1:n
        v(i+1) = v(i) + (g - c / m*v(i)^2) * step_size;
    end
end

function v = centered_solution(step_size, n, m, c, g)
    v = zeros(1, n+1);
    v(1) = 0;
    v(2) = v(1) + (g - c / m*v(1)^2) * step_size;
    for i = 2:n
        v(i+1) = v(i-1) + 2*(g - c/m*v(i)^2) * step_size;
    end
end
