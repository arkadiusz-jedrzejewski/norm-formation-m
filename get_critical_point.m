function [pc] = get_critical_point(q,k,s,is_annealed,is_symmetric)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if is_symmetric
    pc = 4*(q-1-q*s)./((1-s)*(4*q-k));
else
    if is_annealed
        pc = (q-1-s*(q-1+2^(q-1)))./((1-s)*(q-1+2^(q-1)*(1-k/4)));
    else
        pc = (4*(q-1)-4*s*(q-1+2^(q-1)))./((1-s)*(4*q-k+k*s*(1-2^(q-1))));
    end
end