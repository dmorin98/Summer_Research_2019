s2 = serial('COM1', 'BaudRate', 9600, 'Terminator', 'CR');
fopen(s2);
%% initialize
fprintf(s2, 'F'); 
fprintf(s2, 'N');
fprintf(s2, 'C');

%% check motor type
fprintf(s2,'getM1M');

display('Motor 1: ');
display(fscanf(s2));    

fprintf(s2,'getM2M');

display('Motor 2: ');
display(fscanf(s2));

display('Proceed ?');
%pause

%%% home motor 2:

% - go to negative limit
fprintf(s2, 'C');
fprintf(s2,'I2M-0')
fprintf(s2,'R')
while (~s2.BytesAvailable)
    % do nothing
end
pr = fscanf(s2,'%c',1)

%% find y-position (motor 2)
fprintf(s2,'Y');
y0 = str2num(fscanf(s2))

% - go to positive limit
fprintf(s2, 'C');
fprintf(s2,'I2M0')
fprintf(s2,'R')
while (~s2.BytesAvailable)
    % do nothing
end
pr = fscanf(s2,'%c',1)

fprintf(s2,'Y');
y1 = str2num(fscanf(s2))

%%% home the motor

fprintf(s2,'C')
fprintf(s2,strcat('I2-M',int2str(round((y1-y0)/2))));
fprintf(s2,'R')

while (~s2.BytesAvailable)
    % do nothing
end
pr = fscanf(s2,'%c',1)

%%%%%%%%% do the same thing for the other axes

%%% home motor 1:

% - go to negative limit
fprintf(s2, 'C');
fprintf(s2,'I1M-0')
fprintf(s2,'R')
while (~s2.BytesAvailable)
    % do nothing
end
pr = fscanf(s2,'%c',1)

%% find y-position (motor 1)
fprintf(s2,'X');
x0 = str2num(fscanf(s2))

% - go to positive limit
fprintf(s2, 'C');
fprintf(s2,'I1M0')
fprintf(s2,'R')
while (~s2.BytesAvailable)
    % do nothing
end
pr = fscanf(s2,'%c',1)

fprintf(s2,'X');
x1 = str2num(fscanf(s2))

%%% home the motor

fprintf(s2,'C')
fprintf(s2,strcat('I1-M',int2str(round((x1-x0)/2))));
fprintf(s2,'R')

while (~s2.BytesAvailable)
    % do nothing
end
pr = fscanf(s2,'%c',1)

%%% home motor 1:

% - go to negative limit
fprintf(s2, 'C');
fprintf(s2,'I3M-0')
fprintf(s2,'R')
while (~s2.BytesAvailable)
    % do nothing
end
pr = fscanf(s2,'%c',1)

%% find y-position (motor 1)
fprintf(s2,'Z');
x0 = str2num(fscanf(s2))

% - go to positive limit
fprintf(s2, 'C');
fprintf(s2,'I3M0')
fprintf(s2,'R')
while (~s2.BytesAvailable)
    % do nothing
end
pr = fscanf(s2,'%c',1)

fprintf(s2,'Z');
x1 = str2num(fscanf(s2))

%%% home the motor

fprintf(s2,'C')
fprintf(s2,strcat('I3-M',int2str(round((x1-x0)/2))));
fprintf(s2,'R')

while (~s2.BytesAvailable)
    % do nothing
end
pr = fscanf(s2,'%c',1)


%%% go offline and end
fprintf(s2,'Q')
fclose(s2)


