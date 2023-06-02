function [transition_matrix] = get_tran_m_annealed(p, q, k, s, N)
% returns transition matrix for the annealed version of the model

a = (0:N)/N;  % possible states - possible fraction of agents with option A

p_ba = s/2+(1-s)*(p*indiv_fun(a,k)+(1-p)*conform_fun(a,q)); 
p_ab = s/2+(1-s)*(p*(1-indiv_fun(a,k))+(1-p)*conform_fun(1-a,q)); 

p_p = (1-a).*p_ba;      % transition probability that the fraction of agents with option A increases
p_m = a.*p_ab;          % transition probability that the fraction of agents with option A decreases
p_0 = 1 - p_p - p_m;    % transition probability that the fraction of agents with option A remains unchanged

transition_matrix = diag(p_0)+diag(p_m(2:end),1)+diag(p_p(1:end-1),-1);
end

