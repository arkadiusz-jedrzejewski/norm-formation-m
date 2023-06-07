clearvars; clc; close all;

% model parameters
N = 40;  % number of all learners
k = 0;
q = 2;
s = 0;
T = 40000; % time horizon in Monte Carlo steps (1 MCS = N updates of the system)

[a_mean,a0_mean,a1_mean,P] = get_finite_diagram_quenched(s,q,k,N,T);

plot(P, a_mean, '.:')
hold on
plot(P, a0_mean, '.:')
plot(P, a1_mean, '.:')