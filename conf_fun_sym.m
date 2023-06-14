function p = conf_fun_sym(a,q,k)
    p = (a-1/2*(2*a).^q)./(indiv_fun(a,k)-1/2*(2*a).^q);
end