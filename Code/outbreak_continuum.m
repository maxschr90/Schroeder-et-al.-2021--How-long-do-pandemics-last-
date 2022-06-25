    
close all
X =[];
P = linspace(Base_Model(5).dmin,Base_Model(5).dmax-1,100);
[x1,x2] = meshgrid(1920:1956,P);

for n=1:100
X(n,:)= bpareto_outbreakprob(Base_Model(5).alpha',Base_Model(5).dmax,Base_Model(5).dmin,(P(n)));
end
figure(1)
subplot(1,2,1)
surf(x1,x2,X)
view(2)
colormap("jet")
colorbar
title('Glasgow')
ylabel('Outbreak size')

X =[];
P = linspace(Base_Model(7).dmin,Base_Model(7).dmax-1,100);
[x1,x2] = meshgrid(1920:1956,P);

for n=1:100
X(n,:)= bpareto_outbreakprob(Base_Model(7).alpha',Base_Model(7).dmax,Base_Model(7).dmin,(P(n)));
end
subplot(1,2,2)

surf(x1,x2,X)
view(2)
colormap("jet")
colorbar
title('London')
ylabel('Outbreak size')