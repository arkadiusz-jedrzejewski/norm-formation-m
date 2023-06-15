function error = k_star(q,k,is_annealed,is_symmetric)
% function used for finding a line separating continuous and discontinuous
% phase transitions
    a_infl = max(get_roots(@(x)ddp_symmetric(x,q,k,is_annealed,is_symmetric),0,0.5,0.001,1e-12));
    %display(a_infl)
    error = abs(dp_symmetric(a_infl,q,k,is_annealed,is_symmetric));
end