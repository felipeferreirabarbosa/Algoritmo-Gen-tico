function [Xvencedores Yvencedores] = torneio(X,Y,F,Ni)
k=length(X)*Ni;
Xvencedores=[];
Yvencedores=[];
IndicesC1=[];
IndicesC2=[];
for i=1:k
    
    combatente1=uint32(rand(1)*length(X));
    combatente2=uint32(rand(1)*length(X));
    while(ismember(combatente1,IndicesC1))
        combatente1=uint32(rand(1)*length(X));
    end
    while(ismember(combatente2,IndicesC2))
        combatente2=uint32(rand(1)*length(X));
    end
    if(combatente1==0)
        combatente1=1;
    end
    if(combatente2==0)
        combatente2=1;
    end
    if(F(combatente1)>=F(combatente2))
        Xvencedores(i)=X(combatente1);
        Yvencedores(i)=Y(combatente1);
        IndicesC1(length(IndicesC1)+1)=i;
    else
        Xvencedores(i)=X(combatente2);
        Yvencedores(i)=Y(combatente2);
        IndicesC2(length(IndicesC2)+1)=i;
    end     
end
    