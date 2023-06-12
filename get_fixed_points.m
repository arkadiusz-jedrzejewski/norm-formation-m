function [p, stable] = get_fixed_points(a,q,k,s,is_annealed,is_symmetric)
% returns fixed points of the model (p, a)
% annealed mode: valid for any ditribution of inclinations towards
% individual learning (p is the mean of the distibution)
% quenched mode: valid only for Bernoulli distibution of inclinations
% towards individual learning (p i the mean of the distibution) (for other
% distibutions, fixed points can be carculated as it is presented in the
% manuscript)

p_num = s*(a-1/2)+(1-s)*(a.*(conf_fun(a,q,is_symmetric)+conf_fun(1-a,q,is_symmetric))-conf_fun(a,q,is_symmetric));
if is_annealed
    p_den = (1-s)*(a.*(conf_fun(1-a,q,is_symmetric)+conf_fun(a,q,is_symmetric)-1)-conf_fun(a,q,is_symmetric)+indiv_fun(a,k));
else
    p_den = (s/2+(1-s)*indiv_fun(a,k)).*(s+(1-s)*(conf_fun(a,q,is_symmetric)+conf_fun(1-a,q,is_symmetric)))-s/2-(1-s)*conf_fun(a,q,is_symmetric);
end
p = p_num./p_den;

stable = zeros(1,length(p));
for i=1:length(p)
    stable(i) = is_stable(a(i),p(i),q,k,s,is_annealed,is_symmetric);
end
end