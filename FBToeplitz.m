function T = FBToeplitz(v,k)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
T = zeros(length(v)+k-1,k);
v = v(:);
for ell = 1:k
    T(:,ell) = [zeros(ell-1,1);v;zeros(k-ell,1)];
end
end