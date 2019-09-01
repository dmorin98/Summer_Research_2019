%   This is the MagFieldMeas which is used to measure magnetic field with the
%   LakeShore Gaussmeter, and Velmex stepping motors.
%   
%   This was last updated June 28th 2019 by Devin Morin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function MagFieldMeas(o1,o2)

global hp pb cb eb tb ax
global zo xyE zE s1 s2 L increment check

if nargin ==0
    close all
    scrsz = get(0,'ScreenSize');
    scrsz(4)=scrsz(4)-60;
    figure('NumberTitle','off','Name',...
        'Magnetic Field Measurement','position',scrsz);
    %% 1D Measurement
    hp(1)= uipanel('Title','1D Measurement','FontSize',12,'units',...
        'normalized','Position',[0.01 0.55 1/4 .20 ]);
    cb(1) = uicontrol('parent',hp(1),'Style', 'check','units','normalized',...
        'String','X','Position',[0 0.8 1/5 .1],'value',0,'fontsize',13,'Callback','MagFieldMeas(1,1)');
    cb(2) = uicontrol('parent',hp(1),'Style', 'check','units','normalized',...
        'String','Y','Position',[2/5 .8 1/5 .1],'value',0,'fontsize',13,'Callback','MagFieldMeas(1,2)');
    cb(3) = uicontrol('parent',hp(1),'Style', 'check','units','normalized',...
        'String','Z','Position',[4/5 .8 1/5 .1],'value',1,'fontsize',13,'Callback','MagFieldMeas(1,3)');
    
    tb(1) = uicontrol('parent',hp(1),'Style', 'text','units','normalized',...
        'String','Z+','Position',[0 .25 1/5 .3],'value',1,'fontsize',13,'Callback','');
    tb(2) = uicontrol('parent',hp(1),'Style', 'text','units','normalized',...
        'String','Z-','Position',[2/4 .25 1/5 .3],'value',1,'fontsize',13,'Callback','');
    
    eb(1) = uicontrol('parent',hp(1),'Style', 'edit','units','normalized',...
        'String','0','Position',[1/4 .25 1/5 .3],'value',1,'fontsize',13,'Callback','');
    eb(2) = uicontrol('parent',hp(1),'Style', 'edit','units','normalized',...
        'String','5','Position',[3/4 .25 1/5 .3],'value',1,'fontsize',13,'Callback','');
    %% 2D Measurement
    hp(2)= uipanel('Title','2D Measurement','FontSize',12,'units',...
        'normalized','Position',[0.01 0.33 1/4 .20 ]);
    cb(4) = uicontrol('parent',hp(2),'Style', 'check','units','normalized',...
        'String','XY','Position',[0 .8 1/5 .1],'value',1,'fontsize',13,'Callback','MagFieldMeas(2,1)');
    cb(5) = uicontrol('parent',hp(2),'Style', 'check','units','normalized',...
        'String','YZ','Position',[2/5 .8 1/5 .1],'value',0,'fontsize',13,'Callback','MagFieldMeas(2,2)');
    cb(6) = uicontrol('parent',hp(2),'Style', 'check','units','normalized',...
        'String','ZX','Position',[4/5 .8 1/5 .1],'value',0,'fontsize',13,'Callback','MagFieldMeas(2,3)');
    
    
    
    tb(3) = uicontrol('parent',hp(2),'Style', 'text','units','normalized',...
        'String','X min','Position',[0 .25 1/5 .3],'value',1,'fontsize',13,'Callback','');
    tb(4) = uicontrol('parent',hp(2),'Style', 'text','units','normalized',...
        'String','X max','Position',[2/4 .25 1/5 .3],'value',1,'fontsize',13,'Callback','');
    tb(5) = uicontrol('parent',hp(2),'Style', 'text','units','normalized',...
        'String','Y min','Position',[0 0 1/5 .3],'value',1,'fontsize',13,'Callback','');
    tb(6) = uicontrol('parent',hp(2),'Style', 'text','units','normalized',...
        'String','Y max','Position',[2/4 0 1/5 .3],'value',1,'fontsize',13,'Callback','');

    eb(3) = uicontrol('parent',hp(2),'Style', 'edit','units','normalized',...
        'String','-2','Position',[1/4 .4 1/5 .3],'value',1,'fontsize',13,'Callback','');
    eb(4) = uicontrol('parent',hp(2),'Style', 'edit','units','normalized',...
        'String','2','Position',[3/4 .4 1/5 .3],'value',1,'fontsize',13,'Callback','');
    eb(5) = uicontrol('parent',hp(2),'Style', 'edit','units','normalized',...
        'String','0','Position',[1/4 0.05 1/5 .3],'value',1,'fontsize',13,'Callback','');
    eb(6) = uicontrol('parent',hp(2),'Style', 'edit','units','normalized',...
        'String','5','Position',[3/4 0.05 1/5 .3],'value',1,'fontsize',13,'Callback','');
    %% data
    hp(3)= uipanel('Title','Data','FontSize',12,'units',...
        'normalized','Position',[0.01 0.77 1/4 .2 ]);
    
    tb(7) = uicontrol('parent',hp(3),'Style', 'text','units','normalized',...
        'String','Height (cm)','Position',[0 0.8 1/3 .2],'fontsize',13,'Callback','');
    tb(8) = uicontrol('parent',hp(3),'Style', 'text','units','normalized',...
        'String','averages','Position',[1/3 .8 1/3 .2],'fontsize',13,'Callback','');
    tb(9) = uicontrol('parent',hp(3),'Style', 'text','units','normalized',...
        'String','Center','Position',[2/3 .8 1/3 .2],'fontsize',13,'Callback','');
    
    eb(7) = uicontrol('parent',hp(3),'Style', 'edit','units','normalized',...
        'String','7.81','Position',[0.05 .4 1/5 .3],'value',1,'fontsize',13,'Callback','');
    eb(8) = uicontrol('parent',hp(3),'Style', 'edit','units','normalized',...
        'String','1','Position',[0.4 .4 1/5 .3],'value',1,'fontsize',13,'Callback','');
    
    
    cb(7) = uicontrol('parent',hp(3),'Style', 'check','units','normalized',...
        'String','X','Position',[4/5 2/3 1/5 .1],'value',0,'fontsize',13,'Callback','MagFieldMeas(3,1)');
    cb(8) = uicontrol('parent',hp(3),'Style', 'check','units','normalized',...
        'String','Y','Position',[4/5 1/3 1/5 .1],'value',0,'fontsize',13,'Callback','MagFieldMeas(3,2)');
    cb(9) = uicontrol('parent',hp(3),'Style', 'check','units','normalized',...
        'String','Z','Position',[4/5 0.05 1/5 .1],'value',0,'fontsize',13,'Callback','MagFieldMeas(3,3)');
    
    pb(1) = uicontrol('parent',hp(3),'Style', 'push','units','normalized',...
        'String','tip','Position',[0.15 0.05 1/3 .3],'fontsize',13,'Callback','MagFieldMeas(1)');
    %% others
    
    hp(4)= uipanel('Title','','FontSize',12,'units',...
        'normalized','Position',[0.01 0.05 0.2 .1 ]);
    pb(2) = uicontrol('parent',hp(4),'Style', 'push','units','normalized',...
        'String','Run','Position',[0 0 1/2 1],'fontsize',13,'Callback','MagFieldMeas(2)');
    pb(3) = uicontrol('parent',hp(4),'Style', 'push','units','normalized',...
        'String','Stop','Position',[1/2 0 1/2 1],'fontsize',13,'Callback','break');
    %     pb(3) = uicontrol('parent',hp(3),'Style', 'push','units','normalized',...
    %         'String','OK','Position',[4/9 0 1/9 1],'fontsize',13,'Callback','');
    %     pb(3) = uicontrol('parent',hp(3),'Style', 'push','units','normalized',...
    %         'String','OK','Position',[6/9 0 1/9 1],'fontsize',13,'Callback','');
    %     pb(5) = uicontrol('parent',hp(3),'Style', 'push','units','normalized',...
    %         'String','OK','Position',[8/9 0 1/9 1],'fontsize',13,'Callback','');
    %
    
    %%Increment
    hp(5)= uipanel('Title','Probe','FontSize',12,'units',...
        'normalized','Position',[0.01 0.20 0.3 .12 ]);
    
    tb(10) = uicontrol('parent',hp(5),'Style', 'text','units','normalized',...
        'String','Increment(cm)','Position',[0 0.8 1/3 .26],'fontsize',13,'Callback','');
    eb(9) = uicontrol('parent',hp(5),'Style', 'edit','units','normalized',...
        'String','1','Position',[0.07 .4 1/5 .3],'value',1,'fontsize',13,'Callback','');
    cb(10) = uicontrol('parent',hp(5),'Style', 'check','units','normalized',...
        'String','Remove Jiggle','Position',[0.5 0.4 0.5 .3],'value',0,'fontsize',13);
    
    
    increment = str2double(get(eb(9),'string'));

    ax(1)=axes('position',[0.35 0.25 0.6 0.7]);
    set(gca,'linewidth',2,'box','on','FontSize',18)
    xlabel(ax(1),'X (mm)','FontSize',16)
    ylabel(ax(1),'Y (mm)','FontSize',16)
    
    
    set(cb(1:6),'enable','off')
    set(eb(1:6),'enable','off')
    
    xyE = 0.208;  %This is the diameter of the probe
    zE = 0.18;    %This is the length from sensitive area to probe tip
    
    
    
end

%% centering and moving the tip to the initial position
if nargin==1 && o1==1
    axx = get(cb(7),'value');
    axy = get(cb(8),'value');
    axz = get(cb(9),'value');
    
    if axx == 1
        start
        home_m(s2,1)
        stop
    end
    if axy == 1
        start
        home_m(s2,2)
        stop
    end
    if axz == 1
        start
        home_m(s2,3)
        stop
    end
    
    start
    
    Mh = str2double(get(eb(7),'string'));
    zo = (8-(Mh+0.2));
    movem(s2,3,zo);
    stop
    
    set(cb(1:6),'enable','on')
    %set(eb(1:2),'enable','off')
end
%% Selecting the measurent
if nargin == 2
    if o1==1 && o2 ==1
        set(cb(1),'value',1);
        set(cb(2:6),'value',0);
        set(tb(1),'String','X+');
        set(tb(2),'String','X-')
        set(eb(3:6),'enable','off')
        set(tb(3:6),'enable','off')
        set(eb(1:2),'enable','on')
        set(tb(1:2),'enable','on')
        
        xlabel(ax(1),'X (mm)','FontSize',16)
        ylabel(ax(1),'B_0 (G)','FontSize',16)
        L=1;
    elseif o1==1 && o2 ==2
        set(cb(1),'value',0)
        set(cb(2),'value',1)
        set(cb(3:6),'value',0)
        set(tb(1),'String','Y+')
        set(tb(2),'String','Y-')
        set(eb(3:6),'enable','off')
        set(tb(3:6),'enable','off')
        set(eb(1:2),'enable','on')
        set(tb(1:2),'enable','on')
        xlabel(ax(1),'Y (mm)','FontSize',16)
        ylabel(ax(1),'B_0 (G)','FontSize',16)
        L=2;
    elseif o1==1 && o2 ==3
        set(cb(1:2),'value',0)
        set(cb(3),'value',1)
        set(cb(4:6),'value',0)
        set(tb(1),'String','Z+');
        set(tb(2),'String','Z-')
        set(eb(3:6),'enable','off')
        set(tb(3:6),'enable','off')
        set(eb(1:2),'enable','on')
        set(tb(1:2),'enable','on')
        xlabel(ax(1),'Distance from the surface (mm)','FontSize',16)
        ylabel(ax(1),'B_0 (G)','FontSize',16)
        L=3;
    elseif o1==2 && o2 ==1
        set(cb(1:3),'value',0)
        set(cb(4),'value',1)
        set(cb(5:6),'value',0)
        set(eb(3:6),'enable','on')
        set(tb(3:6),'enable','on')
        set(eb(1:2),'enable','off')
        set(tb(1:2),'enable','off')
        set(tb(3),'String','X min')
        set(tb(4),'String','X max')
        set(tb(5),'String','Y min')
        set(tb(6),'String','Y max')
        xlabel(ax(1),'X (mm)','FontSize',16)
        ylabel(ax(1),'Y (mm)','FontSize',16)
        L=4;
    elseif o1==2 && o2 ==2
        set(cb(1:4),'value',0)
        set(cb(5),'value',1)
        set(cb(6),'value',0)
        set(eb(3:6),'enable','on')
        set(tb(3:6),'enable','on')
        set(eb(1:2),'enable','off')
        set(tb(1:2),'enable','off')
        set(tb(3),'String','Y min')
        set(tb(4),'String','Y max')
        set(tb(5),'String','Z min')
        set(tb(6),'String','Z max')
        xlabel(ax(1),'Y (mm)','FontSize',16)
        ylabel(ax(1),'Z (mm)','FontSize',16)
        L=5;
    elseif o1==2 && o2 ==3
        set(cb(6),'value',1)
        set(cb(1:5),'value',0)
        set(eb(3:6),'enable','on')
        set(tb(3:6),'enable','on')
        set(eb(1:2),'enable','off')
        set(tb(1:2),'enable','off')
        set(tb(3),'String','Z min')
        set(tb(4),'String','Z max')
        set(tb(5),'String','X min')
        set(tb(6),'String','X max')
        xlabel(ax(1),'X (mm)','FontSize',16)
        ylabel(ax(1),' Z (mm)','FontSize',16)
        L=6;
    end
    
    
end
increment = str2double(get(eb(9),'string'));
if nargin == 1 && o1 == 2
    check = get(cb(10), 'value');
    Npp = str2double(get(eb(8),'string'));
    
    start

    if L==3
        Zmin = str2double(get(eb(1),'string'));
        Zmax = str2double(get(eb(2),'string'));
        
        step = 0;
        totalSteps = (Zmax-Zmin)/increment;
        z = Zmin:increment:Zmax;
        z = z + zE;
        nz = length(z);
        Bx = zeros(nz,1);
        By = zeros(nz,1);
        Bz = zeros(nz,1);
        B = zeros(nz,1);
        for kk =1:nz
            if check == 1
                F = FieldM(Npp,s1);
                Bz(kk)=F(3);
                By(kk)=F(2);
                Bx(kk)=F(1);
            else 
                F = FieldM(Npp,s1);
                Bz(kk)=F(3);
                movem(s2,2,xyE);
                F = FieldM(Npp,s1);
                By(kk)=F(2);
                movem(s2,2,-xyE);
                movem(s2,1,xyE);
                F = FieldM(Npp,s1);
                Bx(kk)=F(1);
                movem(s2,1,-xyE);
            end
            
            
            fprintf('Step %d out of %d.\n', step, totalSteps);
            
            step = step + 1;
               
            movem(s2,3,-increment);
            hold on
            B(kk) = sqrt(Bx(kk).^2 + By(kk).^2 + Bz(kk).^2);
            plot(ax(1),z(1:kk),B(1:kk),'-k','linewidth',2)
            xlabel(ax(1),'Distance from the surface (mm)','FontSize',16)
            ylabel(ax(1),'B_0 (G)','FontSize',16)
            drawnow
        end
            save Z_1D_Magnetic_field Bx By Bz B z
    end
        if L==1

            Xmin = str2double(get(eb(1),'string'));
            Xmax = str2double(get(eb(2),'string'));

            step = 0;
            totalSteps = (Xmax-Xmin)/increment;
            x = Xmin:increment:Xmax;

            nx = length(x);
            Bx = zeros(nx,1);
            By = zeros(nx,1);
            Bz = zeros(nx,1);
            B = zeros(nx,1);
            for kk =1:nx
                
                fprintf('Step %d out of %d.\n', step, totalSteps);
                step = step + 1;

                if check == 1
                    F = FieldM(Npp,s1);
                    Bz(kk)=F(3);
                    By(kk)=F(2);
                    Bx(kk)=F(1);
                else
                    F = FieldM(Npp,s1);
                    Bz(kk)=F(3);
                    movem(s2,2,xyE);
                    F = FieldM(Npp,s1);
                    By(kk)=F(2);
                    movem(s2,2,-xyE);
                    movem(s2,1,xyE);
                    F = FieldM(Npp,s1);
                    Bx(kk)=F(1);
                    movem(s2,1,-xyE);
                end
                movem(s2,1,-increment)
                hold on
                B(kk) = sqrt(Bx(kk).^2 + By(kk).^2 + Bz(kk).^2);
                plot(ax(1),x(1:kk),B(1:kk),'-k','linewidth',2)
                xlabel(ax(1),'X (mm)','FontSize',16)
                ylabel(ax(1),'B_0 (G)','FontSize',16)
                drawnow
            end
            save X_1D_Magnetic_field Bx By Bz B x
        end
            
        if L==2

            Ymin = str2double(get(eb(1),'string'));
            Ymax = str2double(get(eb(2),'string'));

            step = 0;
            totalSteps = (Ymax-Ymin)/increment;
            y = Ymin:increment:Ymax;

            ny = length(y);
            Bx = zeros(ny,1);
            By = zeros(ny,1);
            Bz = zeros(ny,1);
            B = zeros(ny,1);
            for kk =1:ny
                
                fprintf('Step %d out of %d.\n', step, totalSteps);
                step = step + 1;
                if check == 1
                    F = FieldM(Npp,s1);
                    Bz(kk)=F(3); 
                    By(kk)=F(2);
                    Bx(kk)=F(1);  
                else
                    F = FieldM(Npp,s1);
                    Bz(kk)=F(3);
                    movem(s2,2,xyE);
                    F = FieldM(Npp,s1);
                    By(kk)=F(2);
                    movem(s2,2,-xyE);
                    movem(s2,1,xyE);
                    F = FieldM(Npp,s1);
                    Bx(kk)=F(1);
                    movem(s2,1,-xyE);
                end
                movem(s2,2,-increment);
                hold on
                B(kk) = sqrt(Bx(kk).^2 + By(kk).^2 + Bz(kk).^2);
                plot(ax(1),y(1:kk),B(1:kk),'-k','linewidth',2)
                xlabel(ax(1),'Y (mm)','FontSize',16)
                ylabel(ax(1),'B_0 (G)','FontSize',16)
                drawnow
     
            end
            save Y_1D_Magnetic_field Bx By Bz B y
        end
        if L==4

            Xmin = str2double(get(eb(3),'string'));
            Xmax = str2double(get(eb(4),'string'));
            Ymin = str2double(get(eb(5),'string'));
            Ymax = str2double(get(eb(6),'string'));
            x = Xmin:increment:Xmax;
            y = Ymin:increment:Ymax;
            nx = length(x);
            ny = length(y);
            Bx = zeros(nx,ny);
            By = zeros(nx,ny);
            Bz = zeros(nx,ny);
            B = zeros(nx,ny);
            step = 0;
            for kk =1:nx
           
                
                if kk == 1
                    movem(s2,2,Ymin);
                else
                    movem(s2,2,-(Ymax-Ymin));
                end
                for ii = 1:ny
                    if check == 1
                        F = FieldM(Npp,s1);
                        Bz(kk,ii)=F(3);
                        By(kk,ii)=F(2);
                        Bx(kk,ii)=F(1);
                    else
                        F = FieldM(Npp,s1);
                        Bz(kk,ii)=F(3);
                        movem(s2,2,xyE);
                        F = FieldM(Npp,s1);
                        By(kk,ii)=F(2);
                        movem(s2,2,-xyE);
                        movem(s2,1,xyE);
                        F = FieldM(Npp,s1);
                        Bx(kk,ii)=F(1);
                        movem(s2,1,-xyE);
                    end
                    %This isnt working
                    %incLeft = ((Xmax-Xmin+1)*(Ymax-Ymin))/increment;
                    %fprintf('Step %d out of %d. \n', step, incLeft)
     
                    step = step+1;
                    if ii==ny
                        movem(s2,1,-increment);
                    else
                        movem(s2,2,increment);
                    end
                    B(kk,ii) = sqrt(Bx(kk,ii).^2 + By(kk,ii).^2 + Bz(kk,ii).^2);                
                end



                if kk>=2
                    cla
                    [Y X] = meshgrid(y,x(1:kk));
                    size(Y)
                    size(X)
                    size(B(1:kk,:))

                    contour(Y,X,B(1:kk,:),100)
                    xlabel(ax(1),'X (mm)','FontSize',16)
                    ylabel(ax(1),'Y (mm)','FontSize',16)
                    drawnow
                end
                if kk==ny
                    movem(s2,2,-Ymax);
                end

            end

            save XY_2D_Magnetic_field01 Bx By Bz B y x
        end
        %For YZ
        if L==5

            Ymin = str2double(get(eb(3),'string'));
            Ymax = str2double(get(eb(4),'string'));
            Zmin = str2double(get(eb(5),'string'));
            Zmax = str2double(get(eb(6),'string'));
            z = Zmin:increment:Zmax;
            y = Ymin:increment:Ymax;
            z = z + zE;
            nz = length(z);
            ny = length(y);
            Bx = zeros(ny,nz);
            By = zeros(ny,nz);
            Bz = zeros(ny,nz);
            B = zeros(ny,nz);

            for kk =1:ny
                if kk == 1
                    movem(s2,3,Zmin);
                else
                    movem(s2,3,-(Zmax-Zmin));
                end
                for ii = 1:nz
                    if check == 1
                        F = FieldM(Npp,s1);
                        Bz(kk,ii)=F(3);
                        By(kk,ii)=F(2);
                        Bx(kk,ii)=F(1);
                      
                    else
                        F = FieldM(Npp,s1);
                        Bz(kk,ii)=F(3);
                        movem(s2,2,xyE);
                        F = FieldM(Npp,s1);
                        By(kk,ii)=F(2);
                        movem(s2,2,-xyE);
                        movem(s2,1,xyE);
                        F = FieldM(Npp,s1);
                        Bx(kk,ii)=F(1);
                        movem(s2,1,-xyE);
                    end

                    if ii==nz
                        movem(s2,2,-increment);
                    else
                        movem(s2,3,increment);
                    end
                    B(kk,ii) = sqrt(Bx(kk,ii).^2 + By(kk,ii).^2 + Bz(kk,ii).^2);                
                end



                if kk>=2
                    cla
                    [Z Y] = meshgrid(z,y(1:kk));
                    size(Z)
                    size(Y)
                    size(B(1:kk,:))

                    contour(Z,Y,B(1:kk,:),100)
                    xlabel(ax(1),'Y (mm)','FontSize',16)
                    ylabel(ax(1),'Z (mm)','FontSize',16)
                    drawnow
                end
                if kk==ny
                    movem(s2,3,-Zmax);
                end

            end

            save YZ_2D_Magnetic_field Bx By Bz B z y
        end
        %For ZX
        if L==6
            
            Zmin = str2double(get(eb(3),'string'));
            Zmax = str2double(get(eb(4),'string'));
            Xmin = str2double(get(eb(5),'string'));
            Xmax = str2double(get(eb(6),'string'));
            x = Xmin:increment:Xmax;
            z = Zmin:increment:Zmax;
            z = z + zE;
            nx = length(x);
            nz = length(z);
            Bx = zeros(nz,nx);
            By = zeros(nz,nx);
            Bz = zeros(nz,nx);
            B = zeros(nz,nx);

            for kk =1:nz
                if kk == 1
                    movem(s2,1,Xmin);
                else
                    movem(s2,1,-(Xmax-Xmin));
                end
                for ii = 1:nx
                    if check == 1
                        F = FieldM(Npp,s1);
                        Bz(kk,ii)=F(3);
                        By(kk,ii)=F(2);
                        Bx(kk,ii)=F(1);
                    else
                        F = FieldM(Npp,s1);
                        Bz(kk,ii)=F(3);
                        movem(s2,2,xyE);
                        F = FieldM(Npp,s1);
                        By(kk,ii)=F(2);
                        movem(s2,2,-xyE);
                        movem(s2,1,xyE);
                        F = FieldM(Npp,s1);
                        Bx(kk,ii)=F(1);
                        movem(s2,1,-xyE);
                    end
                    if ii==nx
                        movem(s2,3,-increment);
                    else
                        movem(s2,1,increment);
                    end
                    B(kk,ii) = sqrt(Bx(kk,ii).^2 + By(kk,ii).^2 + Bz(kk,ii).^2);                
                end
                
                if kk>=2
                    cla
                    [X Z] = meshgrid(x,z(1:kk));
                    size(X)
                    size(Z)
                    size(B(1:kk,:))

                    contour(X,Z,B(1:kk,:),100)
                    xlabel(ax(1),'Z (mm)','FontSize',16)
                    ylabel(ax(1),'Y (mm)','FontSize',16)
                    drawnow
                end
                if kk==nz
                    movem(s2,1,-Xmax);
                end
            end
            save ZX_2D_Magnetic_field Bx By Bz B x z
        end
    stop
end













