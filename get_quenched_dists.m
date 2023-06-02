function [dist_a,dist_a0,dist_a1] = get_quenched_dists(dist,N0,N1)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
N = N0 + N1;
dist_a = zeros(1, N+1);
dist_a0 = zeros(1, N0+1);
dist_a1 = zeros(1, N1+1);

for i=1:N0+1
    for j=1:N1+1
        dist_a(i+j-1) = dist_a(i+j-1)+dist((i-1)*(N1+1)+j);
        dist_a0(i) = dist_a0(i) + dist((i-1)*(N1+1)+j);
        dist_a1(j) = dist_a1(j) + dist((i-1)*(N1+1)+j);
    end
end
end