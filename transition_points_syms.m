clearvars; clc; close all;

syms a q k

p = get_fixed_points(a,q,k,0,true)

d2p = -(4*2^q*(q - 1)*(k^3 + 8*k*q^2 - 40*k*q - 32*q^2 + 160*q))/(3*(8*q - 2^q*k + 4*2^q - 8)^2)

% q=1:0.1:8;
% k=3;
% pt_ns_ann = (q-1)./(q-1+2.^(q-1).*(1-k/4));
% 
% plot(q,pt_ns_ann)
ezplot(sol(2),[-40,4])