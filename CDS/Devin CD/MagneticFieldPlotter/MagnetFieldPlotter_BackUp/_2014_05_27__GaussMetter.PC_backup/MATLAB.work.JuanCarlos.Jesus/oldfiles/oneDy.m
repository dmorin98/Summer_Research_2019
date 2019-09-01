clear
disp('Please remove your sample')
%pause

init_motors
init_gauss

X_min = 0;
Y_min = 2.5;
Z_min = 2.5;
Zsh=1;

% home_m(s2,1);
 %home_m(s2,2);
% home_m(s2,3);
% movem(s2,1,-X_min);
 %movem(s2,2,-Y_min);
% movem(s2,3,Z_min+Zsh);

sz = 0.2;
Y = -Y_min:sz:Y_min;

disp ('Motors Zeroed, insert your sample')
%pause

for k = 1:length(Y)
    F = getfield(s1);
    Fx(k) = F(1);
    Fy(k) = F(2);
    Fz(k) = F(3);
    if k~=length(Y)
        movem(s2,2,sz);
    end
end

end_m
stop_gauss
F = sqrt(Fx.^2+Fy.^2+Fz.^2);
figure; plot(Fx)
figure; plot(Fy)
figure; plot(Fz)
figure; plot(F)