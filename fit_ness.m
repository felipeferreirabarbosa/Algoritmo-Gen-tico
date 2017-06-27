function F = fit_ness(x,y,FinalX,FinalY)
    F = 1/sqrt((FinalX-x)^2 + (FinalY-y)^2);
end