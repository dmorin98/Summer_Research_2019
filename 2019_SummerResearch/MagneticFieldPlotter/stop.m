%%Stopping motors
try
    
fprintf(s2,'Q');
fclose(s2);
fclose (s1);

catch e
    fprintf(1, 'Cannot stop: \n%s', e.identifier)
end


