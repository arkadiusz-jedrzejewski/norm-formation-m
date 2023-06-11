function [stable] = is_stable(a,p,q,k,s,is_annealed,is_symmetric)
% function used to determine numerically the stability of fixed points for
% the model (with Bernoulli distribution in the quenched case)
if is_annealed
    % annealed case
    stable = true;
else
    % quenched case (Bernoulli disitribution if conformity function is
    % non-symmetric)
    stable = false;
end
end