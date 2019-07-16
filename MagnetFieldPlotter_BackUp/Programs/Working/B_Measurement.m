function B_Measurement(o1)

global eb pb hp tb
global vx vy vz x y z Mh zo dx dy dz Npp
%%-------------------------------------------------------------------------
try
    end_m
    stop_gauss

catch Exception
    disp('All motors and sensors have been initialized.')
end

if nargin == 0
    close all
    
    hp(1) = uipanel('Title','Parameters','FontSize',12,...
             'BackgroundColor','white','Position',[0 0 1/3 1]);
%     eb(1)=uicontrol('Style', 'edit', 'String', '5',...
%         'Position', [180 200 50 20]);
    
    
   tb(1)=uicontrol('parent',hp(1),'style', 'text', 'string', 'h Mag',...
        'units','normalized','position', [2/3 0.5 1/3 0.05]);
   eb(1)=uicontrol('parent',hp(1),'Style', 'edit', 'String', '5',...
        'units','normalized','Position', [2/3 .45 1/3 0.05]);
    
    pb(1)=uicontrol('parent',hp(1),'Style', 'push', 'String', 'Magnet',...
        'units','normalized','Position', [0 0 1/3 0.05],'callback','B_Measurement(1)');
    
    pb(2)=uicontrol('parent',hp(1),'Style', 'push', 'String', 'Run','enable','off',...
        'units','normalized','Position', [2/3 0 1/3 0.05],'callback','B_Measurement(2)');
    
    
    
    tb(2)=uicontrol('parent',hp(1),'style', 'text', 'string', 'Xmin',...
        'units','normalized','position', [0 0.95 1/3 0.05]);
    eb(2)=uicontrol('parent',hp(1),'style', 'edit', 'string', '-6',...
        'units','normalized','position', [0 0.9 1/3 0.05]);
    
     tb(3)=uicontrol('parent',hp(1),'style', 'text', 'string', 'Xmax',...
        'units','normalized','position', [1/3 0.95 1/3 0.05]);
    eb(3)=uicontrol('parent',hp(1),'style', 'edit', 'string', '6',...
        'units','normalized','position', [1/3 0.9 1/3 0.05]);
    
     tb(4)=uicontrol('parent',hp(1),'style', 'text', 'string', 'npx',...
        'units','normalized','position', [2/3 0.95 1/3 0.05]);
    eb(4)=uicontrol('parent',hp(1),'style', 'edit', 'string', '13',...
        'units','normalized','position', [2/3 0.9 1/3 0.05]);
    
     tb(5)=uicontrol('parent',hp(1),'style', 'text', 'string', 'Ymin',...
        'units','normalized','position', [0 0.85 1/3 0.05]);
    eb(5)=uicontrol('parent',hp(1),'style', 'edit', 'string', '-6',...
        'units','normalized','position', [0 0.8 1/3 0.05]);
    
     
    
    
    tb(6)=uicontrol('parent',hp(1),'style', 'text', 'string', 'Ymax',...
        'units','normalized','position', [1/3 0.85 1/3 0.05]);
    eb(6)=uicontrol('parent',hp(1),'style', 'edit', 'string', '6',...
        'units','normalized','position', [1/3 0.8 1/3 0.05]);
    
     tb(7)=uicontrol('parent',hp(1),'style', 'text', 'string', 'Nyp',...
        'units','normalized','position', [2/3 0.85 1/3 0.05]);
    eb(7)=uicontrol('parent',hp(1),'style', 'edit', 'string', '13',...
        'units','normalized','position', [2/3 0.8 1/3 0.05]);
%     
     tb(8)=uicontrol('parent',hp(1),'style', 'text', 'string', 'Zmin',...
        'units','normalized','position', [0 0.75 1/3 0.05]);
    eb(8)=uicontrol('parent',hp(1),'style', 'edit', 'string', '0',...
        'units','normalized','position', [0 .7 1/3 0.05]);
%     
     tb(9)=uicontrol('parent',hp(1),'style', 'text', 'string', 'Zmax',...
        'units','normalized','position', [1/3 0.75 1/3 0.05]);
    eb(9)=uicontrol('parent',hp(1),'style', 'edit', 'string', '5',...
        'units','normalized','position', [1/3 0.7 1/3 0.05]);
%     
     tb(10)=uicontrol('parent',hp(1),'style', 'text', 'string', 'Npz',...
        'units','normalized','position', [2/3 0.75 1/3 0.05]);
    eb(10)=uicontrol('parent',hp(1),'style', 'edit', 'string', '11',...
        'units','normalized','position', [2/3 0.7 1/3 0.05]);
    
    tb(10)=uicontrol('parent',hp(1),'style', 'text', 'string', 'avg',...
        'units','normalized','position', [0 0.5 1/3 0.05]);
    eb(11)=uicontrol('parent',hp(1),'Style', 'edit', 'String', '10',...
        'units','normalized','Position', [0 .45 1/3 0.05]);
    
    
    %moving the tip for the center, 1 for x axis, 2 for y axis, 3 for z axis
     init_motors
    %home_m(s2,1)
    %home_m(s2,2)
     home_m(s2,3)
     end_m
end


    


if nargin == 1 && o1 == 1
Mh = str2double(get(eb(1),'string'));     
vx = str2double(get(eb(2:4),'string')); 
vy = str2double(get(eb(5:7),'string')); 
vz = str2double(get(eb(8:10),'string')); 
Npp = str2double(get(eb(11),'string')); 

x = linspace(vx(1),vx(2),vx(3));
y = linspace(vy(1),vy(2),vy(3));
z = linspace(vz(1),vz(2),vz(3));
zo = (8-(z(1)+Mh+0.2));

if vx(3) ==1
    dx=0;
else
dx = x(2)-x(1);
end

if vy(3) ==1
    dy=0;
else
dy = y(2)-y(1);
end

if vz(3) ==1
    dz=0;
else
dz = z(2)-z(1);
end




    init_motors    
    movem(s2,3,zo);
    end_m
    
    set(pb(2),'enable','on')
end

if nargin ==1 && o1==2
     init_motors
    movem(s2,1,x(1));
    movem(s2,2,y(1));
    
    end_m
    
    
    
    c=0;
    
    F = zeros(vx(3)*vy(3)*vz(3),3);
    v = vx(3)*vy(3)*vz(3);
init_motors
init_gauss;
for kk = 1:vz(3)
    
    pz=-dz;
    if kk==1
        pz=0;
    end
    movem(s2,3,pz);
    
    for jj = 1:vy(3)
        
        py=dy*(-1)^(kk+1);
        if jj==1
            py=0;
        end
        movem(s2,2,py);
        
        for ii = 1:vx(3)            
            px=dx*(-1)^(jj+1)*(-1)^(kk+1);
            if ii==1
                px=0;
            end
            movem(s2,1,px);
            
            %% Measuring magnetic field
            ff=0;
            for a=1:Npp
                fd = getfield(s1);
                ff=fd+ff;
            end
            c=c+1;
            F(c,:)=ff/Npp;
           
            disp(['point ' num2str(c) ' of ' num2str(v)])
            
        end
        
    end
end
end_m
stop_gauss
  set(pb(1:2),'enable','off')  
time=clock;
save Search_FieldMeas_RA10-2_Contour02 vx vy vz x y z F  time
%Search_FieldMeas_RA10-2_line_7
%FieldMeas_Block_2_150x50x30_Face_2
%FieldMeas_Block_2_150x50x30_Longitudinal_2
end
    
    