clearvars; clc; close all;

%syms a q k s

%p = get_fixed_points(a,q,k,0,true,true)

%annaled
%d2p = -(4*2^q*(q - 1)*(k^3 + 8*k*q^2 - 40*k*q - 32*q^2 + 160*q))/(3*(8*q - 2^q*k + 4*2^q - 8)^2)

% q(k) solve(limit(diff(p,a,2),a,1/2)==0,q)
%                                                                      1
% -(2^(1/2)*(-(k - 4)*(k^3 - 50*k + 200))^(1/2) - 10*k + 40)/(4*(k - 4))
%  (10*k + 2^(1/2)*(-(k - 4)*(k^3 - 50*k + 200))^(1/2) - 40)/(4*(k - 4))

% q=1:0.1:8;
% k=3;
% pt_ns_ann = (q-1)./(q-1+2.^(q-1).*(1-k/4));
% 
% % plot(q,pt_ns_ann)
% ezplot(sol(2),[-40,4])

%quenched

% q(k) solve(limit(diff(p,a,2),a,1/2)==0,q)
%                                                                1
%  (((k - 2)*(k - 4)*(k^2 + 2*k + 8))^(1/2) - 2*k + 8)/(4*(k - 4))
% -(2*k + ((k - 2)*(k - 4)*(k^2 + 2*k + 8))^(1/2) - 8)/(4*(k - 4))

%symmetric
% consider only 0<=a<0.5 (since this function is symmetric along a=1/2)
% p = (a-1/2*(2*a)^q)/(indiv_fun(a,k)-1/2*(2*a)^q)
% dp = diff(p,a)

K=-50:0.1:-10;
q=8;
plot_diagram_pk(K, q)

Q=[1.001:0.05:8 8];
figure
plot_diagram_kq(Q)



