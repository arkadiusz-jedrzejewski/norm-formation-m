function ddp = ddp_symmetric(a,q,k,is_annealed,is_symmetric)
    if is_symmetric
        ddp = ((a - (2*a)^q/2)*(2*q*(2*a)^(q - 2)*(q - 1) + (k^2*exp(-k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^2 - (2*k^2*exp(-2*k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^3))/((2*a)^q/2 - 1/(exp(-k*(a - 1/2)) + 1))^2 - (2*(q*(2*a)^(q - 1) - (k*exp(-k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^2)^2*(a - (2*a)^q/2))/((2*a)^q/2 - 1/(exp(-k*(a - 1/2)) + 1))^3 - (2*(q*(2*a)^(q - 1) - 1)*(q*(2*a)^(q - 1) - (k*exp(-k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^2))/((2*a)^q/2 - 1/(exp(-k*(a - 1/2)) + 1))^2 + (2*q*(2*a)^(q - 2)*(q - 1))/((2*a)^q/2 - 1/(exp(-k*(a - 1/2)) + 1));
    else
        if is_annealed
            ddp = - (2*q*(1 - a)^(q - 1) - a*(a^(q - 2)*q*(q - 1) + q*(1 - a)^(q - 2)*(q - 1)) - 2*a^(q - 1)*q + a^(q - 2)*q*(q - 1))/(a*(a^q + (1 - a)^q - 1) - a^q + 1/(exp(-k*(a - 1/2)) + 1)) - (2*(a^q - a^(q - 1)*q - a*(q*(1 - a)^(q - 1) - a^(q - 1)*q) + (1 - a)^q)*(a^q - a^(q - 1)*q - a*(q*(1 - a)^(q - 1) - a^(q - 1)*q) + (1 - a)^q + (k*exp(-k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^2 - 1))/(a*(a^q + (1 - a)^q - 1) - a^q + 1/(exp(-k*(a - 1/2)) + 1))^2 - ((a^q - a*(a^q + (1 - a)^q))*(2*q*(1 - a)^(q - 1) - a*(a^(q - 2)*q*(q - 1) + q*(1 - a)^(q - 2)*(q - 1)) - 2*a^(q - 1)*q + a^(q - 2)*q*(q - 1) + (k^2*exp(-k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^2 - (2*k^2*exp(-2*k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^3))/(a*(a^q + (1 - a)^q - 1) - a^q + 1/(exp(-k*(a - 1/2)) + 1))^2 - (2*(a^q - a*(a^q + (1 - a)^q))*(a^q - a^(q - 1)*q - a*(q*(1 - a)^(q - 1) - a^(q - 1)*q) + (1 - a)^q + (k*exp(-k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^2 - 1)^2)/(a*(a^q + (1 - a)^q - 1) - a^q + 1/(exp(-k*(a - 1/2)) + 1))^3;
        else
            ddp = ((exp(k*(a - 1/2)) + 1)*(2*q*(1 - a)^(q - 1) - a*(a^(q - 2)*q*(q - 1) + q*(1 - a)^(q - 2)*(q - 1)) - 2*a^(q - 1)*q + a^(q - 2)*q*(q - 1)))/(a^q - exp(k*(a - 1/2))*(1 - a)^q) - (2*(exp(k*(a - 1/2)) + 1)^2*((k*exp(-k*(a - 1/2))*(a^q + (1 - a)^q))/(exp(-k*(a - 1/2)) + 1)^2 - a^(q - 1)*q + (q*(a*(1 - a)^q - a^q + a*a^q))/(a*(exp(-k*(a - 1/2)) + 1)*(a - 1)))*(a^q*q + a^q - a^(q - 1)*q + (1 - a)^q - a*q*(1 - a)^(q - 1)))/(a^q - exp(k*(a - 1/2))*(1 - a)^q)^2 - (2*(exp(k*(a - 1/2)) + 1)^3*(a*(1 - a)^q - a^q + a*a^q)*((k*exp(-k*(a - 1/2))*(a^q + (1 - a)^q))/(exp(-k*(a - 1/2)) + 1)^2 - a^(q - 1)*q + (q*(a*(1 - a)^q - a^q + a*a^q))/(a*(exp(-k*(a - 1/2)) + 1)*(a - 1)))^2)/(a^q - exp(k*(a - 1/2))*(1 - a)^q)^3 - ((exp(k*(a - 1/2)) + 1)^2*(a*(1 - a)^q - a^q + a*a^q)*((a^(q - 2)*q*(q - 1) + q*(1 - a)^(q - 2)*(q - 1))/(exp(-k*(a - 1/2)) + 1) - a^(q - 2)*q*(q - 1) - (k^2*exp(-k*(a - 1/2))*(a^q + (1 - a)^q))/(exp(-k*(a - 1/2)) + 1)^2 + (2*k^2*exp(-2*k*(a - 1/2))*(a^q + (1 - a)^q))/(exp(-k*(a - 1/2)) + 1)^3 + (2*k*q*exp(-k*(a - 1/2))*(a*(1 - a)^q - a^q + a*a^q))/(a*(exp(-k*(a - 1/2)) + 1)^2*(a - 1))))/(a^q - exp(k*(a - 1/2))*(1 - a)^q)^2;
        end
    end
end