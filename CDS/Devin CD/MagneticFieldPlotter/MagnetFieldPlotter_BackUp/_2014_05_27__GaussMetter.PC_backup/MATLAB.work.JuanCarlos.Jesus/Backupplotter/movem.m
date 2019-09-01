function movem (s2,m,cm)

% value to move is in cm
% for 10P frame, distance is 0.00025"/step

in = cm./2.54;
steps = in/.00025;

if(steps~=0)

fprintf(s2,'C')
fprintf(s2,strcat('I',int2str(m),'M',int2str(round(steps))));
fprintf(s2,'R')

while (~s2.BytesAvailable)
    % do nothing
end
pr = fscanf(s2,'%c',1);

end