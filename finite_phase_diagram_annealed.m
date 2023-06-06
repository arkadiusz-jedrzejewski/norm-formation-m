clearvars; clc;% close all;

% model parameters
N = 500;
s = 0;
q = 7;
k = -15;
T = 1000000; % time horizon in Monte Carlo steps (1 MCS = N updates of the system)

% possible states
a = (0:N)/N;

% probability distibution of states
dist = zeros(N+1,1);
dist(1) = 1;    % initial state

% time horizon in updates
t = N*T;

P = 0:0.001:0.3;
a_mean = zeros(1,length(P));

for i=1:length(P)
    p = P(i)
    % transition matrix
    transition_matrix = get_tran_m_annealed(p, q, k, s, N);
    
    % evolution of probability distibution
    dist = transition_matrix^t*dist;
    a_mean(i) = max(a, 1-a)*dist;
end

plot(P, a_mean, '.:')