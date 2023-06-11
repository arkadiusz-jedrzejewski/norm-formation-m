function [] = plot_diagram(a,q,k,s,is_annealed,is_symmetric)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[p,stable] = get_fixed_points(a,q,k,s,is_annealed,is_symmetric);
stable = logical(stable);
ps = p;
ps(~stable)=nan;
pu = p;
pu(stable)=nan;
plot(ps,a,'k')
hold on
plot(pu,a,'--k')
hold off
end