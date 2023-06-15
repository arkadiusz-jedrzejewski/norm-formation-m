function diff = distance_p(q,k, is_annealed, is_symmetric)
% function used for finding the line for thich the upper border of
% matastable reagion coincides with the critical point
    tab_a = get_roots(@(x)dp_symmetric(x,q,k, is_annealed, is_symmetric),0,0.5,0.001,1e-12);
    tab_p = get_fixed_points(tab_a,q,k,0,is_annealed,is_symmetric);
    if isempty(tab_p)
        diff = 0;
    else
        %[val,it]=max(tab_p);
        diff = max(tab_p);
    end
    %pc = 4*(q-1)/(4*q-k);
    pc = get_critical_point(q,k,0,is_annealed,is_symmetric);
    diff = abs(diff - pc);
end