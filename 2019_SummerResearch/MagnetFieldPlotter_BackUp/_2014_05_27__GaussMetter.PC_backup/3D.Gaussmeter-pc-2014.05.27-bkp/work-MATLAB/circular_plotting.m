% Optimized for circular plotting.April 15th,2013.ppjk       
% It can measure only one component or the magnitude in each point
% WARNING: Be sure the minimun redius for the measurmente is at least 6mm
% longer than the magnet radius. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% close all;
% clear all;
% clc;
init_motors;
init_gauss;


measurement_axis='XYZ'       % It can be one axis          
Npp=5;                       % Numbar of point for averaging
zm=12.8;                     % Position of the probe in the z axis (12.8 for constant Grad. TC and 13 for Homg. spot)

    
for p=1:length(measurement_axis)
    mch=['CHNL ' measurement_axis(p)];
       
    movem(s2,3,-50);
    movem(s2,1,-80);
    home_m(s2,1);
    home_m(s2,2);
    clc
    display(['Measuring ' mch ' from ' measurement_axis]) 
    
   if measurement_axis(p)=='X'
       movem(s2,1,0.208);
    elseif measurement_axis(p)=='Y'
        movem(s2,2,0.208);  
    end
    r=(2.0:0.1:4.0); %minimum radius for 1 inch cylinder is 1.9 cm
    th=(0:pi/32:2*pi);
    x=zeros(length(r),length(th));
    y=zeros(length(r),length(th));
    x0=0;
    y0=0;
    
    for i=1:length(r)
        for j=1:length(th)
            [x(i,j),y(i,j)]=pol2cart(th(j),r(i));
            X(i,j)=round(x(i,j)*1000)/1000;
            Y(i,j)=round(y(i,j)*1000)/1000;
            x1=X(i,j)-x0;
            y1=Y(i,j)-y0;
            if i==1&&j==1
               movem(s2,2,y1);
               movem(s2,1,x1);
               movem(s2,3,zm);
            elseif (th(j)<pi/2) || th(j)>pi && th(j)<3*pi/2
               movem(s2,2,y1);
               movem(s2,1,x1);
            else 
               movem(s2,1,x1);
               movem(s2,2,y1);
            end
           x0=X(i,j);
           y0=Y(i,j);
           ff=0;
           delay;
           delay;
           for a=1:Npp
           fd= Newgetfield(s1,mch);
           ff=fd+ff;
           end
           F(i,j)=ff/Npp;      
        end
    end
movem(s2,3,-50);
dta(:,:,p)=F;
end
end_m
stop_gauss

if length(measurement_axis)==3
    Fm(:,:)=sqrt(dta(:,:,1).^2+dta(:,:,2).^2+dta(:,:,3).^2);
elseif length(measurement_axis)==1
    Fm(:,:)=dta(:,:,1);
end
    
time=clock;
save CircleMeas1D_xy X Y dta Fm time;

% figure(1);plot(Fm)
% figure (1); contourf(X,Y,Fm,100,'lineStyle','none');
% axis equal tight
% colorbar;
% set(gca,'Xdir','rev','YDir','rev')
% figure (2);hold on
% plot(r,Fm(:,1),'b','linewidth',2)
% plot(r,Fm(:,16),'r','linewidth',2)
% plot(r,Fm(:,32),'g','linewidth',2)
% plot(r,Fm(:,48),'k','linewidth',2)
% grid on; hold off

