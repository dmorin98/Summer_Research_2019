function delay
t0 = clock;
done = 0;
while (~done)
    if (etime(clock,t0)>.05)
        done = 1;
    end
end
