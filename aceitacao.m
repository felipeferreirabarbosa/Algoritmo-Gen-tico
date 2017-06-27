function [X Z] = aceitacao(X,Z,Xo,Zo)

    X = horzcat(X,Xo);
    Z = horzcat(Z,Zo);

end