function delay
try
    
    t0 = clock;
    done = 0;
    while (~done)
        if (etime(clock,t0)>.05)
            done = 1;
        end
    end
        
catch e
    fprintf(1,'Error: Could not delay measurements:\n%s',e.identifier);
end

