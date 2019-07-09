

clc
close all
 %load FieldMeas3D_Andres
 %load FieldMeas3D_Prueba4
 load FieldMeas3D_Block1_longitudinal1

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

%% plot longitudinal
% plot(y,LL)
%% end

LL= reshape(LL,vx(3),vy(3),vz(3));
% 
% LL = permute(LL,[1 3 2]);
% size(LL)
% Bp = LL';
% ----------Original--------------------
LL = permute(LL,[2 1 3]);
LL = permute(LL,[3 2 1]);

%Bp = LL(:,:,7);
Bp = LL;
%------------------


 [X,Z]=meshgrid(x,z);
 contour(X*10,(Z)*10,Bp,8000)
 xlabel('Z (mm)','fontsize',16)
 ylabel('Y (mm)','fontsize',16)
 set(gca,'Xlim',[-50 50],'Ylim',[0 50],'Xtick',[-50:10:50],'linewidth',2 ,'fontsize',16,'box','on')

colorbar


figure
fc =((vx(3)-1)/2)+1; % central line
plot((Z(:,1))*10,Bp(:,fc),'k','linewidth',2)
 xlabel('distance from the surface (mm)','fontsize',16)
 ylabel('|B_0| (G)','fontsize',16)
 set(gca,'linewidth',2,'Xlim',[0 50],'fontsize',16,'box','on')
 grid
 