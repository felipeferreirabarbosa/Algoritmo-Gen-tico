function [Xr Zr] = CrossOver(X,Z)
    i=1;
    Xr=[];
    Zr=[];
    while(length(X) >=2)
        Xr(i) = Cross_Over(X(1),X(2));
        Zr(i) = Cross_Over(Z(1),Z(2));
        
        Xr(i+1) = Cross_Over(X(2),X(1));
        Zr(i+1) = Cross_Over(Z(2),Z(1));
        
        i=i+2;
        X(1) = [];
        Z(1) = [];
       
        X(1) = [];
        Z(1) = [];
    end
    
    if(length(X) == 1)
        i = length(Xr)+1;
        Xr(i) = X(1);
        Zr(i) = Z(1);
    end
end