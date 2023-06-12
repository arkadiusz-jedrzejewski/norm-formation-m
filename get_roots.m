function [roots] = get_roots(fun,a,b,dx, tol)
% get_roots finds roots of fun = 0 in interval [a, b)
% fun:      function handle representing the function
% a, b:     interval [a, b) within which to search for roots
% tol:      tolerance for convergence

roots = [];  % Initialize an empty array to store the roots
x = a;
while x+dx <= b
    xa = x;
    xb = x+dx;
    roots = [roots find_root_bisection(fun,xa,xb,tol)];
    x = x+dx;
end
end
