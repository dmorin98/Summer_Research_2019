clear

init_motors
init_gauss

fprintf(s1,'CHNL V');
delay;
fprintf(s1,'ONOFF 1');

pz = 101;

zmin = 0;
zmax = 2;

Z = linspace(zmin,zmax,pz);

sz = Z(2)-Z(1);

for k = 1:length(Z)
    F = getfieldF(s1);
    Fx(k) = F(1);
    Fy(k) = F(2);
    Fz(k) = F(3);
    movem(s2,3,-sz);
end

fprintf(s1,'CHNL V');
delay;
fprintf(s1,'ONOFF 0');

end_m
stop_gauss