function [dp] = conf_dfun(x,q,is_symmetric)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if is_symmetric
    if q==0
        dp = 0;
    else
        if (0.5>x) && (x>=0)
            dp = q*(2*x)^(q-1);
        elseif (0.5<=x) && (x<=1)
            dp = q*(2*(1-x))^(q-1);
        else
            dp = 0;
        end
    end
else
    if q==0
        dp = 0;
    else
        dp = q*x^(q-1);
    end
end
end