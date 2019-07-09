clc;
clear all;
close all;
init_motors
init_gauss

X_min = 1;
Y_min = 0;
Z_min = 0;                                  
sx= 0.02;
zm=14.1;   
X=0:sx:X_min;
movem(s2,3,-50);
home_m(s2,1);
home_m(s2,2);
movem(s2,3,zm);

Npp=10;
for k=1:length(X);
    FFf=0;
    for a=1:Npp
        F=Newgetfield(s1,'CHNL X');
        FFf=F+FFf;
    end
    FF(k)=abs(FFf/Npp);
    movem(s2,1,sx);
end

end_m
stop_gauss
df=diff(FF);
figure(1);plot(FF);grid on
figure(2);plot(df);grid on
save FieldMeas1D_X FF df 