
clear
close all
clc
load("MC_save_v1.mat")
close all

figure(1)
subplot(2,2,1)    
    C = theta_hat(:,:,2);
    trueparms = Estimates(2,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,0.2,50)],[linspace(0.5,7,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

surf(x1,x2,reshape(A,[size(x1,1)],[]))
colormap(autumn(10))
hold on
plot3(trueparms(1),trueparms(2),10,'*','Color','black','MarkerSize',25)
plot3(median(C(:,1)),median(C(:,2)),10,'o','Color','black','MarkerSize',25)
title('London')
ylabel('\eta_{0}')
xlabel('\lambda')

subplot(2,2,2)    
    C = theta_hat(:,:,1);
    trueparms = Estimates(1,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.02,0.2,50)],[linspace(0.5,6.5,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

surf(x1,x2,reshape(A,[size(x1,1)],[]))
colormap(autumn(10))
hold on
plot3(trueparms(1),trueparms(2),10,'*','Color','black','MarkerSize',25)
plot3(median(C(:,1)),median(C(:,2)),10,'o','Color','black','MarkerSize',25)
title('Glasgow')
ylabel('\eta_{0}')
xlabel('\lambda')

subplot(2,2,3)    
    C = theta_hat(:,:,3);
    trueparms = Estimates(3,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.075,0.45,50)],[linspace(3.5,12,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

surf(x1,x2,reshape(A,[size(x1,1)],[]))
colormap(autumn(10))
hold on
plot3(trueparms(1),trueparms(2),10,'*','Color','black','MarkerSize',25)
plot3(median(C(:,1)),median(C(:,2)),10,'o','Color','black','MarkerSize',25)
title('United States')
ylabel('\eta_{0}')
xlabel('\lambda')

subplot(2,2,4)    
    C = theta_hat(:,:,4);
    trueparms = Estimates(4,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0,0.15,50)],[linspace(0.5,4,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

surf(x1,x2,reshape(A,[size(x1,1)],[]))
colormap(autumn(10))
hold on
ha=plot3(trueparms(1),trueparms(2),10,'*','Color','black','MarkerSize',25)
hb=plot3(median(C(:,1)),median(C(:,2)),10,'o','Color','black','MarkerSize',25)
title('England & Wales 1890')
legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
xlabel('\lambda')
        set (figure(1), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(1);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Monte_Carlo_v1.pdf','BackgroundColor','none')