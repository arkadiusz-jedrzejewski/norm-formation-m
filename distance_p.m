function diff = distance_p(q,k)
% function used for finding the line for thich the upper border of
% matastable reagion coincides with the critical point
    tab_a = get_roots(@(x)dp_symmetric(x,q,k),0,0.5,0.001,1e-12);
    tab_p = conf_fun_sym(tab_a,q,k);
    if isempty(tab_p)
        diff = 0;
    else
        %[val,it]=max(tab_p);
        diff = max(tab_p);
    end
    pc = 4*(q-1)/(4*q-k);
    diff = abs(diff - pc);
end