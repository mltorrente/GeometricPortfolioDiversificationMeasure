function res = GPDM(coeff,rho,w)
% This function computes the Geometric Portfolio Diversification Measure (GPDM) 
% of w \in \Gamma_n based on a given risk metric, whose value for each asset 
% is provided in the vector "rho". The variable "coeff" is the multiplicative 
% factor that depends on the rank of the data matrix and, for convenience, is computed beforehand.

dime = size(rho);
IdMat=eye(dime(1,1));

dSquarew=zeros(1,dime(1,1));
for i=1:dime(1,1)
    dSquarew(1,i)=sum(rho.^(-1).*(w-IdMat(:,i)).^2);
end

dSquareE=zeros(dime(1,1),dime(1,1));
for i=1:dime(1,1)-1
    for j=i+1:dime(1,1)
        dSquareE(i,j)=(1/rho(i,1))+(1/rho(j,1));
    end
end
for i=2:dime(1,1)
    for j=1:i-1
        dSquareE(i,j)=dSquareE(j,i);
    end
end

% compute the function f_{\rho(X)} over w
Fw=0;
for i=1:(dime(1,1)-1)
    for j=i+1:dime(1,1)
        Fw=Fw+(dSquarew(1,i)-dSquarew(1,j))^2;
    end
end

% compute the function f_{\rho(X)} over the single assets
FE=zeros(1,dime(1,1));
for k=1:dime(1,1)
    for i=1:dime(1,1)-1
        for j=i+1:dime(1,1)
            FE(1,k)=FE(1,k)+(dSquareE(k,i)-dSquareE(k,j))^2;
        end
    end
end

% compute GPDM over w
res = coeff*(1 - Fw/max(FE));
end