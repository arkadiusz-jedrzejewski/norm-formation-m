function [] = plot_diagram_kq(Q)
    Kt = zeros(1,length(Q));
    Kst = zeros(1,length(Q));
    
    for i=1:length(Q)
        Kt(i)=fminsearch(@(x)distance_p(Q(i),x),-32);
        Kst(i)=fminsearch(@(x)k_star(Q(i),x),-25);
    end
    plot(Q,Kt,'.:')
    hold on
    plot(Q,Kst,'.:r')
    xlabel('q')
    ylabel('k')
end