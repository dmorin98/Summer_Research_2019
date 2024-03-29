% mide el campo en 3D
clear
% disp('Please remove your sample')
% pause

X_min = 4;
Y_min = 2.5;
Z_min = 1.5;
                    %Zsh=3.7;   %sample in xy plane
                  %Zsh=2.5;   %sample perpendicular to xy plane
Zsh=2.4;            %Array
pe=0.208;           %distance from the centre of the probe to the X active area. 
zpe=0.18;           %distance from the bottom of the probe to the Z active area. 

sx=0.1; sy=pe; sz=sx; 

X_min = X_min+pe;
Y_min = Y_min+pe;
Xx=-X_min:sx:X_min;
Xy=-Y_min:sy:Y_min;
Xz=-Z_min:sz:Z_min;
dpe=[0:sz:pe]; ldpe=length(dpe);

xd = 1; yd = -1; zd = -1;
%% array indices
px = 1;
py = length(Xy);
pz = length(Xz);

init_motors;
init_gauss;



% movem(s2,3,-10);
% movem(s2,1,-20);
% home_m(s2,3);
% home_m(s2,1);
% movem(s2,1,-X_min);
% home_m(s2,2);
% movem(s2,2,Y_min);
% movem(s2,3,Z_min+Zsh);

% % fprintf(s1, 'CHNL X'); 
% % fprintf(s1, 'RANGE 0'); 
% % fprintf(s1, 'CHNL Y'); 
% % fprintf(s1, 'RANGE 1'); 
% % fprintf(s1, 'CHNL Z'); 
% % fprintf(s1, 'RANGE 0'); 

%  disp ('Insert your sample')
%  pause

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
 
% field correction
for a=1:length(Xy)
for i=1:length(Xz)
    fx(:,a,i)=Fx(2*ldpe-1:length(Fx),a,i);
    fy(:,a,i)=Fy(ldpe:length(Fy)-ldpe+1,a,i);
    fz(:,a,i)=Fz(ldpe:length(Fz)-ldpe+1,a,i);
end
end


%X=Xx(ldpe:length(Xx)-ldpe+1);
% f=sqrt(fx.^2+fy.^2+fz.^2);
% c=contour(f',50);
%          
%             
% f=flipud(f');
% fc=f(:,21);
% dfc=diff(fc);
% figure(2);plot(fc)
% figure(3);plot(dfc); hold on
% r=zeros(1,length(dfc));
% plot(r,'k');hold off


