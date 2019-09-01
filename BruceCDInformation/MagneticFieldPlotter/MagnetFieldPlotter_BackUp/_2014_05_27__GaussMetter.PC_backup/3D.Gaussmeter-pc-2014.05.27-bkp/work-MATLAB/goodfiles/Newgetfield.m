function F = getfield(s1,ch)


done = 0;
m = [0 0 0];
while (~done)

fprintf(s1, ch); 
fprintf(s1, 'RANGE 0'); 
delay;
fprintf(s1, 'FIELD?'); 
field = fscanf(s1);
fprintf(s1, 'FIELDM?');
kx = fscanf(s1);
if (~isempty(kx))
    m(1) = kx(1);
end
f = str2num(field);
   if (length(f)==0)
       done = 0;
   else
     F = f*1000; 
    
   end
% 
% fprintf(s1, 'CHNL Y'); 
% fprintf(s1, 'RANGE 1'); 
% delay;
% fprintf(s1, 'FIELD?');
% field{2} = fscanf(s1);
% fprintf(s1, 'FIELDM?');
% ky = fscanf(s1);
% if (~isempty(ky))
%     m(2) = ky(1);
% end
% 
% fprintf(s1, 'CHNL Z'); 
% fprintf(s1, 'RANGE 0'); 
% delay;
% fprintf(s1, 'FIELD?'); 
% field{3} = fscanf(s1);
% fprintf(s1, 'FIELDM?');
% kz = fscanf(s1);
% if (~isempty(kz))
%     m(3) = kz(1);
% end

done = 1;


% for n = 1:3
%    f = str2num(field{n});
%    if (length(f)==0)
%        done = 0;
%    else
%      F(n) = f*1000; 
%     
%    end
%  
% 
% end
       
    
end



    




