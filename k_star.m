function error = k_star(q,k)
% function used for finding a line separating continuous and discontinuous
% phase transitions
    a_infl = max(get_roots(@(x)ddp_symmetric(x,q,k),0,0.5,0.001,1e-12));
    %display(a_infl)
    error = abs(dp_symmetric(a_infl,q,k));
end