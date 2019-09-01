close all
fo = 4.8320; % MHz
pw = 9;    % pulse width (us)
load RA10-1_2D_Magnetic_field
%% interpolation

x = x(1):0.01:x(end);
z = z(1):0.01:z(end);
[XI ZI]=meshgrid(x,z);

B = interp2(X,Z,B,XI,ZI);
max(max(B))*1e-4*42.576;
min(min(B))*1e-4*42.576;
X = XI;
Z = ZI;
%%
figure
lines=[linspace(2,4.7,20) linspace(4.93,15,100)];
contour(X*10,Z*10,B*1e-4*42.576,lines)
colormap jet
% contour(X*10,Z*10,B*1e-4*42.576,[3:0.2:fo-1/pw fo-1/pw+0.02 fo-1/pw+0.1  -0.1+fo+1/pw -0.03+fo+1/pw:0.2:25],'color','k')
 hold on
 contour(X*10,Z*10,B*1e-4*42.576,[fo-1/pw fo+1/pw],'color','r','linestyle','--','linewidth',2)
% hold on
% % contour(X*10,Z*10,B*1e-4*42.576,[f1-1/pw f1+1/pw],'color','g','linestyle','--')

xlabel('Z (mm)','fontsize',16)
 ylabel('Y (mm)','fontsize',16)
% set(gca,'Xlim',[-20 20],'Ylim',[5 32],'linewidth',2 ,'fontsize',16,'box','on')
%  
 
 
 
%  fo = 4.64; % MHz
% pw = 11;    % pulse width (us)
% load RA10-2_2D_Magnetic_field
% %% interpolation
% z(1)
%  plot(z,B(:,22)*1e-4*42.576)
% 
% x = x(1):0.01:x(end);
% z = z(1):0.01:z(end);
% [XI ZI]=meshgrid(x,z);
% 
% B = interp2(X,Z,B,XI,ZI);
% max(max(B))*1e-4*42.576;
% min(min(B))*1e-4*42.576;
% X = XI;
% Z = ZI;
% %%
% figure
% lines=[linspace(2,fo-1/pw+0.015,20) linspace(fo+1/pw-0.015,15,100)];
% contour(X*10,Z*10,B*1e-4*42.576,lines)
% colormap jet
%  hold on
%  contour(X*10,Z*10,B*1e-4*42.576,[fo-1/pw fo+1/pw],'color','r','linestyle','--','linewidth',2)
% 
% 
% xlabel('Z (mm)','fontsize',16)
%  ylabel('Y (mm)','fontsize',16)
%  set(gca,'Xlim',[-20 20],'Ylim',[5 32],'linewidth',2 ,'fontsize',16,'box','on')
 
 
 %print -f1 -r500 -dtiff  RA10-2_Graph_contour_color_(11us)

