function [h,R,U] = ZPblind(Z,L)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
l = size(Z);
m = l(1) - L;
[R1,S,V] = svd(Z);
R = R1(:,m+1:l(1));
U = CS_Hankel(R);
U1 = U*U';
[h1,D] = eigs(U1,3,'SM');
h = h1(:,1);
end