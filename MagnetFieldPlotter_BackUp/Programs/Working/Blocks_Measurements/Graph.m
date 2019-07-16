

clc
%close all
 %load FieldMeas3D_Andres
 %load FieldMeas3D_Prueba4
 load Search_FieldMeas_RA10-2_Contour02
figure
  Bx = F(:,1);
 By = F(:,2);
 Bz = F(:,3); 
 LL = sqrt(Bx.^2+By.^2+Bz.^2);
 size LL


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

% Bp = LL';
% ----------Original--------------------
LL = permute(LL,[2 1 3]);
LL = permute(LL,[3 2 1]);

%Bp = LL(:,:,7);
Bp = LL;

 size(Bp)
%------------------

x
 [X,Z]=meshgrid(x,z);
 contour((X)*10,(Z+0.3)*10,Bp,73,'color','k')
 hold on
 contour((X)*10,(Z+0.3)*10,abs((Bp*1e-4)*42.576),[4.5 4.91],'color','r','LineStyle','-.')
 xlabel('Z (mm)','fontsize',16)
 ylabel('Y (mm)','fontsize',16)
  %grid
 set(gca,'Xlim',[-15 15],'Ylim',[3 30],'linewidth',2 ,'fontsize',16,'box','on')

 hold on
 plot(0,12,'o','markerfacecolor','k')
%colorbar


figure
fc =((vx(3)-1)/2)+1; % central line
plot((Z(:,1)+0.3)*10,Bp(:,fc)*1e-4*42.576,'linewidth',2)
 xlabel('distance from the surface (mm)','fontsize',16)
 ylabel('|B_0| (G)','fontsize',16)
 set(gca,'linewidth',2,'Xlim',[0 50],'fontsize',16,'box','on')
 grid
 
%  h(1) = axes('Position',[0.6 0.6 0.3 0.3]);
%  %plot((Z(8:12,1)+0.3)*10,Bp(8:12,13),'linewidth',2)
%   set(gca,'linewidth',2,'fontsize',16,'box','on')
 
 M = [Z(:,1) Bp(:,13)/10000];
 size Bp
 %save Profile_center_WA_1.txt M -ascii -tabs