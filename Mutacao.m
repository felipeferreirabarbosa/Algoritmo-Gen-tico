function [X Z] = Mutacao(X,Z,T)
if(T~=0)   

        for i= 1:length(X)
           if(rand(1)<T)
               X(i) = X(i) + 0.001;
               Z(i) = Z(i) + 0.001;
           end
        end
end