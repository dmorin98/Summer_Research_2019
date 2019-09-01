clear
init_motors
init_gauss
disp('Please remove your sample')
 
 %pause

X_min = 0;
Y_min = 0;
Z_min = 2.5;
Zsh=3.69;  
pe=0.208;                %diferencia desde el centro de la punta hasta el area activa
sz = 0.02;
Z = -Z_min:sz:Z_min;
dpe=[0:sz:pe]; ldpe=length(dpe);

 movem(s2,1,-20);
 home_m(s2,2);
 home_m(s2,3);
 home_m(s2,1);
 movem(s2,3,Z_min+Zsh);
 %movem(s2,2,Y_min);
 %movem(s2,3,Z_min+Zsh);


disp ('Motors Zeroed, insert your sample')
pause

for i=1:2
for k = 1:length(Z)
    F = getfield(s1);
    Fx(i,k) = F(1);
    Fy(i,k) = F(2);
    Fz(i,k) = F(3);
    if k~=length(Z)
        movem(s2,3,-sz);
        delay
    end
end
movem(s2,1,pe);
sz=-sz;
end
movem(s2,1,-pe);
movem(s2,1,-pe);



% field correction

fx=fliplr(Fx(2,:)); 
fy=Fy(1,:);
fz=Fz(1,:);
f = sqrt(fx.^2+fy.^2+fz.^2);

end_m
stop_gauss


df=diff(f);
figure (1); plot(f);
figure (2); plot(df);