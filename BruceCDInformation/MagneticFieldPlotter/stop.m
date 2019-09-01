%%Stopping motors
try
    
fprintf(s2,'Q');
fclose(s2);
fclose (s1);

catch e
    
    start
    stop
    fprintf(1, 'Motor stopped \n%s', e.identifier)
end


