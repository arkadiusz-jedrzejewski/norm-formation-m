clearvars; clc; close all;

% syms a q k s
% 
% p = get_fixed_points(a,q,k,0,false,false)

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

% K=-50:0.1:-10;
% q=8;
% plot_diagram_pk(K, q)

% Q=[1.001:0.05:8 8];
% figure
% plot_diagram_kq(Q)

figure(2)
K = -40:0.1:4;
q=8;
p_up = zeros(1,length(K));
    p_low = zeros(1,length(K));
    p_inf = zeros(1,length(K));
    for i=1:length(K)
        tab = get_fixed_points(get_roots(@(x)dp_nonsymmetric(x,q,K(i),true),0,1,0.003,1e-12),q,K(i),0,true,false);
%         tab2_a = get_roots(@(x)ddp_symmetric(x,q,K(i)),0,0.5,0.001,1e-12);
%         tab2 = conf_fun_sym(tab2_a,q,K(i));
        if isempty(tab)
            p_up(i) = nan;
            p_low(i) = nan;
        else
            p_up(i) = max(tab);
            p_low(i) = min(tab);
        end
%         if isempty(tab2)
%             p_inf(i)=nan;
%             %p_c(i)=nan;
%         else
%             [val,it]=max(tab2);
%             p_inf(i)=val;
%             %p_c(i) = tab2_a(it);
%         end
    end
    pc = (q-1)./(q-1+2^(q-1)*(1-K/4));
    %pc = (4*(q-1))./(4*q-K);
    plot(K,pc,'k')
    hold on
    plot(K,p_up,'b')
    plot(K,p_low,'--r')
    xlabel('k')
    ylabel('p')
    title(['q=' num2str(q)])


function [dp] = dp_nonsymmetric(a,q,k,is_annealed)
if is_annealed
    dp = (a^q - a^(q - 1)*q - a*(q*(1 - a)^(q - 1) - a^(q - 1)*q) + (1 - a)^q)/(a*(a^q + (1 - a)^q - 1) - a^q + 1/(exp(-k*(a - 1/2)) + 1)) + ((a^q - a*(a^q + (1 - a)^q))*(a^q - a^(q - 1)*q - a*(q*(1 - a)^(q - 1) - a^(q - 1)*q) + (1 - a)^q + (k*exp(-k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^2 - 1))/(a*(a^q + (1 - a)^q - 1) - a^q + 1/(exp(-k*(a - 1/2)) + 1))^2;
else
    dp = - ((exp(k*(a - 1/2)) + 1)*(a^q*q + a^q - a^(q - 1)*q + (1 - a)^q - a*q*(1 - a)^(q - 1)))/(a^q - exp(k*(a - 1/2))*(1 - a)^q) - ((exp(k*(a - 1/2)) + 1)^2*(a*(1 - a)^q - a^q + a*a^q)*((k*exp(-k*(a - 1/2))*(a^q + (1 - a)^q))/(exp(-k*(a - 1/2)) + 1)^2 - a^(q - 1)*q + (q*(a*(1 - a)^q - a^q + a*a^q))/(a*(exp(-k*(a - 1/2)) + 1)*(a - 1))))/(a^q - exp(k*(a - 1/2))*(1 - a)^q)^2;
end
end
