function [prob] = indiv_fun(x, k)
% individual learning function
prob = 1./(1+exp(-k*(x-0.5)));
end
