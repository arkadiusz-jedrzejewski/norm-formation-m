clearvars; clc; close all;

a=0:0.001:1;
K=-20:0.5:4;
s=0;
q=2;
%annealed model
for i=1:length(K)
    k=K(i);
    [p,stable] = get_fixed_points(a,q,k,s,true,true);
    stable = logical(stable);
    ps = p;
    ps(~stable)=nan;
    pu = p;
    pu(stable)=nan;
    plot(ps,a,'k')
    hold on
    plot(pu,a,'r')
    title(['q=' num2str(q) ' k=' num2str(k)])
    xlim([0 1])
    xlabel('p')
    ylabel('a^*')
    hold off
    drawnow;
    
end