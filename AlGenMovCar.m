function [X Y]=AlGenMovCar(obj)
    FinalX=1;
    FinalY=1;
    plot(FinalX,FinalY,'g*');
    [x y teta]= genOverhead(obj);
    Xout=[];
    Yout=[];
    erro=1000;
    XpontoVisitado=[];
    YpontoVisitado=[];
    prevX=x;
    prevY=y;
    preerro=1;
    prevGenX=[];
    prevGenY=[];
    flag=1;
while(1 && (erro>=0.1))
        
        df = ReadSonar(obj,2);
        if(isempty(df) | df>=2)
            df=2;
        end
        SetDriveWheelsCreate(obj,-0.05,0.05);
        pause(1);
        rota=10;
        while(rota>0.1)
            df = ReadSonar(obj,2);
            if(isempty(df) | df>=2.5)
                df=2.5;
            end
            [x y teta2]= genOverhead(obj);
            if(preerro>0.5)
                X=[0:0.2:df-0.75]*cos(teta2)+x;
                Y=[0:0.2:df-.75]*sin(teta2)+y;
            else
                X=[0:0.8:df-0.75]*cos(teta2)+x;
                Y=[0:0.8:df-0.75]*sin(teta2)+y;
            end
            Xout=horzcat(Xout,X);
            Yout=horzcat(Yout,Y);
            [x y teta2]= genOverhead(obj);
            rota=abs(teta-teta2);
            pause(0.5);
        end
        if flag==0
            for i=1:length(Xout)
                for j=1:length(prevGenX)
                    a=ismember(Xout(i),prevGenX(j)) & ismember(Yout(i),prevGenY(j));
                if(a)
                    Xout(i)=[];
                    Yout(i)=[];
                    if(i>=length(Xout))
                       break;
                    end
                end
            end
            if(i>=length(Xout))
                     break;
            end
        end
    end
    
    X=Xout;
    Y=Yout;
    Xout=[];
    Yout=[];
    SetDriveWheelsCreate(obj,0,0);
    plot(X,Y,'g.');
    [Xr Yr G Reset] = AlGen(X,Y,0,0.6,1,FinalX,FinalY,XpontoVisitado,YpontoVisitado,prevX,prevY,x,y);
    if(Reset)
        XpontoVisitado=XpontoVisitado(length(XpontoVisitado));
        YpontoVisitado=YpontoVisitado(length(YpontoVisitado));
        [Xr Yr G Reset] = AlGen(X,Y,0,0.9,1,FinalX,FinalY,XpontoVisitado,YpontoVisitado,prevX,prevY,x,y);
    end
    plot(Xr,Yr,'r.');
    [x y teta2]= genOverhead(obj);
    if(Xr>x)
        turnAngle(obj,0.2,asind((Yr-y)/sqrt((Yr-y)^2+(Xr-x)^2))-teta2*180/pi);
    else
        if(Yr<y)
            turnAngle(obj,0.2,-180-asind((Yr-y)/sqrt((Yr-y)^2+(Xr-x)^2))-teta2*180/pi);
        else
            turnAngle(obj,0.2,180-asind((Yr-y)/sqrt((Yr-y)^2+(Xr-x)^2))-teta2*180/pi);
        end
    end
    
    prevX=x;
    prevY=y;
    travelDist(obj,0.2,sqrt((Yr-y)^2+(Xr-x)^2));
    
    pause(0.1);
    [x y teta]= genOverhead(obj);
    erro=(abs(FinalX-x)+abs(FinalY-y))/2;
    preerro=abs(prevX-x)+abs(prevY-y)/2;
    
    XpontoVisitado(length(XpontoVisitado)+1)=x;
    YpontoVisitado(length(XpontoVisitado)+1)=y;
    if flag==0
        prevGenX=X;
        prevGenY=Y;
        flag=1;
    else
        flag=0;
    end
    
end
