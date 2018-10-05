clear all
close all
clc

M = 8;
J = 7;
Q = 2;
L = 4;
P = M + L;
N=M+Q+L-1;
Pq=N;
Mq=M+Q-1;

h = randn(L+1,1)+1j*randn(L+1,1);

H = FBToeplitz(h,M);

U = 2*(randn(M,J)>0) - 1 + 1j*(2*(randn(M,J)>0) - 1);
%%%%%%%%%%%%%%%%%%%%%dominio de tiempo%%%%%%%%%%%%%%%%%
YJ = H*U;
YJQ = zeros(P+Q-1,J*Q);
for n = 1:J
    YJQ(:,(n-1)*Q+1:n*Q) = FBToeplitz(YJ(:,n),Q);
end

[ht,Rt,Ut] = ZPblind(YJQ,L);

[hm,I] = max(abs(h));
ht = ht*h(I)/ht(I);

%%%%%%%%%%%%%%%%%%dominio de frecuencia%%%%%%%%%%%%%%%%%%%


  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           % En dominio de frecuencia           
           
           VNxPQ = zeros(N,Pq);
           
           VpT = [];
           
           for k=0:N-1
               coe = exp((2*pi*1i*k)/N);
               VpT = [VpT coe];
           end
           
           VpTf = VpT;
           
           for i=0:Pq-1
               VNxPQ(:,i+1) = VpTf .^-i;
           end;
           
           VNxMQ = VNxPQ(:,1:Mq);
           
           AV = zeros(N,N);
           
          Hf = FBToeplitz(h,Mq);
            for i=1:N
              AV(i,i) = VNxPQ(i,:) * Hf(:,1); 
            end
            
            YJf = YJQ
               Zf = VNxPQ * YJf;
               
               lf = size(Zf);
               mf = lf(1) - L;
               
            [S1 V1 D] = svd(Zf);
           
            S = S1(:,length(S1)-(N-Mq)+1:length(S1));
            
          

           
           UoT = S';

           [x,y] = size(UoT);

           UU = [];

           VNxMQTranspuesta = VNxMQ.';

           for i=1:x
               Ufila = UoT(i,:);

               for j=1:Mq

                   Ui(j,:) = Ufila;  

               end

               Ui = Ui .* VNxMQTranspuesta;

               UU = [UU Ui.'];%%%%%%xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

           end 
           
           U = UU.';
           
           UAux = U' * U;
          
           [EigenVectors EigenValues] = eigs(UAux,3,'SM');
           hf = EigenVectors(:,1);
           [hmf,If] = max(abs(diag(AV)));
           AVf=diag(AV);
            hf = 1*hf*AVf(If)/hf(If);
            [AVf,hf]
            [h,ht]
           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           
           
           
           
           
           
           
           %diagEigenValues = diag(EigenValues);
           
           %minValue = min(diagEigenValues);
           
          % indexMinValue = -1;
           
           %for h=1:length(EigenValues)
            %   if diagEigenValues(h) == minValue
             %      indexMinValue = h;
              % end
           %end
           
           %%%%%%%%%%%%%%%%%%%%%%% AV max Value and max Index
          % diagAV = diag(AV);
           
           %maxValue = max(diagAV);
           
           %indexMaxValue = -1;
           
           %for h=1:length(AV)
            %   if diagAV(h) == maxValue
             %      indexMaxValue = h;
              % end
          % end           
           
           %colEigenVectors = EigenVectors(:,indexMinValue);
           
           %coeficienteEigenVec = colEigenVectors(indexMaxValue);
           
           %divCoe = maxValue / coeficienteEigenVec;
           
           %estimationH = colEigenVectors * divCoe;
           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           
            %[diagAV, hf]
            
a=2;


