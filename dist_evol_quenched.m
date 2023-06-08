clearvars; clc; close all;

% model parameters
N0 = 1;    % number of social learners
N1 = 19;    % number of individual learners
N = N0+N1;  % number of all learners
k = -15;
q = 3;
s = 0;
T = 4000; % time horizon in Monte Carlo steps (1 MCS = N updates of the system)

% time horizon in updates
t = N*T;

% possible fraction of agents with option A
a = (0:N)/N;
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

plot(a, dist_a, ':.')   % dist for all learners
hold on
plot(a0, dist_a0, ':.') % dist for social learners
plot(a1, dist_a1, ':.') % dist for individual learners

xlabel('a')
ylabel('probability')
title(['quenched model s=' num2str(s) ' N0=' num2str(N0) ' N1=' num2str(N1) ' q=' num2str(q) ' k=' num2str(k) ' T=' num2str(T)])
legend('all', 'social', 'individual')
hold off

% plotting time evolution of probability disitbution
dist = zeros((N0+1)*(N1+1),1);
dist(1) = 1;    % initial state
for t=1:T
    dist = transition_matrix^N*dist;
    [dist_a,dist_a0,dist_a1] = get_quenched_dists(dist, N0, N1);

    plot(a, dist_a, ':.')   % dist for all learners
    hold on
    plot(a0, dist_a0, ':.') % dist for social learners
    plot(a1, dist_a1, ':.') % dist for individual learners

    xlabel('a')
    ylabel('probability')
    title(['quenched model s=' num2str(s) ' N0=' num2str(N0) ' N1=' num2str(N1) ' q=' num2str(q) ' k=' num2str(k) ' T=' num2str(t)])
    legend('all', 'social', 'individual')
    hold off
    drawnow
end