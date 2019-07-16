%%% assumes that z is in KG, rest in G

function F = getfield(s1)

done = 0;
%m = [0 0 0];
while (~done)
    clear F;
    
    %%%
    %fprintf(s1, 'CHNL V'); 
    %delay
    fprintf(s1, 'FIELD?'); 
    delayF
    field = fscanf(s1);
    delayF
    fprintf(s1, 'FIELDM?');
    delayF
    m = fscanf(s1);
    %%
    F = str2num(field);
    if (length(F)==0)
        done = 0;
    else
        if (m=='k')
            F = F.*1000;
        elseif (m=='m')
            F = F ./1000;
        end
      done = 1;  
    end
    
    
end



    




