clearvars; clc; close all;

a=0:0.001:1;
s=0;
q=3;

subplot(3,2,1)
k=-15;
xlim_max = 0.7;
p = get_fixed_points(a,q,k,s,true,true);
plot(p,a,'k')
xlim([0, xlim_max])
xlabel('p')
ylabel('a^*')
title(['symmetric q=' num2str(q) ' k=' num2str(k)])

hold on
plot([0, 1], [0.5, 0.5], 'k:')

subplot(3,2,2)
p = get_fixed_points(a,q,k,s,false,false);
plot(p,a,'b')
xlim([0, xlim_max])
xlabel('p')
ylabel('a^*')
title(['non-symmetric q=' num2str(q) ' k=' num2str(k)])

hold on
p = get_fixed_points(a,q,k,s,true,false);
plot(p,a,'k')
plot([0, 1], [0.5, 0.5], 'k:')
legend('quenched','annealed')

subplot(3,2,3)
k=0;
xlim_max = 1;
p = get_fixed_points(a,q,k,s,true,true);
plot(p,a,'k')
xlim([0, xlim_max])
xlabel('p')
ylabel('a^*')
title(['symmetric q=' num2str(q) ' k=' num2str(k)])

hold on
plot([0, 1], [0.5, 0.5], 'k:')

subplot(3,2,4)
p = get_fixed_points(a,q,k,s,false,false);
plot(p,a,'b')
xlim([0, xlim_max])
xlabel('p')
ylabel('a^*')
title(['non-symmetric q=' num2str(q) ' k=' num2str(k)])

hold on
p = get_fixed_points(a,q,k,s,true,false);
plot(p,a,'k')
plot([0, 1], [0.5, 0.5], 'k:')
legend('quenched','annealed')

subplot(3,2,5)
k=3;
xlim_max = 1;
p = get_fixed_points(a,q,k,s,true,true);
plot(p,a,'k')
xlim([0, xlim_max])
xlabel('p')
ylabel('a^*')
title(['symmetric q=' num2str(q) ' k=' num2str(k)])

hold on
plot([0, 1], [0.5, 0.5], 'k:')

subplot(3,2,6)
p = get_fixed_points(a,q,k,s,false,false);
plot(p,a,'b')
xlim([0, xlim_max])
xlabel('p')
ylabel('a^*')
title(['non-symmetric q=' num2str(q) ' k=' num2str(k)])

hold on
p = get_fixed_points(a,q,k,s,true,false);
plot(p,a,'k')
plot([0, 1], [0.5, 0.5], 'k:')
legend('quenched','annealed')