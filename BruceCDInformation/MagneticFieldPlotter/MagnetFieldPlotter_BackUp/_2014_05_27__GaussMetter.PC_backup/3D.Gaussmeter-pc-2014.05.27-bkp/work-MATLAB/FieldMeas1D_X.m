%updated on April 17,2013
clc;
clear all;
close all;
init_motors
init_gauss

X_min = 1.75;                                
sx= -0.05;
zm=50;   
X=[-X_min:abs(sx):X_min];
movem(s2,3,-50);
% home_m(s2,1);
% home_m(s2,2);
movem(s2,3,zm);
% pe=0.208;  
movem(s2,3,-0.28);
% pause 
% movem(s2,1,-X_min);
Npp=20;
for k=1:length(X);
    FFf=0;
    for a=1:Npp
        delay
        F=Newgetfield(s1,'CHNL X');
        FFf=F+FFf;
    end
    FF(k)=abs(FFf/Npp);
    movem(s2,3,sx);
end

end_m
stop_gauss
df=diff(FF);
figure(1);plot(FF);grid on
%figure(2);plot(df);grid on
save FieldMeas1D_X FF df 