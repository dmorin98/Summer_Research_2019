function F = FieldM(Npp,s1)
 %% Measuring magnetic field
            ff=0;
            
            delay;
            delay;
            delay;
            delay;
            delay;
            
            for a=1:Npp
                fd = getfield(s1);
                ff=fd+ff;
            end
            
            F=ff/Npp;
