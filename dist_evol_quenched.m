clearvars; clc; close all;

% model parameters
N0 = 100;    % number of social learners
N1 = 60;    % number of individual learners
N = N0+N1;  % number of all learners
k = -15;
q = 3;
s = 0;
T = 100; % time horizon in Monte Carlo steps (1 MCS = N updates of the system)

% time horizon in updates
t = N*T;

% possible fraction of agents with option A
a = (0:N)/N;

% probability distibution of states
dist = zeros((N0+1)*(N1+1),1);
dist(1) = 1;    % initial state

% transition matrix
transition_matrix = get_tran_m_quenched(q, k, s, N0, N1);

% evolution of probability distibution
dist = transition_matrix^t*dist;

dist_a = zeros(1,N+1);
for i=1:N0+1
    for j=1:N1+1
        dist_a(i+j-1)=dist_a(i+j-1)+dist((i-1)*(N1+1)+j);
    end
end

plot(a, dist_a, ':.')
xlabel('a')
ylabel('probability')
title(['quenched model s=' num2str(s) ' N0=' num2str(N0) ' N1=' num2str(N1) ' q=' num2str(q) ' k=' num2str(k) ' T=' num2str(T)])