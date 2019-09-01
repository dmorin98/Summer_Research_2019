
% Opitmized for measuring along the X axis. It has included the compensation for the tip.  %
% The tip should be set at the magnet centre before runing this function.                  %
% It is easier to do it using the function motorm.m                                        %
% All the data and the date of the measurement is saved automatically to FieldMeas1D_x.mat   %
% Updated July 12, 2012                                                                   % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
init_motors
init_gauss

X_min = 0.1;
Y_min = 0;
Z_min = 0;                 
pe=0.208;                  % tip error (see the manual) 
sx = 0.01;
zm=8.75;                    % It should be 9.5 for BA11 and WA
X = -X_min:sx:X_min;
dpe=[0:sx:pe]; ldpe=length(dpe);


Npp=10;                    % Number of points for averaging 
movem(s2,3,-50); 
% home_m(s2,1);
movem(s2,3,zm);
pause 
movem(s2,1,-X_min);
 

for k = 1:length(X)
    
   FFfz=0;
    for a=1:Npp
        Fz = Newgetfield(s1,'CHNL Z');
        FFfz=Fz+FFfz;
    end
        FFz(k) = FFfz/Npp;
        
    if k~=length(X)
        movem(s2,1,sx);
        delay
    end
end

movem(s2,3,-50); 

% field correction

f=FFz;

for k = 1:length(X)
movem(s2,1,-sx);   
end
end_m
stop_gauss


 df=diff(f);
 figure (1); plot(abs(f)); grid on
 %figure (2); plot(df); grid on
 time=clock;
 save FieldMeas1D_x_zcomp f X time