

clc
close all
 %load FieldMeas3D_Andres
 load FieldMeas3D_Prueba4

  Bx = F(:,1);
 By = F(:,2);
 Bz = F(:,3); 
 LL = sqrt(Bx.^2+By.^2+Bz.^2);
 

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

LL = permute(LL,[2 1 3]);
LL = permute(LL,[3 2 1]);

%Bp = LL(:,:,7);
Bp = LL;
 [X,Z]=meshgrid(x,z)
 contour(X*10,Z*10,Bp./10000,100)
 xlabel('X (mm)','fontsize',16)
 ylabel('Z (mm)','fontsize',16)
set(gca,'Ylim',[0 10],'linewidth',2 ,'fontsize',16,'box','on')
grid
colorbar


figure
plot(Z(:,1)+0.2,Bp(:,13)/10000,'linewidth',2)
 xlabel('X (cm)','fontsize',16)
 ylabel('B (T)','fontsize',16)
 set(gca,'Xlim',[0 3],'Ylim',[0.12 0.17], 'linewidth',2 ,'fontsize',16,'box','on')
 
 M = [Z(:,1)+0.2 Bp(:,13)/10000]
 
 save Profile_center_CP1.txt M -ascii -tabs