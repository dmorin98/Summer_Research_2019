s2 = serial('COM1', 'BaudRate', 9600);

fopen(s2);

fprintf(s2, 'F');
fprintf(s2, 'N');
fprintf(s2, 'C');
fprintf(s2, 'setM1M4')
fprintf(s2, 'I1M100')
fprintf(s2,'R');
%mim = fscanf(s2, '%s')

fclose(s2);