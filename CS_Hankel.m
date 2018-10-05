function U = CS_Hankel(R)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
L = size(R);
m = L(1) - L(2);
U1 = zeros(L(2)+1,m); 
for n = 1:L(2)
    r = R(:,n).';
    for ell = 1:L(2)+1
        U1(ell,:) = r(ell:m+ell-1);
    end
    U(:,(n-1)*m+1:n*m) = U1;
end
end

