function [Xo Zo] = MelhoresOld(X,Z,F,Elit)

Xo=[];
Zo=[];
for i= 1:length(F)
    for j = (i+1):length(F)
        if(F(i)<F(j))
                Xtemp = X(i);
                Ztemp = Z(i);
                Ftemp = F(i);
                
                X(i) = X(j);
                Z(i) = Z(j);
                F(i) = F(j);
                
                X(j) = Xtemp;
                Z(j) = Ztemp;
                F(j) = Ftemp;
        end
    end
end

limit = round(length(X)*Elit);
for i = 1:limit
    Xo(i) = X(i);
    Zo(i) = Z(i);
end

if(isempty(Xo))
    Xo=X;
    Zo=Z;
end
end