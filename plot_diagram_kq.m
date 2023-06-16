function [] = plot_diagram_kq(Q,is_annealed,is_symmetric)
    Kt = zeros(1,length(Q));
    Kst = zeros(1,length(Q));
    for i=1:length(Q)
        [kt,fval] = fminsearch(@(x)distance_p(Q(i),x,is_annealed,is_symmetric),-25);
        if fval < 1e-4
            Kt(i) = kt;
        else
            Kt(i) = nan;
        end
        
        for j=1:1000
            k_guess = 5-rand*30;
            display(['q' num2str(Q(i)) ' ' num2str(j)])
            [kst,fval] = fminsearch(@(x)k_star(Q(i),x,is_annealed,is_symmetric),k_guess);
            if fval < 1e-4
                Kst(i) = kst;
                break;
            else
                Kst(i) = nan;
            end
        end
    end
    plot(Q,Kt,'.:')
    hold on
    plot(Q,Kst,'.:r')
    xlabel('q')
    ylabel('k')
end