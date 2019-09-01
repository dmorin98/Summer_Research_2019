


XX = F(13:25:end,:)


load FieldMeas3D_Prueba4

GG = zeros(25,25);
for i=1:25
    X = F(i:25:end,:);
    
    BC = sqrt(sum(XX.^2,2));
    size(BC)
    GG(i,:)=BC';
    if (-1)^i>0
      GG(i,:)=BC(end:-1:1)'
    end
end

contour(GG,100)