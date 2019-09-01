
% Opitmized for measuring along the X axis. It has included the compensation for the tip.  %
% The tip should be set at the magnet centre before runing this function.                  %
% It is easier to do it using the function motorm.m                                        %
% All the data and the date of the measurement is saved automatically to FieldMeas1D_x.mat   %
% Updated July 12, 2012                                                                   % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
init_motors
init_gauss

X_min = 1.5;
Y_min = 0;
Z_min = 0;                 
pe=0.208;                  % tip error (see the manual) 
sx = 0.02;
zm=12.8;                    % It should be 9.5 for BA11 and WA
X = -X_min-pe:sx:X_min+pe;
dpe=[0:sx:pe]; ldpe=length(dpe);


Npp=10;                    % Number of points for averaging 
movem(s2,3,-50);
% home_m(s2,1);
movem(s2,1,1.8);
movem(s2,3,zm);

  

for k = 1:length(X)
    
  FFfx=0;
  FFfz=0;
    for a=1:Npp
        Fx = Newgetfield(s1,'CHNL X');
        Fz = Newgetfield(s1,'CHNL Z');
        FFfx=Fx+FFfx;
        FFfz=Fz+FFfz;
    end
        FFx(k) = FFfx/Npp;
        FFz(k) = FFfz/Npp;
        
    if k~=length(X)
        movem(s2,1,sx);
        delay
    end
end
movem(s2,2,pe);
FFy=zeros(1,length(X));
for k = length(X):-1:1
    FFfy=0;
    for a=1:Npp
        Fy = Newgetfield(s1,'CHNL Y');
        FFfy=Fy+FFfy;
    end
    FFy(k) = FFfy/Npp;
    
     if k~=1
        movem(s2,1,-sx);
        delay
    end
end

movem(s2,2,-pe);




% field correction

fx=FFx(2*ldpe-1:length(X));
fy=FFy(ldpe:length(X)-ldpe+1);
fz=FFz(ldpe:length(X)-ldpe+1);
f = sqrt(fx.^2+fy.^2+fz.^2);
end_m
stop_gauss


 df=diff(f);
 figure (1); plot(f); grid on
 %figure (2); plot(df); grid on
 time=clock;
 save FieldMeas1D_x f fx fy fz X time