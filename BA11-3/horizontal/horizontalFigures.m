figure(1)
contour(yHorizontal,xHorizontal,B1,100)
title('B_0 Fieldof BA11-3 at Z=0')
xlabel('X Axis (cm)')
ylabel('Y Axis (cm)')
colorbar


figure(2)

plot(xHorizontal,B1(:,(:31)))

hold on
plot(z,B)




hold off
