clearvars; clc; close all;

a=0:0.0001:1;
s=0;
q=4;

subplot(2,2,1)
k=-30;
plot_diagram(a,q,k,s,false,false)
xlim([0, 0.6])
xlabel('p')
ylabel('a^*')
title('k<k^*(q)')

plot([0, 0.6], [0.5, 0.5], 'k:')

subplot(2,2,2)
k=-19.63;
plot_diagram(a,q,k,s,false,false)
xlim([0, 0.6])
xlabel('p')
ylabel('a^*')
title('k=k^*(q)')


subplot(2,2,3)
k=-10;
plot_diagram(a,q,k,s,false,false)
xlim([0, 0.6])
xlabel('p')
ylabel('a^*')
title('k>k^*(q)')

subplot(2,2,4)
k=-50:0.01:4;
q = -(2*k + ((k - 2).*(k - 4).*(k.^2 + 2*k + 8)).^(1/2) - 8)./(4*(k - 4));

plot(q, k,'k')


xlim([1,8])
xlabel('q')
ylabel('k^*(q)')
