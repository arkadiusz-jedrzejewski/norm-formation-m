function [] = plot_diagram_pk(K, q)
    p_up = zeros(1,length(K));
    p_low = zeros(1,length(K));
    p_inf = zeros(1,length(K));
    for i=1:length(K)
        tab = conf_fun_sym(get_roots(@(x)dp_symmetric(x,q,K(i)),0,0.5,0.001,1e-12),q,K(i));
        tab2_a = get_roots(@(x)ddp_symmetric(x,q,K(i)),0,0.5,0.001,1e-12);
        tab2 = conf_fun_sym(tab2_a,q,K(i));
        if isempty(tab)
            p_up(i) = nan;
            p_low(i) = nan;
        else
            p_up(i) = max(tab);
            p_low(i) = min(tab);
        end
        if isempty(tab2)
            p_inf(i)=nan;
            %p_c(i)=nan;
        else
            [val,it]=max(tab2);
            p_inf(i)=val;
            %p_c(i) = tab2_a(it);
        end
    end
    plot(K,p_up)
    hold on
    plot(K,p_low)
    plot(K,4*(q-1)./(4*q-K),'k')
    xlabel('k')
    ylabel('p')
    title(['q=' num2str(q)])

    k_st=fminsearch(@(x)k_star(q,x),-25);
    c_infl=max(get_roots(@(x)ddp_symmetric(x,q,k_st),0,0.5,0.001,1e-12));
    p_infl = conf_fun_sym(c_infl,q,k_st);
    plot(k_st,p_infl,'.r')
    
    k_t=fminsearch(@(x)distance_p(q,x),-32);
    p_t= conf_fun_sym(get_roots(@(x)dp_symmetric(x,q,k_t),0,0.5,0.001,1e-12),q,k_t);
    plot(k_t,p_t,'.k')
%     for i=1:length(p_c)
%         dp_s(i)=dp_symmetric(p_c(i),q,K(i));
%     end
end