clearvars; clc; close all;

a=0:0.0001:1;
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
p_t= conf_fun_sym(get_roots(@(x)dp_symmetric(x,q,k_t,true,true),0,0.5,0.001,1e-12),q,k_t);
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
c_infl=max(get_roots(@(x)ddp_symmetric(x,q,k_st,true,true),0,0.5,0.001,1e-12));
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
plot_diagram_kq(Q)
xlim([min(Q) max(Q)])
plot([q, q], [-50, -10],':k')
plot(q,k1,'.k')
plot(q,k_t,'.k')
plot(q,k2,'.k')
plot(q,k_st,'.k')
plot(q,k3,'.k')