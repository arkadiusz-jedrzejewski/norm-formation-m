clearvars; clc;% close all;

% model parameters
N = 500;
s = 0;
q = 7;
k = -15;
T = 10000; % time horizon in Monte Carlo steps (1 MCS = N updates of the system)
P = 0:0.001:0.3;

a_mean = get_finite_diagram(P,s,q,k,N,T);

plot(P, a_mean, '.:')