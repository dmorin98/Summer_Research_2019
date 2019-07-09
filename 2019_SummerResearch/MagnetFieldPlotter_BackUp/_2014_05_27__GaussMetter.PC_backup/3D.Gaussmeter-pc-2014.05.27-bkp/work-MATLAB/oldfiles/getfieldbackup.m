function F = getfield(s1)


done = 0;
m = [0 0 0];
while (~done)

delay
fprintf(s1, 'CHNL X'); 
delay
fprintf(s1, 'FIELD?'); 
delay
field{1} = fscanf(s1);
delay
fprintf(s1, 'FIELDM?');
delay
kx = fscanf(s1);

if (~isempty(kx))
    m(1) = kx(1);
end


fprintf(s1, 'CHNL Y'); 
fprintf(s1, 'RANGE 1'); 
%delay
delay
fprintf(s1, 'FIELD?');
field{2} = fscanf(s1);
fprintf(s1, 'FIELDM?');
ky = fscanf(s1);
%delay


%delay     reacomodar luego de acuerdo con x

%delay

%fff=field{2}
%


% delay
% fprintf(s1, 'FIELD?'); 
% delay
% fie{2} = fscanf(s1);
% %fff1=fie{2}
% delay
%



if (~isempty(ky))
    m(2) = ky(1);
end

delay
fprintf(s1, 'CHNL Z'); 
delay
fprintf(s1, 'FIELD?'); 
delay
field{3} = fscanf(s1);
delay
fprintf(s1, 'FIELDM?');
delay
kz = fscanf(s1);
if (~isempty(kz))
    m(3) = kz(1);
end

done = 1;


for n = 1:3
   f = str2num(field{n});
   if (length(f)==0)
       done = 0;
   else
                        %if (m(n)=='k')
                            %f = f.*1000;
                            %elseif (m(n)=='m')
                            % f = f ./1000;
                            %end


   F(n) = f*1000; 
    
   end
 

end
       
    
end



    




