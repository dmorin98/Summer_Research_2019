% mide el campo en 3D,2D,1D . Tiene incluida la corrcci'on del error de la punta. optimizado para los bloques de SA2
clear
disp('Please remove your sample')
pause
Nadq=1;
f2=0;
Npp=1;
for c=1:Nadq
mm=c
X_min = 2;
Y_min = 0;
Z_min = 0;
                    
%Xsh=1;
Ysh=0;                  
Zsh=0.85;            %With Zsh=3.69 the botton of the pobe will be 0.7mm over the Array SA1
                      %With Zsh=-2.65 the botton of the pobe will be 0.7mm over the Array BA1 
                      %With Zsh=-0.4 the botton of the pobe will be 0.7mm over the Array BA2
                      %With Zsh=6.25 the botton of the pobe will be 0.7mm over the small sensor
                       %With Zsh=-4.2 the botton of the pobe will be 0.7mm over the Array BM(Brucker mouse)
                        %With Zsh=5.3 the botton of the pobe will be 0.7mm over the new bocks(h=1 inch)
pe=0.208;           %distance from the centre of the probe to the X active area. 
zpe=0.18;           %distance from the bottom of the probe to the Z active area. 

sx=0.1; sy=0.1; sz=sy; 

X_min = X_min+pe;
Y_min = Y_min+pe;
Xx=-X_min:sx:X_min;
Xy=-Y_min:sy:Y_min; 
%Xy=[0 pe] %solo para el caso de plano xz;
Xz=-Z_min:sz:Z_min;
dpex=[0:sx:pe]; ldpex=length(dpex);  
dpey=[0:sy:pe]; ldpey=length(dpey);
%dpey=[0 pe]; ldpey=length(dpey)% solo para el caso de plano xz;


xd = 1; yd = -1; zd = -1;
%% array indices
px = 1;
py = length(Xy);
pz = length(Xz);

init_motors;
init_gauss;



  movem(s2,3,-20);
 movem(s2,1,-80);
  home_m(s2,3);
  movem(s2,3,Zsh-2);
 home_m(s2,1);
 home_m(s2,2);
 movem(s2,1,-X_min);
 movem(s2,2,Ysh+Y_min);
  movem(s2,3,2)


 disp ('Insert your sample')

 pause

done = 0;
% measure
while (~done)
    ff=0;    
    for a=1:Npp
        fd = getfield(s1);
        f=fd+ff;
    end
    F=f/Npp;    
    Fx(px,py,pz) = F(1);
    Fy(px,py,pz) = F(2);
    Fz(px,py,pz) = F(3); 
    
    if ( ((px+xd) > length(Xx)) | ((px+xd) < 1))
        % reverse x
        xd = -xd;
        if ( ((py+yd) > length(Xy)) | ((py+yd) < 1))
            % reverse y
            yd = -yd;
            if  ( ((pz+zd) > length(Xz)) | ((pz+zd) < 1))     
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


%%%%%%%%%%%%%%%%%%%%%%%
% fx1(:,:)=Fx(:,1,:);
% fy1(:,:)=Fy(:,2,:);
% fz1(:,:)=Fz(:,1,:); 

% field correction
% for i=1:length(Xz)
%     fx(:,i)=fx1(2*ldpe-1:sz(1),i);
%     fy(:,i)=fy1(ldpe:sz(1)-ldpe+1,i);
%     fz(:,i)=fz1(ldpe:sz(1)-ldpe+1,i);
% end
%%%%%%%%%%%%%%%%%%%%%%%

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

%X=Xx(ldpe:length(Xx)-ldpe+1);
f1(:,c)=sqrt(fx.^2+fy.^2+fz.^2);

%save bk218bc Fx Fy Fz Xx Xy Xz fx fy fz f
f2=f2+f1(:,c);
end
f=f2/Nadq;
 
save BA11-1HUL f

figure(1); plot (f)
figure(2); plot(diff(f))
% c=contour(f',50);
         
            
% f=flipud(f');
% fc=f;%fc=f(:,21);
% dfc=diff(fc);
% figure(2);plot(fc)
% figure(3);plot(dfc); hold on
% r=zeros(1,length(dfc));
% plot(r,'k');hold off

% 
