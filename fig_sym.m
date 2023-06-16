clearvars; clc; close all;

a=0:0.001:1;
s=0;
q=4;

subplot(3,3,9)
k1=-35;
plot_diagram(a,q,k1,s,true,true)
xlim([0.21, 0.3])
xlabel('p')
ylabel('a^*')

subplot(3,3,6)
k_t=fminsearch(@(x)distance_p(q,x,true,true),-32)
k=k_t;
plot_diagram(a,q,k,s,true,true)
xlim([0.21, 0.3])
xlabel('p')
ylabel('a^*')

subplot(3,3,3)
k2=-27;
plot_diagram(a,q,k2,s,true,true)
xlim([0.21, 0.3])
xlabel('p')
ylabel('a^*')

subplot(3,3,2)
k_st=fminsearch(@(x)k_star(q,x,true,true),-25)
k=k_st;
plot_diagram(a,q,k,s,true,true)
xlim([0.2, 0.35])
xlabel('p')
ylabel('a^*')

subplot(3,3,1)
k3=-20;
plot_diagram(a,q,k3,s,true,true)
xlim([0.2, 0.35])
xlabel('p')
ylabel('a^*')


subplot(3,3,[4 5 7 8])
Q=[1.001:0.5:8 8];
plot_diagram_kq(Q,true,true)
xlim([min(Q) max(Q)])
plot([q, q], [-50, -10],':k')
plot(q,k1,'.k')
plot(q,k_t,'.k')
plot(q,k2,'.k')
plot(q,k_st,'.k')
plot(q,k3,'.k')