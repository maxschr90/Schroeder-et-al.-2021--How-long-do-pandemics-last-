
clear
close all
clc
load("MC_save_v1.mat")
close all

figure(1)
 i=2;
    C = theta_hat(:,:,i);
    trueparms = Estimates(i,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid(xi,yi);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

surf(x1,x2,reshape(A,[size(x1,1)],[]))
colormap(autumn(10))
hold on
plot3(trueparms(1),trueparms(2),10,'*','Color','black','MarkerSize',25)
plot3(median(C(:,1)),median(C(:,2)),10,'o','Color','black','MarkerSize',25)
% title('London')
% view(2)
ylabel('\eta_{0}')
xlabel('\lambda')
