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
K = 3.5:0.0001:3.97;
q=8.7;
p_up = zeros(1,length(K));
    p_low = zeros(1,length(K));
    p_infu = zeros(1,length(K));
    p_infl = zeros(1,length(K));
    for i=1:length(K)
        tab = get_fixed_points(get_roots(@(x)dp_symmetric(x,q,K(i),true,false),0,0.5,0.0003,1e-12),q,K(i),0,true,false);
        tab2_a = get_roots(@(x)ddp_symmetric(x,q,K(i),true,false),0,0.5,0.003,1e-12);
        tab2 = get_fixed_points(tab2_a,q,K(i),0,true,false);
        if isempty(tab)
            p_up(i) = nan;
            p_low(i) = nan;
        else
            p_up(i) = max(tab);
            p_low(i) = min(tab);
        end
        if isempty(tab2)
            p_infu(i)=nan;
            p_infl(i)=nan;
            %p_c(i)=nan;
        else
            p_infl(i)=min(tab2);
            p_infu(i)=max(tab2);
        end
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
    plot(K,p_infu,'c')
    plot(K,p_infl,'c')

    figure
K = -40:0.05:3.97;
q=4;
plot_diagram_pk(K, q,false,false)