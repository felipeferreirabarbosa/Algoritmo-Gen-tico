function F = fitness(X,Y,FinalX,FinalY)

s = length(X);
    for i = 1:s
        F(i) = fit_ness(X(i),Y(i),FinalX,FinalY);
    end
end