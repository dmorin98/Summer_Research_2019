
% Opitmized for measuring along the z axis. It has included the compensation for the tip.  %
% The tip should be set at the magnet centre before runing this function.                  %
% It is easier to do it using the function motorm.m                                        %
% All the data and the date of the measurement is saved automatically to FieldMeas1D.mat   %
% Updated April 16, 2011                                                                   % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

init_motors
init_gauss
%close all
X_min = 0;
Y_min = 0;
Z_min = 3;                 
pe=0.208;                  % tip error (see the manual) 
sz = 2;
zm=9.5;            %13.3 IR        
Z = -Z_min:sz:Z_min;
dpe=[0:sz:pe]; ldpe=length(dpe);


Npp=1;                   % Number of points for averaging 
movem(s2,3,-50);
%home_m(s2,1);
%home_m(s2,2);
movem(s2,3,zm);  

%%%%%Initiatlizing the F matrix (1st row is x, 2nd is y, 3rd is z)
FF = zeros(3,(size(Z))+1);

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
        F = getfield(s1);
        FFf=F+FFf;

        
        
    end
        FF(1,k) = FFf(1)/Npp;
        FF(2,k) = FFf(2)/Npp;
        FF(3,k) = FFf(3)/Npp
        delay
        
    if k~=length(Z)
        movem(s2,3,-sz);
        
    end
   

   
end
movem(s2,1,pe);
sz=-sz;
end
movem(s2,1,-pe);  
movem(s2,2,-pe);

sz=-sz;



% field correction

fx=FF(1,:); 
fy=FF(2,:);
fz=FF(3,:);
f = sqrt(fx.^2+fy.^2+fz.^2);

end_m
stop_gauss


 df=diff(f);
 figure (1); plot(f); grid on; title('Plotting f')
 figure (2); plot(df); grid on; title('Plotting df')
 figure (3); plot(fz); grid on; title('Plotting Fz')
 time=clock;
 save FieldMeas1D f fx fy fz Z time