clearvars; clc; close all;

a=0:0.001:1;
K=3.9;
s=0;
q=20;
%annealed model
for i=1:length(K)
    k=K(i);
    [p] = get_fixed_points(a,q,k,s,false);

    plot(p,a)
    title(['q=' num2str(q) ' k=' num2str(k)])
    xlim([0 1])
    xlabel('p')
    ylabel('a^*')
    drawnow;
    
end