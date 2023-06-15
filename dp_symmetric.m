function dp = dp_symmetric(a,q,k,is_annealed,is_symmetric)
    if is_symmetric
        dp = (q*(2*a)^(q - 1) - 1)/((2*a)^q/2 - 1/(exp(-k*(a - 1/2)) + 1)) + ((q*(2*a)^(q - 1) - (k*exp(-k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^2)*(a - (2*a)^q/2))/((2*a)^q/2 - 1/(exp(-k*(a - 1/2)) + 1))^2;
    else
        if is_annealed
            dp = (a^q - a^(q - 1)*q - a*(q*(1 - a)^(q - 1) - a^(q - 1)*q) + (1 - a)^q)/(a*(a^q + (1 - a)^q - 1) - a^q + 1/(exp(-k*(a - 1/2)) + 1)) + ((a^q - a*(a^q + (1 - a)^q))*(a^q - a^(q - 1)*q - a*(q*(1 - a)^(q - 1) - a^(q - 1)*q) + (1 - a)^q + (k*exp(-k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^2 - 1))/(a*(a^q + (1 - a)^q - 1) - a^q + 1/(exp(-k*(a - 1/2)) + 1))^2;
        else
            dp = - ((exp(k*(a - 1/2)) + 1)*(a^q*q + a^q - a^(q - 1)*q + (1 - a)^q - a*q*(1 - a)^(q - 1)))/(a^q - exp(k*(a - 1/2))*(1 - a)^q) - ((exp(k*(a - 1/2)) + 1)^2*(a*(1 - a)^q - a^q + a*a^q)*((k*exp(-k*(a - 1/2))*(a^q + (1 - a)^q))/(exp(-k*(a - 1/2)) + 1)^2 - a^(q - 1)*q + (q*(a*(1 - a)^q - a^q + a*a^q))/(a*(exp(-k*(a - 1/2)) + 1)*(a - 1))))/(a^q - exp(k*(a - 1/2))*(1 - a)^q)^2;
        end
    end
end