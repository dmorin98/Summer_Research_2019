
clear
disp('Please remove your sample')
pause

X_min = 0;
Y_min = 1.3;
Z_min = 0.5;
Zsh=6.6; % valor anterior 2.7

% px = 4;
% py = 1;
% pz = 4;

init_motors;
init_gauss;

%home_m(s2,1);
%home_m(s2,2);
home_m(s2,3);

%movem(s2,1,-X_min);
%movem(s2,2,Y_min);
movem(s2,3,Z_min+Zsh);
%movem(s2,3,-12); % start with z towards the bottom

disp ('Motors Zeroed, insert your sample')
pause

sx=0.2; sy=sx; sz=sx;
Xx=-X_min:sx:X_min;
Xy=-Y_min:sy:Y_min;
Xz=-Z_min:sz:Z_min;

% Xx = linspace(-X_min,X_min,px);
% Xy = linspace(-Y_min,Y_min,py);
% Xz = linspace(-Z_min,Z_min,pz);
% sx = Xx(2)-Xx(1);
% sy=0;%sy = Xy(2)-Xy(1);
% sz = Xz(2)-Xz(1);

xd = 1;
yd = -1;
zd = -1

%% array indices
px = 1;
py = length(Xy);
pz = length(Xz);

done = 0;

while (~done)
    
    % measure
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
     
fx(:,:)=Fx(1,:,:);
fy(:,:)=Fy(1,:,:);
fz(:,:)=Fz(1,:,:); 
f=sqrt(fx.^2+fy.^2+fz.^2);
c=contour(Xy,Xz,fz',50);
         
            



