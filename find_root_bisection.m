function [root] = find_root_bisection(fun,a,b,tol)
% returns a if it is a root or searches interval [a,b) for a root 
% right limit b is not included, i.e., root x is discarted if it is too
% close to b: abs(b-x)<x_tol where x_tol is tolerance 
% a root is defined as x for which abs(fun(x))<tol

x_tol = tol*10000;

bf = b;
fa = fun(a);
fb = fun(b);

if abs(fa)<tol
    % a is a root
    root = a;
    return;
end

if fa*fb>0
    % there is no root within the interval
    root = [];
    return;
end


% bisection algorithm 
while abs(b-a)>x_tol
    mid = (a+b)/2;
    fmid = fun(mid);

    if abs(fmid)<tol
        root = mid;
        if abs(root-bf)<x_tol
            root=[];
        end
        return;
    elseif fmid*fa<0
        b = mid;
        fb = fmid;
    else
        a = mid;
        fa = fmid;
    end
end
root =  (a+b)/2;

if abs(root-bf)<x_tol
    root=[];
end

end