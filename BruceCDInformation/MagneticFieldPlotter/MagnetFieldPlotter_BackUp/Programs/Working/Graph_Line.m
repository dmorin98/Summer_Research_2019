close all
load RA10-1_1D_Magnetic_field
B1=B;
B1=B1*1e-4*42.576;
fo1 = 4.8320;
zo = 12.5;
P90 = 9;
%% interpol
zi=z(1):0.02:z(end);
B1 = interp1(z,B1,zi);
z=zi;
%%
figure
z=z*10;

plot(z,B1,'-b','linewidth',2)
xlabel('Distance from the surface (mm)','fontsize',18)
ylabel('Frequency (MHz)','fontsize',18)
hold on
% plot(zo,fo1,'ok','markerfacecolor','k')
grid
 %set(gca,'box','on','linewidth',2,'fontsize',18,'Xlim',[5 30],'Ylim',[4.2 7],'Ytick',[4.0 4.2 4.4 4.8 4.8 5 ])

[a1 RL1] = min(abs(B1-(fo1-1/P90)));
[b1 LL1] = min(abs(B1-(fo1+1/P90)));





%%
hold on
load RA10-2_1D_Magnetic_field
B2=B;
B2=B2*1e-4*42.576;
fo2 = 4.6365;
zo = 12.5;
P90 = 11;
%% interpol
zi=z(1):0.02:z(end);
B2 = interp1(z,B2,zi);
z=zi;
%%

z=z*10;

plot(z,B2,'-r','linewidth',2)
xlabel('Distance from the surface (mm)','fontsize',18)
ylabel('Frequency (MHz)','fontsize',18)
hold on
plot(zo,fo1,'ok','markerfacecolor','k')
plot(zo,fo2,'ok','markerfacecolor','k')

 set(gca,'box','on','linewidth',2,'fontsize',18,'Xlim',[5 30],'Ylim',[4.2 5.2],'Ytick',[4.2 4.4 4.6365 4.8320 5 5.2],'Xtick',[5 7.5 12.5 17.5 22.5 27.5 30])

[a2 RL2] = min(abs(B2-(fo2-1/P90)));
[b2 LL2] = min(abs(B2-(fo2+1/P90)));

% plot(z(RL1),B1(RL1),'s',z(LL1),B1(LL1),'s')
%  plot(z(RL2),B2(RL2)-0.1,'s',z(LL2),B2(LL2)-0.1,'s')
plot([z(RL2) z(LL2)],[4.5 4.5],'-+k','linewidth',2)
z(LL2)-z(RL2)
legend('RA10-1','RA10-2')
grid on
text(7.5,5.1,{'f_o = 4.83 MHz';'B_o = 1135 G'},'fontsize',14,'color','b')
text(14.5,5.1,{'f_o = 4.64 MHz';'B_o = 1089 G'},'fontsize',14,'color','r')
text(11,4.45,'spot size \sim 11.0 mm','fontsize',14,'color','k')


print -f1 -r500 -dtiff  RA10-x_Graph_line


% %  errorbar_x(zo, fo1,zo-z(RL1), z(LL1)-zo,'k')
% errorbar_x(zo, fo2,z(RL2)-zo, zo-z(LL2),'k')
