
% Opitmized for measuring along the z axis. It has included the compensation for the tip.  %
% The tip should be set at the magnet centre before runing this function.                  %
% It is easier to do it using the function motorm.m                                        %
% All the data and the date of the measurement is saved automatically to FieldMeas1D.mat   %
% Updated June 26 2019 by Devin Morin                                                      % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
try
    end_m
    stop_gauss

catch Exception
    disp('All motors and sensors have been initialized.')
end

init_motors
init_gauss

try
    prompt = {'Enter Z Min(cm):','Enter step size(cm):','Enter Z Max(cm):','# of Points to Average'};
    dlgtitle = 'Input for 1D Field Measure';
    dims = [1 35];
    definput = {'3','0.01','9.5','10'};
    answer = inputdlg(prompt,dlgtitle,dims,definput);
catch Exception
    disp('Error in input!')
    end_m
    stop_gauss
end



Z_min = str2double(answer(1,1));                 
TipError=0.18;                  % Distance from tip to probe sensitive area 
                                % (http://www.sal.wisc.edu/whirc/archive/public/datasheets/lakeshore/460_Manual.pdf). 
                                %  See page 5-4
                                
sz = str2double(answer(2,1));   %Step Size
zm = str2double(answer(3,1));   %Z Max value         
Z = -Z_min:sz:Z_min;


Npp = str2double(answer(4,1));  % Number of points for averaging 
movem(s2,3,-50);
movem(s2,3,zm);  

%%%%%Initiatlizing the F matrix (1st row is x, 2nd is y, 3rd is z, 4th is MAG)
FF = zeros(4,(size(Z))+1);


i=0;
distanceCovered = 0;

for k = 1:length(Z)
  tic
    
  FFf=0;
    for a=1:Npp
        F = getfield(s1);
        FFf=F+FFf;
        
        %This will run as fast as the computer can handle
        %It would be wise to put a pause statement, to allow the gaussmeter to get
        %new values
        
        pause(0.01)
        
    end
        FF(1,k) = FFf(1)/Npp;
        FF(2,k) = FFf(2)/Npp;
        FF(3,k) = FFf(3)/Npp;
        FF(4,k) = sqrt(FFf(1)^2+FFf(2)^2+FFf(3)^2)/Npp;
        movem(s2,3,-sz);
        FF(5,k) = distanceCovered+pe;
        
        distanceCovered = distanceCovered + sz;


   %Print the timer. It uses the time to do one loop, and multiplies it by
   %how many iterations are required to finish.
   
   time = toc*(length(Z)-i);
   fprintf('Time remaining:');
   fprintf(' %d ', time);
   fprintf('\n');
   i=i+1;
   
end



end_m
stop_gauss

fx = FF(1,:);
fy =FF(2,:);
fz = FF(3,:);
f = FF(4,:);

%df = diff(FF(4,:));

 
 %Measurement points is a place holder. It should be calculated using the
 %increment size. Ex: If each increment is 1cm, and there's 10 data points,
 %then the total space covered from XMax to XMin is 10cm. 60 Data points
 %does not mean 60 cm. 

 distanceXAxis = FF(5,:);

 figf = subplot(2,1,1);plot(distanceXAxis,f);grid on;title('Plot of F Magnitude');xlabel(figf,'Distance from ZMax (cm)');ylabel(figf,'B (Gauss)');
 %figdf = subplot(3,1,2);plot(distanceXAxis,df);grid on;title('Plot of dF');xlabel(figdf,'Distance from ZMax (cm)');ylabel(figdf,'B (Gauss)');
 figfz = subplot(2,1,2);plot(distanceXAxis,fz);grid on;title('Plot of Fz');xlabel(figfz,'Distance from ZMax (cm)');ylabel(figfz,'B (Gauss)');

 time=clock;
 save FieldMeas1D fx fy fz f Z time