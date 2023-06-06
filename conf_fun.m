function [prob] = conf_fun(x,q)
% conformity function representing social learning
% non-symmetric conformity function - the nonlinear q-voter modelconf_
prob = x.^q;
end