s2 = serial('COM1', 'BaudRate', 9600, 'Terminator', 'CR');
fopen(s2);
%% initialize
fprintf(s2, 'F'); 
fprintf(s2, 'N');
fprintf(s2, 'C');

%% check motor type
fprintf(s2,'setM1M6');
fprintf(s2,'getM1M');

display('Motor 1: ');
display(fscanf(s2));  

fprintf(s2,'setM2M4');
fprintf(s2,'getM2M');

display('Motor 2: ');
display(fscanf(s2)); 

fprintf(s2,'setM3M4');
fprintf(s2,'getM3M');

display('Motor 3: ');
display(fscanf(s2)); 