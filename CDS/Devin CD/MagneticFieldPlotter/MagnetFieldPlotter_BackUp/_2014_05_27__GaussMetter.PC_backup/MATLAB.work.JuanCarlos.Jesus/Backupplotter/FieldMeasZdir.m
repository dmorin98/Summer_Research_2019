
% Opitmized for measuring along the z axis. It has included the compensation for the tip.  %
% The tip should be set at the magnet centre before runing this function.                  %
% It is easier to do it using the function motorm.m                                        %
% All the data and the date of the measurement is saved automatically to FieldMeas1D.mat   %
% Updated April 16, 2011                                                                   % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
init_motors
init_gauss

X_min = 0;
Y_min = 0;
Z_min = 2;                 
pe=0.208;                  % tip error (see the manual) 
sz = 0.1;
zm=9.5;                    % It should be 9.5 for BA11 and WA
Z = -Z_min:sz:Z_min;
dpe=[0:sz:pe]; ldpe=length(dpe);


Npp=10;                    % Number of points for averaging 
movem(s2,3,-50);
movem(s2,3,zm);  

for i=1:3
    if i==3
    movem(s2,1,-pe);
    movem(s2,1,-pe);  
    movem(s2,2,pe);
    ch='CHNL Y';
    elseif i==2
        ch='CHNL X';
    else
        ch='CHNL Z';
    end  
        
for k = 1:length(Z)
    
  FFf=0;
    for a=1:Npp
        F = Newgetfield(s1,ch);
        FFf=F+FFf;
    end
        FF(i,k) = FFf/Npp;
        
    if k~=length(Z)
        movem(s2,3,-sz);
        delay
    end
end
movem(s2,1,pe);
sz=-sz;
end
movem(s2,1,-pe);  
movem(s2,2,-pe);
sz=-sz;



% field correction

fx=fliplr(FF(2,:)); 
fy=FF(3,:);
fz=FF(1,:);
f = sqrt(fx.^2+fy.^2+fz.^2);
end_m
stop_gauss


 df=diff(f);
 figure (1); plot(f); grid on
 figure (2); plot(df); grid on
 time=clock;
 save FieldMeas1D f fx fy fz Z time