%% RA10-2
figure
 load Search_FieldMeas_RA10-2_line_4
 LL=longitudinal_Field(F,vx,vy,vz);  
 LL= reshape(LL,1,vz(3));
 plot((z+0.2)*10,(LL*1e-4)*42.576,'k','linewidth',2)
 hold on
 
 plot(12,(LL(19)*1e-4)*42.576,'ks','markerface','k')

 xlabel('Distance from the surface (mm)','fontsize',18)
 ylabel('Frequency (Hz)','fontsize',18)
 grid
 set(gca,'box','on','linewidth',2,'fontsize',18,'Xlim',[0 30], 'Ytick',[3 4 4.66 4.76 4.86 5 5.5])

  
  load Search_FieldMeas_RA10-2_line_7
 LL=longitudinal_Field(F,vx,vy,vz);  
 LL= reshape(LL,1,vz(3));
 plot((z+0.4)*10,(LL*1e-4)*42.576,'g','linewidth',2)
 hold on
%  load Search_FieldMeas_RA10-2_line_5
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  LL= reshape(LL,1,vz(3));
%  plot((z+0.3)*10,(LL*1e-4)*42.576,'m','linewidth',2)
%  hold on
%   load Search_FieldMeas_RA10-2_line_6
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  LL= reshape(LL,1,vz(3));
%  plot((z+0.3)*10,(LL*1e-4)*42.576,'y','linewidth',2)
%  hold on
%  load Search_FieldMeas_RA10-2_line_2
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  LL= reshape(LL,1,vz(3));
%  plot((z+0.2)*10,(LL*1e-4)*42.576,'b','linewidth',2)
%  hold on
%   load Search_FieldMeas_RA10-2_line_3
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  LL= reshape(LL,1,vz(3));
%  plot((z+0.2)*10,(LL*1e-4)*42.576,'r','linewidth',2)
%  hold on
%% RA10-1
% figure
%  load Search_FieldMeas_RA10-1_line_01
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  LL= reshape(LL,1,vz(3));
%  plot((z+0.2)*10,(LL*1e-4)*42.576,'k','linewidth',2)
%  hold on
%  
% %  plot((z(19)+0.3)*10,(LL(19)*1e-4)*42.576,'ks','markerface','k')
% % 
% %  xlabel('Distance from the surface (mm)','fontsize',18)
% %  ylabel('Frequency (Hz)','fontsize',18)
% %  grid
% %  set(gca,'box','on','linewidth',2,'fontsize',18,'Xlim',[0 40])
% 
%  hold on
%  load Search_FieldMeas_RA10-1_line_02
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  LL= reshape(LL,1,vz(3));
%  plot((z+0.2)*10,(LL*1e-4)*42.576,'b','linewidth',2)
%  hold on
% 
%   load Search_FieldMeas_RA10-1_line_03
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  LL= reshape(LL,1,vz(3));
%  plot((z+0.2)*10,(LL*1e-4)*42.576,'r','linewidth',2)
%  hold on
%  
%   load Search_FieldMeas_RA10-1_line_04
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  LL= reshape(LL,1,vz(3));
%  plot((z+0.2)*10,(LL*1e-4)*42.576,'g','linewidth',2)
%  hold on
%  
%  load Search_FieldMeas_RA10-1_line_05
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  LL= reshape(LL,1,vz(3));
%  plot((z+0.2)*10,(LL*1e-4)*42.576,'m','linewidth',2)
%  hold on
%  
%   load Search_FieldMeas_RA10-1_line_06
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  LL= reshape(LL,1,vz(3));
%  plot((z+0.2)*10,(LL*1e-4)*42.576,'.-k','linewidth',2)
%  hold on
%  set(gca,'Xlim',[0 40],'Xtick',[0:2:40],'linewidth',2 ,'fontsize',16,'box','on')
%   grid
%   
%   figure
%    load Search_FieldMeas_RA10-1_line_07
%  LL=longitudinal_Field(F,vx,vy,vz);  
%  LL= reshape(LL,1,vz(3));
%  plot((z+0.3)*10,(LL*1e-4)*42.576,'-k','linewidth',2)
%  hold on
%  set(gca,'Xlim',[2 30],'Xtick',[0:2:30],'linewidth',2 ,'fontsize',18,'box','on')
%   grid
%   hold on
%  plot(12,4.95,'ko','markerface','k')
% 
%  xlabel('Distance from the surface (mm)','fontsize',18)
%  ylabel('Frequency (Hz)','fontsize',18)
%  

