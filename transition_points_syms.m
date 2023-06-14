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

K=-40:0.1:-10;
q=1.1;
p_up = zeros(1,length(K));
p_low = zeros(1,length(K));
p_inf = zeros(1,length(K));
for i=1:length(K)
    tab = conf_fun_sym(get_roots(@(x)dp_symmetric(x,q,K(i)),0,0.5,0.001,1e-12),q,K(i));
    tab2_a = get_roots(@(x)ddp_symmetric(x,q,K(i)),0,0.5,0.001,1e-12);
    tab2 = conf_fun_sym(tab2_a,q,K(i));
    if isempty(tab)
        p_up(i) = nan;
        p_low(i) = nan;
    else
        p_up(i) = max(tab);
        p_low(i) = min(tab);
    end
    if isempty(tab2)
        p_inf(i)=nan;
        p_c(i)=nan;
    else
        [val,it]=max(tab2);
        p_inf(i)=val;
        p_c(i) = tab2_a(it);
    end
end
plot(K,p_up)
hold on
plot(K,p_low)
plot(K,4*(q-1)./(4*q-K),'k')
plot(K,p_inf)

for i=1:length(p_c)
    dp_s(i)=dp_symmetric(p_c(i),q,K(i));
end
figure
plot(p_inf,dp_s)
distance_p(q,-30)

Q=[1.001:0.05:8 8];
Kt = zeros(1,length(Q));
for i=1:length(Q)
    Kt(i)=fminsearch(@(x)distance_p(Q(i),x),-32);
end
figure
plot(Q,Kt,'.:')

function diff = distance_p(q,k)
    tab_a = get_roots(@(x)dp_symmetric(x,q,k),0,0.5,0.001,1e-12);
    tab_p = conf_fun_sym(tab_a,q,k);
    if isempty(tab_p)
        diff = 0;
    else
        %[val,it]=max(tab_p);
        diff = max(tab_p);
    end
    pc = 4*(q-1)/(4*q-k);
    diff = abs(diff - pc);
end

function dp = dp_symmetric(a,q,k)
    dp = (q*(2*a)^(q - 1) - 1)/((2*a)^q/2 - 1/(exp(-k*(a - 1/2)) + 1)) + ((q*(2*a)^(q - 1) - (k*exp(-k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^2)*(a - (2*a)^q/2))/((2*a)^q/2 - 1/(exp(-k*(a - 1/2)) + 1))^2;
end

function p = conf_fun_sym(a,q,k)
    p = (a-1/2*(2*a).^q)./(indiv_fun(a,k)-1/2*(2*a).^q);
end

function ddp = ddp_symmetric(a,q,k)
    ddp = ((a - (2*a)^q/2)*(2*q*(2*a)^(q - 2)*(q - 1) + (k^2*exp(-k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^2 - (2*k^2*exp(-2*k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^3))/((2*a)^q/2 - 1/(exp(-k*(a - 1/2)) + 1))^2 - (2*(q*(2*a)^(q - 1) - (k*exp(-k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^2)^2*(a - (2*a)^q/2))/((2*a)^q/2 - 1/(exp(-k*(a - 1/2)) + 1))^3 - (2*(q*(2*a)^(q - 1) - 1)*(q*(2*a)^(q - 1) - (k*exp(-k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^2))/((2*a)^q/2 - 1/(exp(-k*(a - 1/2)) + 1))^2 + (2*q*(2*a)^(q - 2)*(q - 1))/((2*a)^q/2 - 1/(exp(-k*(a - 1/2)) + 1));
end
