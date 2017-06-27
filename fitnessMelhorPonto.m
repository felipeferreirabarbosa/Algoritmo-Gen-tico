function F = fitnessMelhorPonto(X,Y,FinalX,FinalY)
F = 0;

for i= 1:length(X)
    t = fit_ness(X(i),Y(i),FinalX,FinalY);
    if(F <t)
        F=t;
    end
end