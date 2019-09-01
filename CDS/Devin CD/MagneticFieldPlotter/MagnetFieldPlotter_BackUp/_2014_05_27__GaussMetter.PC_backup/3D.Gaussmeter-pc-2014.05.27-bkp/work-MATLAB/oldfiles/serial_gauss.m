s1 = serial('COM2', 'BaudRate', 1200, 'Terminator', 'CR/LF', 'Parity', 'odd', 'DataBits', 7);
fopen(s1);
%% initialize
fprintf(s1, '*IDN?'); 
id = fscanf(s1);


fclose (s1)