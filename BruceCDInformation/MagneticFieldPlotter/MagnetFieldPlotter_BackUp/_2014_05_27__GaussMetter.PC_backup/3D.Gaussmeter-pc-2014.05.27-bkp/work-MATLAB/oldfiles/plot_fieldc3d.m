% mide el campo en 3D,2D,1D . Tiene incluida la corrcci'on del error de la punta.                        %
% salva solamente la mitad de la matriz de datos asi que hay que correrlo con meas =1 y luego con meas=2  %
% hay que dividirlo asi para evitar errores en matlab que se bloquea para mediciones largas.   
% HAY QUE CERRAR MATLAB DESPU'ES DE LA PRIMERA MEDICION 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
% disp('Please remove your sample')
% pause

meas=menu('Measurement','1th half','2th half');               % mitad que se desea medir (1 para la primera cualquier cosa para la segunda)
X_min = 2;
Y_min = 2;
Z_min = 2.5;
                    
Ysh=0;                  
Zsh=-0.3;            %With Zsh=3.69 the botton of the pobe will be 0.7mm over the Array SA1
                      %With Zsh=-2.65 the botton of the pobe will be 0.7mm over the Array BA1 
                      %With Zsh=1.85 the botton of the pobe will be 0.7mm over the Array BA11 
                      %With Zsh=-0.4 the botton of the pobe will be 0.7mm over the Array BA2
                      %With Zsh=6.25 the botton of the pobe will be 0.7mm over the small sensor
                       %With Zsh=-4.2 the botton of the pobe will be 0.7mm over the Array BM(Brucker mouse)
pe=0.208;           %distance from the centre of the probe to the X active area. 
zpe=0.18;           %distance from the bottom of the probe to the Z active area. 

sx=0.1; sy=sx; sz=sx; 

X_min = X_min+pe;
Y_min = Y_min+pe;
Xx=-X_min:sx:X_min;
Xy=-Y_min:sy:Y_min; %Xy=[0 pe] solo para el caso de plano xz;
Xz=-Z_min:sz:Z_min;
dpex=[0:sx:pe]; ldpex=length(dpex);  
dpey=[0:sy:pe]; ldpey=length(dpey);

xd = 1; yd = -1; zd = -1;
%% array indices
px = 1;
py = length(Xy);
pzo = length(Xz);
hpz=ceil(pzo/2);
pz=pzo;
name='matriz2'; fg=hpz;


init_motors;
init_gauss;


if meas==1
   movem(s2,3,-20);
   movem(s2,1,-20);
   home_m(s2,3);
   movem(s2,3,Zsh-2);
   home_m(s2,2);
   home_m(s2,1);
   movem(s2,1,-X_min);
   movem(s2,2,Ysh+Y_min);
   movem(s2,3,2)
else
    load matriz2 px xd py yd pz  
    name='matriz1';
    fg=1;
end

 
%  disp ('Insert your sample')

pause

done = 0; c=0;
Fx=zeros(length(Xx),length(Xy),length(Xz));
Fy=zeros(length(Xx),length(Xy),length(Xz));
Fz=zeros(length(Xx),length(Xy),length(Xz));

while (~done)
    F = getfield(s1);
    
    Fx(px,py,pz) = F(1);
    Fy(px,py,pz) = F(2);
    Fz(px,py,pz) = F(3); 

    if ( ((px+xd) > length(Xx)) | ((px+xd) < 1))
             % reverse x
            xd = -xd;
            if ( ((py+yd) > length(Xy)) | ((py+yd) < 1))
                % reverse y
                yd = -yd;
                if  ( ((pz+zd) > length(Xz)) | ((pz+zd) < fg))     
                    movem(s2,3,sz.*zd);
                    pz = pz+zd;
                    done = 1;
                else
                    % increment z
                    movem(s2,3,sz.*zd);
                    pz = pz+zd;
                end
            
            else
                % increment y
                movem(s2,2,sy.*yd);
                py = py+yd;
            end
    else
        % increment x
        movem(s2,1,sx.*xd);
        px = px+xd;
    end  
    px
    py
    pz
end % end while
    

end_m
stop_gauss

save (name,'Fx','Fy','Fz','xd','yd','px','py','pz'); 

if meas~=1
    F1x=Fx; F1y=Fy; F1z=Fz;
    load matriz2 Fx Fy Fz
    Fx=Fx+F1x;
    Fy=Fy+F1y;
    Fz=Fz+F1z;
    md1=length(Xx);
    md2=length(Xy);
    md3=length(Xz);

    for a=1:md2
        for i=1:md3
            f1x(:,a,i)=Fx(2*ldpex-1:md1,a,i);
            f1y(:,a,i)=Fy(ldpex:md1-ldpex+1,a,i);
            f1z(:,a,i)=Fz(ldpex:md1-ldpex+1,a,i);
        end
    end

    md1=size(f1x,1);

    for a=1:md1
        for i=1:md3
            fx(a,:,i)=f1x(a,ldpey:md2-ldpey+1,i);
            fy(a,:,i)=f1y(a,2*ldpey-1:md2,i);
            fz(a,:,i)=f1z(a,ldpey:md2-ldpey+1,i);
        end
    end
    
    f=sqrt(fx.^2+fy.^2+fz.^2);
    save matriz sz fx fy fz f;   
end

% 
%          
% c=contour(f',50);        
% f=flipud(f');
% fc=f(:,21);
% dfc=diff(fc);
% figure(2);plot(fc)
% figure(3);plot(dfc); hold on
% r=zeros(1,length(dfc));
% plot(r,'k');hold off

% 
