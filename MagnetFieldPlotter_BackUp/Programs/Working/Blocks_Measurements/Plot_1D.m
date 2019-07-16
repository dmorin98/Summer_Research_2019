clc
close all


 
 
%  %% Selecting the faces for the magnet RA10-1
%  
%  
 %% Block 1 Face 1
 load FieldMeas_Block_1_100x50x30_Longitudinal_1_NR
 LL=longitudinal_Field(F,vx,vy,vz);  
 
 plot(y,LL,'.b')
 hold on
% 
 %% Block 4 Face 1
 load FieldMeas_Block_4_100x50x30_Longitudinal_1_NR
 LL=longitudinal_Field(F,vx,vy,vz);  
 
 plot(y,LL,'.m')
 hold on
 %% Block 5 Face 1
 load FieldMeas_Block_5_100x50x30_Longitudinal_1_NR
 LL=longitudinal_Field(F,vx,vy,vz);  
 
 plot(y,LL,'.r')
 hold on 
  %% Block 8 Face 1
 load FieldMeas_Block_8_100x50x30_Longitudinal_1_NR
 LL=longitudinal_Field(F,vx,vy,vz);  
 
 plot(y,LL,'.k')
 hold on 
  %% Block 9 Face 1
 load FieldMeas_Block_9_100x50x30_Longitudinal_1_NR
 LL=longitudinal_Field(F,vx,vy,vz);  
 
 plot(y,LL,'.g')
 hold on 
 
 %%
 %%
 %%
 figure
 %% Block 1 Face 2
load FieldMeas_Block_1_100x50x30_Longitudinal_2_NL
LL=longitudinal_Field(F,vx,vy,vz); 

plot(y,LL,'.b')
hold on
%% Block 4 Face 2
load FieldMeas_Block_4_100x50x30_Longitudinal_2_NL
LL=longitudinal_Field(F,vx,vy,vz); 

plot(y,LL,'.m')
hold on

%% Block 5 Face 2
load FieldMeas_Block_5_100x50x30_Longitudinal_2_NL
LL=longitudinal_Field(F,vx,vy,vz); 

plot(y,LL,'.r')
hold on

 %% Block 8 Face 1
 load FieldMeas_Block_8_100x50x30_Longitudinal_2_NL
 LL=longitudinal_Field(F,vx,vy,vz);  
 
 plot(y,LL,'.k')
 hold on 
%% Block 9 Face 2
load FieldMeas_Block_9_100x50x30_Longitudinal_2_NL
LL=longitudinal_Field(F,vx,vy,vz); 

plot(y,LL,'.g')
hold on
%% Block 10 Face 2
load FieldMeas_Block_10_100x50x20_Longitudinal_2_NL
LL=longitudinal_Field(F,vx,vy,vz); 

plot(y,LL,'.y')
hold on

 
%  %% Block 3 Face 1
%  load FieldMeas_Block_3_100x50x30_Longitudinal_1_NR
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  
%  plot(y,LL,'k')
%  hold on  
% 
%  
%  %% Block 7 Face 1
%  load FieldMeas_Block_7_100x50x20_Longitudinal_1_NR
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  
%  plot(y,LL,'g')
%  hold on
%  figure
% 
% %% Block 2 Face 2
% load FieldMeas_Block_2_100x50x30_Longitudinal_2_NL
% LL=longitudinal_Field(F,vx,vy,vz); 
% 
% plot(y,LL,'.r')
% hold on
% %% Block 3 Face 2
% load FieldMeas_Block_3_100x50x30_Longitudinal_2_NL
% LL=longitudinal_Field(F,vx,vy,vz); 
% 
% plot(y,LL,'.k')
% hold on
% 
%  %% Block 7 Face 2
%  load FieldMeas_Block_7_100x50x20_Longitudinal_2_NL
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  
%  plot(y,LL,'g')
%  hold on



%% Block 1 Face 1
%  load FieldMeas_BA11-5_Longitudinal_1
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  LL= reshape(LL,1,vz(3));
%  plot(z+0.2,LL,'b')
%  hold on
%  load FieldMeas_BA11-5_Longitudinal_2
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  LL= reshape(LL,1,vz(3));
%  plot(z+0.2,LL,'r')
%  
%  load FieldMeas_BA11-5_Longitudinal_3
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  LL= reshape(LL,1,vz(3));
%  plot(z+0.2,LL,'k')
%  
%  figure
%  load FieldMeas_BA11-5_Longitudinal_4
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  LL= reshape(LL,1,vz(3));
%  plot((z+0.3)*10,(LL*1e-4)*42.576,'k','linewidth',2)
%  hold on
%  
%  plot((z(19)+0.3)*10,(LL(19)*1e-4)*42.576,'ks','markerface','k')
% 
%  xlabel('Distance from the surface (mm)','fontsize',18)
%  ylabel('Frequency (Hz)','fontsize',18)
%  grid
%  set(gca,'box','on','linewidth',2,'fontsize',18,'Xlim',[0 40])
%  figure
