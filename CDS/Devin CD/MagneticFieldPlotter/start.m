try
    %On MAIN "COM4" and "COM5" default
    tic
    if ~isempty(instrfind)
         fclose(instrfind);
         delete(instrfind);
    end


    s2 = serial('COM3', 'BaudRate', 9600, 'Terminator', 'CR');
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
    
    time = toc;
    if time < 3
        fprintf(s2,'setM2M4');
        fprintf(s2,'getM2M');

        display('Motor 2: ');
        display(fscanf(s2)); 

        fprintf(s2,'setM3M4');
        fprintf(s2,'getM3M');

        display('Motor 3: ');
        display(fscanf(s2)); 


        s1 = serial('COM4', 'BaudRate', 9600, 'Terminator', 'CR/LF', 'Parity', 'odd', 'DataBits', 7);
        fopen(s1);
        %% initialize
        fprintf(s1, '*IDN?'); 
        display(fscanf(s1));
    
    else
        instrfind
        disp('ERROR: Perhaps COM ports are not correct in start.m?')
    end
    
        
    
catch e
    fprintf(1,'Error: Motors cannot be started:\n%s',e.identifier);
end