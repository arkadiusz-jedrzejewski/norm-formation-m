clearvars; clc; %close all; 

% model parameters
N = 100;
s = 0;
p = 0.1;
q = 3;
k = -15;
T = 1000; % time horizon in Monte Carlo steps (1 MCS = N updates of the system)

% possible states
a = (0:N)/N;

% probability distibution of states
dist = zeros(N+1,1);
dist(1) = 1;    % initial state

% time horizon in updates
t = N*T;

% transition matrix
transition_matrix = get_tran_m_annealed(p, q, k, s, N);

% evolution of probability distibution
dist = transition_matrix^t*dist;

plot(a, dist,':.')
xlabel('a')
ylabel('probability')
title(['annealed model s=' num2str(s) ' p=' num2str(p) ' q=' num2str(q) ' k=' num2str(k) ' T=' num2str(T)])

% plotting time evolution of probability disitbution
dist = zeros(N+1,1);
dist(1) = 1;
for t=1:T
    dist = transition_matrix^N*dist;
    plot(a, dist,':.')
    xlabel('a')
    ylabel('probability')
    title(['annealed model s=' num2str(s) ' p=' num2str(p) ' q=' num2str(q) ' k=' num2str(k) ' T=' num2str(t)])
    drawnow
end