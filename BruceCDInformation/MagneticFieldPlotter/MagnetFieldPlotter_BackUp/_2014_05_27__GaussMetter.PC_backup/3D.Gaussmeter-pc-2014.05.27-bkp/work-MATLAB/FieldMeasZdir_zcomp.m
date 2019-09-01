
% Opitmized for measuring along the z axis. It has included the compensation for the tip.  %
% The tip should be set at the magnet centre before runing this function.                  %
% It is easier to do it using the function motorm.m                                        %
% All the data and the date of the measurement is saved automatically to FieldMeas1D.mat   %
% Updated April 16, 2011                                                                   % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all
% clear all
init_motors
init_gauss
%close all
X_min = 0;
Y_min = 0;
Z_min = 2;                 
pe=0.208;                  % tip error (see the manual) 
sz = 1;
zm=8;            %13.3 IR        
Z = -Z_min:sz:Z_min;
dpe=[0:sz:pe]; ldpe=length(dpe);


Npp=10;                   % Number of points for averaging 
movem(s2,3,-50);
% home_m(s2,1);
%home_m(s2,2);
movem(s2,3,zm); 


ch='CHNL Z';
   
       
for k = 1:length(Z)
    
  FFf=0;
    for a=1:Npp
        F = getfield(s1);
        FFf=F+FFf;
    end
        FF(i,k) = FFf/Npp;
        
        
    if k~=length(Z)
        movem(s2,3,-sz);
        delay
    end
end


movem(s2,3,-50);

f=FF;

% field correction


end_m
stop_gauss


 df=diff(f);
 figure (1); plot(f); grid on
%  figure (2); plot(df); grid on
 time=clock;
 save FieldMeas1D_zcomp f  Z time