clearvars; clc; close all;

a=0:0.01:1;
s=0;
q=4;

subplot(2,2,1)
k1=-10;
plot_diagram(a,q,k1,s,true,false)
xlim([0, 0.2])
xlabel('p')
ylabel('a^*')
title('k<k^*(q)')

plot([0, 0.2], [0.5, 0.5], 'k:')

subplot(2,2,2)
for j=1:1000
    k_guess = 5-rand*30;
    [k_st, fval]=fminsearch(@(x)k_star(q,x, true, false),k_guess);
    if fval < 1e-4 && k_st < 4
        break;
     end
end
plot_diagram(a,q,k_st,s,true,false)
xlim([0, 0.2])
xlabel('p')
ylabel('a^*')
title('k=k^*(q)')


subplot(2,2,3)
k2=-4;
plot_diagram(a,q,k2,s,true,false)
xlim([0, 0.2])
xlabel('p')
ylabel('a^*')
title('k>k^*(q)')

subplot(2,2,4)
k=-15:0.01:4;
Q = -(2.^(1/2).*(-(k - 4).*(k.^3 - 50.*k + 200)).^(1/2) - 10*k + 40)./(4.*(k - 4));

tol = 1e-20;
idx = abs(imag(Q))<tol;
plot(Q(idx), k(idx),'k')
hold on

Q = (10*k + 2^(1/2)*(-(k - 4).*(k.^3 - 50*k + 200)).^(1/2) - 40)./(4*(k - 4));

tol = 1e-10;
idx = abs(imag(Q))<tol;
plot(Q(idx), k(idx),'k')

plot([q, q], [-12, 5],':k')
plot(q,k1,'.k')
plot(q,k_st,'.k')
plot(q,k2,'.k')

xlim([1,8])
ylim([-12 5])
xlabel('q')
ylabel('k^*(q)')