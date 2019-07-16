function home_m(s2,m)

mc = 'XYZ';
ax = mc(m);

% - go to negative limit
fprintf(s2, 'C');
fprintf(s2,strcat('I', int2str(m),'M-0'))
fprintf(s2,'R')
while (~s2.BytesAvailable)
    % do nothing
end
pr = fscanf(s2,'%c',1)

%% find y-position (motor 1)
fprintf(s2,ax);
x0 = str2num(fscanf(s2))

% - go to positive limit
fprintf(s2, 'C');
fprintf(s2,strcat('I', int2str(m), 'M0'))
fprintf(s2,'R')
while (~s2.BytesAvailable)
    % do nothing
end
pr = fscanf(s2,'%c',1)

fprintf(s2,ax);
x1 = str2num(fscanf(s2))

%%% home the motorlimneg(s2,sfd

fprintf(s2,'C')
fprintf(s2,strcat('I',int2str(m),'-M',int2str(round((x1-x0)/2))));
fprintf(s2,'R')

while (~s2.BytesAvailable)
    % do nothing
end
pr = fscanf(s2,'%c',1)