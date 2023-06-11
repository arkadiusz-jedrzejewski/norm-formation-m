function [stable] = is_stable(a,p,q,k,s,is_annealed,is_symmetric)
% function used to determine numerically the stability of fixed points for
% the model (with Bernoulli distribution in the quenched case)
if is_annealed
    % annealed case
    dF = -s+(1-s)*(p*(indiv_dfun(a,k)-1)+(1-p)*...
        ((1-a)*conf_dfun(a,q,is_symmetric)+a*conf_dfun(1-a,q,is_symmetric)-...
        conf_fun(a,q,is_symmetric)-conf_fun(1-a,q,is_symmetric)));
    stable = dF<0;
else
    % quenched case (Bernoulli disitribution if conformity function is
    % non-symmetric)
    a0 = (s/2+(1-s)*conf_fun(a,q,is_symmetric))/(s+(1-s)*(conf_fun(a,q,is_symmetric)+conf_fun(1-a,q,is_symmetric)));

    F00 = -s-(1-s)*conf_fun(a,q,is_symmetric)+(1-a0)*(1-s)*conf_dfun(a,q,is_symmetric)*(1-p)-...
        (1-s)*conf_fun(1-a,q,is_symmetric)+a0*(1-s)*conf_dfun(1-a)*(1-p);
    F01 = (1-a0)*(1-s)*conf_dfun(a,q,is_symmetric)*p+a0*(1-s)*conf_dfun(1-a)*p;
    F11 = (1-s)*indiv_dfun(a,k)*p-1;
    F10 = (1-s)*indiv_dfun(a,k)*(1-p);

    det = F00*F11-F01*F10;
    tra = F00 + F11;
    stable = (det>0) && (tra<0);
end
end