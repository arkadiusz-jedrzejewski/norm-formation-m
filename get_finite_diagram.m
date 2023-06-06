function [a_mean] = get_finite_diagram(P,s,q,k,N,T)
% return the diagram for a finite system and annealed model

% possible states
a = (0:N)/N;

% time horizon in updates
t = N*T;

a_mean = zeros(1,length(P));

for i=1:length(P)
    p = P(i);

    % probability distibution of states
    dist = zeros(N+1,1);
    dist(1) = 1;    % initial state

    % transition matrix
    transition_matrix = get_tran_m_annealed(p, q, k, s, N);
   
    % evolution of probability distibution
    dist = transition_matrix^t*dist;

    a_mean(i) = max(a, 1-a)*dist;
end
end