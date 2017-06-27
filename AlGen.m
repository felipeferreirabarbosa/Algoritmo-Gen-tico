%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%              Algorítmo Genetico                %
% Parametros:                                    %
%     - Entrada:                                 %
%          X,Z - Vetor de pontos(X,Z)possíveis.  %
%          T - Taxa de mutação <=0.1.            %
%          Ni - Taxa de crusamento               %
%          Elit - Taxa de manutação de individuos%
%                 melhor adaptados  0~1.         %
%          erro - Erro aceitavel para questão.   %
%     - Saida:                                   %
%          raiz - Raiz da equação proposta.      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Xr Yr G Reset] = AlGen(X,Y,T,Ni,Elit,FinalX,FinalY,XpontoVisitado,YpontoVisitado,prevX,prevY,x,y)
errofinal = 100000; 
G=1;
erro=0.00000000000000001; 
Reset=0;
 while(erro<=errofinal && G<7)
     
    F = fitness(X,Y,FinalX,FinalY);                   
    [Xo Yo] = MelhoresOld(X,Y,F,Elit);      % 2-     Guarda os melhores individuos da
                                            % populaçao atual.                                                      
    [X Y] = torneio(X,Y,F,Ni);              % 3-     Coloca indivídos aleatoreamente em uma arena para combate;

    
    [X Y] = CrossOver(X,Y);              % 4-     A nova população será formada pelos
                                         % filhos da população anterior. Cada dois 
                                         % pais geram dois filhos.
                                    
    [X Y] = Mutacao(X,Y,T);              % 5-     A população de filhos sofrerá mutação
                                         % baseado na taxa de ocorrencia (T).
                                    
    [X Y] = aceitacao(X,Y,Xo,Yo);         % 6-     Insere os melhores individuos da poulação
                                         % anterior na população atual.
                                         % Retorna a melhor fitness de toda a população.
                                        
    G = G+1;
    errofinal = 1/fitnessMelhorPonto(X,Y,FinalX,FinalY);
    %[Xr Yr] = MelhorPonto(X,Y,FinalX,FinalY,XpontoVisitado,YpontoVisitado,prevX,prevY,x,y);                     % Retorna o individuo de menor fitness.                 
    
 end
 [Xr Yr] = MelhorPonto(X,Y,FinalX,FinalY,XpontoVisitado,YpontoVisitado,prevX,prevY,x,y);                     % Retorna o individuo de menor fitness.                 
  if(isempty(Xr))
    Reset=1;
  end
end