function [] = plot_diagram_pk(K, q, is_annealed, is_symmetric)
    p_up = zeros(1,length(K));
    p_low = zeros(1,length(K));
    p_inf_up = zeros(1,length(K));
    p_inf_low = zeros(1,length(K));
    for i=1:length(K)
        tab = get_fixed_points(get_roots(@(x)dp_symmetric(x,q,K(i), is_annealed, is_symmetric),0,0.5,0.003,1e-12),q,K(i),0 ,is_annealed, is_symmetric);
        tab2_a = get_roots(@(x)ddp_symmetric(x,q,K(i), is_annealed, is_symmetric),0,0.5,0.003,1e-12);
        tab2 = get_fixed_points(tab2_a,q,K(i), 0,is_annealed, is_symmetric);
        if isempty(tab)
            p_up(i) = nan;
            p_low(i) = nan;
        else
            p_up(i) = max(tab);
            p_low(i) = min(tab);
        end
        if isempty(tab2)
            p_inf_up(i)=nan;
            p_inf_low(i)=nan;
            %p_c(i)=nan;
        else
            p_inf_up(i)=max(tab2);
            p_inf_low(i)=min(tab2);
            %p_c(i) = tab2_a(it);
        end
    end
    plot(K,p_up)
    hold on
    plot(K,p_low)
    pc = get_critical_point(q,K,0,is_annealed,is_symmetric);
    plot(K,pc,'k')
    xlabel('k')
    ylabel('p')
    title(['q=' num2str(q)])
    plot(K,p_inf_low,'c')
    plot(K,p_inf_up,'c')

    for j=1:1000
        k_guess = 5-rand*30;
        [k_st, fval]=fminsearch(@(x)k_star(q,x, is_annealed, is_symmetric),k_guess);
        display(fval)
        if fval < 1e-4
            c_infl=max(get_roots(@(x)ddp_symmetric(x,q,k_st, is_annealed, is_symmetric),0,0.5,0.001,1e-12));
            p_infl = get_fixed_points(c_infl,q,k_st,0,is_annealed, is_symmetric);
            plot(k_st,p_infl,'.r')
            break;
        end
    end
    
    
    for j=1:1000
        k_guess = 5-rand*30;
        [k_t, fval] = fminsearch(@(x)distance_p(q,x, is_annealed, is_symmetric),k_guess);
        display(j)
        if fval < 1e-4
            p_t= get_fixed_points(get_roots(@(x)dp_symmetric(x,q,k_t, is_annealed, is_symmetric),0,0.5,0.001,1e-12),q,k_t,0,is_annealed, is_symmetric);
            plot(k_t,max(p_t),'.k')
            break;
        end
    end
%     for i=1:length(p_c)
%         dp_s(i)=dp_symmetric(p_c(i),q,K(i));
%     end
end