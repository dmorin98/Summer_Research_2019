fs=0;
for cc=1:20
    oneDzc;
    fs=fs+f;
    cc
end
ff=fs/20;
plot (ff)
figure; plot(diff(ff))