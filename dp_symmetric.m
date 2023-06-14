function dp = dp_symmetric(a,q,k)
    dp = (q*(2*a)^(q - 1) - 1)/((2*a)^q/2 - 1/(exp(-k*(a - 1/2)) + 1)) + ((q*(2*a)^(q - 1) - (k*exp(-k*(a - 1/2)))/(exp(-k*(a - 1/2)) + 1)^2)*(a - (2*a)^q/2))/((2*a)^q/2 - 1/(exp(-k*(a - 1/2)) + 1))^2;
end