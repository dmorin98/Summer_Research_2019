
% mide en un solo eje (z) y compenza el error de la punta.
%clear
init_motors
init_gauss
disp('Please remove your sample')
 
 %pause

X_min = 0;
Y_min = 0;
Z_min = 3.5;                %Zsh=-1; 
Zsh=-2.5;                  % zsh=2.65 is 1mm over SA1; 1.1 para BA11
pe=0.208;                %diferencia desde el centro de la punta hasta el area activa
sz = 0.1;
zm=7.8;    %maxima altura en z
Z = -Z_min:sz:Z_min;
dpe=[0:sz:pe]; ldpe=length(dpe);

%%%%%%%%%%%%%%%%%%%%%%
%   movem(s2,3,-10);
%   movem(s2,1,-20);
%   home_m(s2,2);
%   home_m(s2,3);
%   home_m(s2,1);
%   disp ('Motors Zeroed, insert your sample')
%  pause
%%%%%%%%%%%%%%%%%%%%%%%

Nadq=40;
sf=0;sfx=0;sfy=0;sfz=0;
for p=1:Nadq 
    p
  movem(s2,3,-50);
  movem(s2,3,zm+Z_min+Zsh);  

for i=1:3
    if i==3
    movem(s2,1,-pe);
    movem(s2,1,-pe);  
    movem(s2,2,pe);
    end
for k = 1:length(Z)
    
  for a=1:4
    delay;   %nuevo 
  end
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
movem(s2,2,-pe);
sz=-sz;



% field correction

fx=fliplr(Fx(2,:)); 
fy=Fy(3,:);
fz=Fz(1,:);
f = sqrt(fx.^2+fy.^2+fz.^2);
sfx=sfx+fx;
sfy=sfy+fy;
sfz=sfz+fz;
sf=sf+f;
end
end_m
stop_gauss

fx=sfx/Nadq;
fy=sfy/Nadq;
fz=sfz/Nadq;
f=sf/Nadq;


 df=diff(f);
 figure (1); plot(f); grid on
 figure (2); plot(df); grid on
 save BA11-1eee f