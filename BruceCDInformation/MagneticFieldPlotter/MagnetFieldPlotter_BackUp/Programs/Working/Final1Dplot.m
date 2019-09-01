figure
 load FieldMeas_BA11-5_Longitudinal_4
 LL=longitudinal_Field(F,vx,vy,vz);  
 LL= reshape(LL,1,vz(3));
 plot((z+0.3)*10,(LL*1e-4)*42.576,'k','linewidth',2)
 hold on
 
 plot((z(19)+0.3)*10,(LL(19)*1e-4)*42.576,'ks','markerface','k')

 xlabel('Distance from the surface (mm)','fontsize',18)
 ylabel('Frequency (Hz)','fontsize',18)
 grid
 set(gca,'box','on','linewidth',2,'fontsize',18,'Xlim',[0 40])
 figure