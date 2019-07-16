function limneg (s2,m)

fprintf(s2,'C')
fprintf(s2,strcat('I',int2str(m),'M-0'));
fprintf(s2,'R')

while (~s2.BytesAvailable)
    % do nothing
end
pr = fscanf(s2,'%c',1)