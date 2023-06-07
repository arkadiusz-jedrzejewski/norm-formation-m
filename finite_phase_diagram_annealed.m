clearvars; clc; %close all;

% model parameters
N = 3200;
s = 0;
q = 2;
k = 0;
T = 10000; % time horizon in Monte Carlo steps (1 MCS = N updates of the system)
P = linspace(0,0.4,80);

a_mean = get_finite_diagram(P,s,q,k,N,T);

plot(P, a_mean, '.:')
hold on
% 
% a = 0:0.01:1;
% p = get_fixed_points(a,q,k,s,true);
% plot(p, a, 'k')