function LL=longitudinal_Field(F,vx,vy,vz)
Bx = F(:,1);
 By = F(:,2);
 Bz = F(:,3); 
 LL = sqrt(Bx.^2+By.^2+Bz.^2);
 %LL = Bx;
 %LL = Bz.*Bz;

disp('---------------------------------------------------')
for ii=1:vz(3)
    I = (-1)^ii;
    vxx = LL((ii-1)*vx(3)*vy(3)+1:(ii-0)*vx(3)*vy(3));
    if I==1
        vxx = vxx(end:-1:1);
        LL((ii-1)*vx(3)*vy(3)+1:(ii-0)*vx(3)*vy(3)) = vxx;
    end
    for jj=1:vy(3)
        I = (-1)^jj;
        if I==1
            vyy = vxx((jj-1)*vx(3)+1:(jj-0)*vx(3));
            vyy= vyy(end:-1:1);
            vxx((jj-1)*vx(3)+1:(jj-0)*vx(3))= vyy;
        end
    end
    LL((ii-1)*vx(3)*vy(3)+1:(ii-0)*vx(3)*vy(3)) = vxx;
end

LL= reshape(LL,vx(3),vy(3),vz(3));