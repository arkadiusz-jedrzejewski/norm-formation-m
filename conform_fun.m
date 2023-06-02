function [prob] = conform_fun(x,q)
%   conformity function
%   non-simmetric conformity fucntion as in the nonlinear q-voter model
prob = x.^q;
end