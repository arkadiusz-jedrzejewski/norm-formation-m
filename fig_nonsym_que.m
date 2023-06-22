clearvars; clc; close all;

a=0:0.01:1;
s=0;
q=4;

subplot(2,2,1)
k1=-30;
plot_diagram(a,q,k1,s,false,false)
xlim([0, 0.6])
xlabel('p')
ylabel('a^*')
title('k<k^*(q)')

plot([0, 0.6], [0.5, 0.5], 'k:')

subplot(2,2,2)
for j=1:1000
    k_guess = 5-rand*30;
    [k_st, fval]=fminsearch(@(x)k_star(q,x, false, false),k_guess);
    if fval < 1e-4 && k_st < 4
        break;
     end
end
plot_diagram(a,q,k_st,s,false,false)
xlim([0, 0.6])
xlabel('p')
ylabel('a^*')
title('k=k^*(q)')


subplot(2,2,3)
k2=-10;
plot_diagram(a,q,k2,s,false,false)
xlim([0, 0.6])
xlabel('p')
ylabel('a^*')
title('k>k^*(q)')

subplot(2,2,4)
k=-50:0.01:0;
Q = -(2*k + ((k - 2).*(k - 4).*(k.^2 + 2*k + 8)).^(1/2) - 8)./(4*(k - 4));
inds = Q >0.5 & Q<8.5;
Q=Q(inds);
k=k(inds);
step=100;
Q=Q(1:step:end);
k=k(1:step:end);

plot(Q, k,'k-')
hold on
plot([q, q], [-50, 0],':k')
plot(q,k1,'.k')
plot(q,k_st,'.k')
plot(q,k2,'.k')
xlim([1,8])
ylim([-40 0])
xlabel('q')
ylabel('k^*(q)')
