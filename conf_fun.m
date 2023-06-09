function [prob] = conf_fun(x,q,is_symmetric)
% conformity function representing social learning
% non-symmetric conformity function - the nonlinear q-voter model
if is_symmetric
    prob = 0.5*(2.*x).^q;
    prob(x>=0.5)=1-0.5.*(2.*(1-x(x>=0.5))).^q;
else
    prob = x.^q;
end
end