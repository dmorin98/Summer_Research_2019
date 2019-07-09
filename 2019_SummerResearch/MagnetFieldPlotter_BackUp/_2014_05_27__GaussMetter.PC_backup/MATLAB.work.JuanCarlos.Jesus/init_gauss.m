s1 = serial('COM2', 'BaudRate', 9600, 'Terminator', 'CR/LF', 'Parity', 'odd', 'DataBits', 7);
fopen(s1);
%% initialize
fprintf(s1, '*IDN?'); 
display(fscanf(s1));
