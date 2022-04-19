
clear
close all
clc
load("MC_save_v2.mat")
close all

figure(2)
subplot(2,2,1)    
    C = theta_hat(:,:,6);
    trueparms = Estimates(6,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,0.2,50)],[linspace(0.5,7,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap(autumn(10))
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',5)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',5)
title('London')
ylabel('\eta_{0}')
xlabel('\lambda')

subplot(2,2,2)    
    C = theta_hat(:,:,4);
    trueparms = Estimates(4,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,0.4,50)],[linspace(0.25,12,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap(autumn(10))
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',5)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',5)
title('Glasgow')
ylabel('\eta_{0}')
xlabel('\lambda')

subplot(2,2,3)    
    C = theta_hat(:,:,9);
    trueparms = Estimates(9,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.,0.6,50)],[linspace(0,16,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap(autumn(10))
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',5)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',5)
title('United States')
ylabel('\eta_{0}')
xlabel('\lambda')

subplot(2,2,4)    
    C = theta_hat(:,:,10);
    trueparms = Estimates(10,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0,0.5,50)],[linspace(0.,14,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap(autumn(10))
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',5)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',5)
title('England & Wales 1847-48')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
xlabel('\lambda')
            
h = figure(2);
            %set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 25];
        exportgraphics(h,'../Figures/Figure_2.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/Figure_2.emf','BackgroundColor','none','Resolution', 900)   