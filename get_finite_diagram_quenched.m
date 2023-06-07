function [a_mean,a0_mean,a1_mean,P] = get_finite_diagram_quenched(s,q,k,N,T)
%   Detailed explanation goes here

% time horizon in updates
t = N*T;

% possible numbers of individual learners
N1_tab = 0:N;

% possible fraction of agents with option A
a = (0:N)/N;

P = N1_tab/N;
a_mean = zeros(1,length(P));
a0_mean = zeros(1,length(P));
a1_mean = zeros(1,length(P));

for i=1:length(N1_tab)
    N1 = N1_tab(i); % number of individual learners
    N0 = N - N1;    % number of social learners
    p = N1 / N;
    
    % possible fraction of social and individual learners with option A
    a0 = (0:N0)/N0;
    a1 = (0:N1)/N1;

    % probability distibution of states
    dist = zeros((N0+1)*(N1+1),1);
    dist(1) = 1;    % initial state

    % transition matrix
    transition_matrix = get_tran_m_quenched(q, k, s, N0, N1);
    
    % evolution of probability distibution
    dist = transition_matrix^t*dist;
    [dist_a, dist_a0, dist_a1] = get_quenched_dists(dist, N0, N1);

    a_mean(i) = max(a, 1-a)*dist_a;
    a0_mean(i) = max(a0, 1-a0)*dist_a0;
    a1_mean(i) = max(a1, 1-a1)*dist_a1;
end

end