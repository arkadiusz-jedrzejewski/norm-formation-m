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
k=sort([-10:0.25:20, -8.56, -8.42]);
Q1 = -(2.^(1/2).*(-(k - 4).*(k.^3 - 50.*k + 200)).^(1/2) - 10*k + 40)./(4.*(k - 4));
tol = 1e-10;
idx1 = abs(imag(Q1))<tol;
Q1s = Q1(idx1);
K1s = k(idx1);

Q2 = (10*k + 2^(1/2)*(-(k - 4).*(k.^3 - 50*k + 200)).^(1/2) - 40)./(4*(k - 4));
idx2 = abs(imag(Q2))<tol;
Q2s = Q2(idx2);
K2s = k(idx2);

Q = [Q1s,Q2s];
[Q,inds] = sort(Q);
K=[K1s,K2s];
K=K(inds);

inds = Q>0.5 & Q<12;
Q=Q(inds);
K=K(inds);
plot(Q, K,'k-')
hold on
plot([q, q], [-12, 5],':k')
plot(q,k1,'.k')
plot(q,k_st,'.k')
plot(q,k2,'.k')

xlim([1,8])
ylim([-12 5])
xlabel('q')
ylabel('k^*(q)')