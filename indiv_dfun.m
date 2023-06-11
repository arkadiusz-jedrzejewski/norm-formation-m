function [dp] = indiv_dfun(x, k)
% returns derivative with respect to x evaluated at x
if k==0
    dp = 0;
else
    dp = k*exp(-k*(x-0.5))/(1+exp(-k*(x-0.5)))^2;
end
end