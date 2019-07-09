figure(1)
contour(x,z1,B1,80)
xlabel('X Axis')
ylabel('Y axis')
title('Magnetic field XY Plane B_0')
colorbar



figure(2)

hold on
plot(z1,B1(:,(9:33)))
xlabel('Y axis')
ylabel('Gauss')
title('Magnetic Field B_0')


hold off

