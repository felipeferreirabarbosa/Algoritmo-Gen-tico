function [X Y] = MelhorPonto(X,Y,FinalX,FinalY,XpontoVisitado,YpontoVisitado,prevX,prevY,x,y)
F = 0;
a=0;
Xf=[];
Yf=[];
for i= 1:length(X)
    t = fit_ness(X(i),Y(i),FinalX,FinalY);
    for j=1:length(XpontoVisitado)
        a=ismember(X(i),XpontoVisitado(j)) & ismember(Y(i),YpontoVisitado(j));
        if(a)
            break;
        end
    end
    erroprev=(abs(X(i)-prevX)+abs(Y(i)-prevY))/2;
    erro=(abs(X(i)-x)+abs(Y(i)-y))/2;
    if(a | erroprev<0.5 |erro<0.2 )
    else
      if(F <t)
            F = t;
            Xf = X(i);
            Yf = Y(i);
      end
    end
end

X = Xf;
Y = Yf;
end