% Optimized for 1D, 2D or 3D measurements. The correction of the tip is included. %
% It saves the data to the file FieldMeas2D.mat. Updated April 22 2011.            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
Npp=1;              %Number of point for averaging

X_min = 1;
Y_min = 0;
Z_min = 1;
                    
                 
zm=9.6;             % It should be 8.7 for BA11 and WA (9.6 for 2D homog spot)
pe=0.208;           %Distance from the centre of the probe to the X active area. 
zpe=0.18;           %Distance from the bottom of the probe to the Z active area. 

sx=0.1; sy=sx; sz=0.2; 

X_min = X_min+pe;
Y_min = Y_min+pe;
Xx=-X_min:sx:X_min;
Xy=-Y_min:sy:Y_min; 
Xz=-Z_min:sz:Z_min;
dpex=[0:sx:pe]; ldpex=length(dpex);  
dpey=[0:sy:pe]; ldpey=length(dpey);

xd = 1; yd = -1; zd = -1;

px = 1;
py = length(Xy);
pz = length(Xz);

init_motors;
init_gauss;

 movem(s2,3,-50);
 movem(s2,1,-80);
 home_m(s2,1);
 home_m(s2,2);
 movem(s2,1,-X_min);
 movem(s2,2,Y_min);
 movem(s2,3,zm);


done = 0;
% measure
while (~done)
    ff=0;    
    for a=1:Npp
        fd = getfield(s1);
        ff=fd+ff;
    end
    F=ff/Npp;    
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



 
time=clock;
save FieldMeas2D f fx fy fz Xx Xy Xz time

figure(1); plot (f)
figure(2); plot(diff(f))

