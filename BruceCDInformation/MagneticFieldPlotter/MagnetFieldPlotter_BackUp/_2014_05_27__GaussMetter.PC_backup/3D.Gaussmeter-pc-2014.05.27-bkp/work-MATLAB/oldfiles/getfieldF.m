%%% assumes that z is in KG, rest in G

function F = getfield(s1)

done = 0;
m = [0 0 0];
while (~done)
    clear F;
    fprintf(s1, 'ALLF?'); delayF; a = fscanf(s1);
    ind = find(a==',');
    if (length(ind)==3)
        F{1} = str2num(a(1:(ind(1)-2)));
        F{2} = str2num(a((ind(1)+1):(ind(2)-2)));
        F{3} = 1000.*str2num(a((ind(2)+2):(ind(3)-2)));
        
        if (F{1} & F{2} & F{3})
            done = 1;
        end
        
        F = [F{1} F{2} F{3}]; 
    end
    
end



    




