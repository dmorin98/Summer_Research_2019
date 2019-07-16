clear
init_motors
init_gauss
disp('Please remove your sample')
 
 %pause

X_min = 6.5;
Y_min = 0;
Z_min = 2.5;
Zsh=1.4;  
pe=0.208;                %diferencia desde el centro de la punta hasta el area activa
sz = 0.1;
X_min = X_min+pe;
X = -X_min:sz:X_min;
dpe=[0:sz:pe]; ldpe=length(dpe);


movem(s2,1,-20);
home_m(s2,1);
%home_m(s2,2);
%home_m(s2,3);
movem(s2,1,-X_min);
%movem(s2,2,Y_min);
%movem(s2,3,Z_min+Zsh);


disp ('Motors Zeroed, insert your sample')
 pause

for k = 1:length(X)
    F = getfield(s1);
    Fx(k) = F(1);
    Fy(k) = F(2);
    Fz(k) = F(3);
    if k~=length(X)
        movem(s2,1,sz);
    end
end
end_m
stop_gauss

% field correction

Fx=Fx(2*ldpe-1:length(Fx))
Fy=Fy(ldpe:length(Fy)-ldpe+1)
Fz=Fz(ldpe:length(Fz)-ldpe+1)

F = sqrt(Fx.^2+Fy.^2+Fz.^2);
figure (1); hold on
plot(F,'b');



