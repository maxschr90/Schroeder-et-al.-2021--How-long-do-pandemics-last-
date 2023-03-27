%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Main Paper Figures  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

figure(3)
subplot(1,2,1)
    hold on
    for i=1:10
        plot(mean_temp(i,3),mean_temp(i,4),Markertypes{i}, 'Color','black', 'Markersize',6 );
    end

    box off
    ylim([0,450])
    xlim([0,4000])
    ylabel({'Average mortality in first','post-pandemic decade'})
    xlabel({'Average mortality across main waves (1918-19)'})
subplot(1,2,2)
    hold on
    for i=1:10
        plot(average_infant_mort(i),mean_temp(i,4),Markertypes{i}, 'Color','black', 'Markersize',6 );
    end
    legend([citynames,'United States', 'England & Wales'],'Location','southwest','FontSize',6)
    legend boxoff
    box off
    ylim([0,450])
    xlim([90,170])
    xlabel({'Infant Mortality pre-1918 (deaths/1,000 births)'})

h = figure(3);

            %set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 10];
        exportgraphics(h,'../Figures/Figure_3.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/Figure_3.emf','BackgroundColor','none','Resolution', 900)   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

load("MC_output_v1.mat")

figure(4)
pa=subplot(2,3,1)    
    C = theta_hat(:,:,6);
    trueparms = Estimates(6,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,0.275,50)],[linspace(0.5,7,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")
% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'London','1918-19'},'FontSize',8,'FontWeight','bold')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pb=subplot(2,3,2)    
    C = theta_hat(:,:,4);
    trueparms = Estimates(4,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,0.4,50)],[linspace(0.25,12,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")
% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Glasgow','1918-19'},'FontSize',8,'FontWeight','bold')
% ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pc=subplot(2,3,3)    
    C = theta_hat(:,:,5);
    trueparms = Estimates(5,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.,0.6,50)],[linspace(0,17.5,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Liverpool','1918-19'},'FontSize',8,'FontWeight','bold')
% ylabel('\eta_{0}')
% xlabel('\lambda')
box off


pd=subplot(2,3,4)    
    C = theta_hat(:,:,12);
    trueparms = Estimates(12,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0,0.25,50)],[linspace(0.,7.5,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'England & Wales', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
xlabel('\lambda')
box off

pe=subplot(2,3,5)    
    C = theta_hat(:,:,10);
    trueparms = Estimates(10,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0,0.5,50)],[linspace(0.,14,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'England & Wales', '1847-48'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
% ylabel('\eta_{0}')
xlabel('\lambda')
box off


pf=subplot(2,3,6)    
    C = theta_hat(:,:,9);
    trueparms = Estimates(9,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.,0.6,50)],[linspace(0,16,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'United States','1918-19'},'FontSize',8,'FontWeight','bold')
% ylabel('\eta_{0}')
xlabel('\lambda')
box off


AddLetters2Plots({pa, pb, pc, pd, pe, pf},{'a','b','c','d','e','f'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown') 
           
h = figure(4);
            %set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 10];
        exportgraphics(h,'../Figures/Figure_4.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/Figure_4.emf','BackgroundColor','none','Resolution', 900)   



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4)
pa=subplot(2,3,1)
InvCdf = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(6).alpha',Base_Model(6).dmax,Base_Model(6).dmin);
[ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(1,:), InvCdf(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(2,:), InvCdf(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf(3,:),'Color','black')
hf = plot((Influenza_Cities(26:end,7)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3 )
xlim([0,37])
ylim([0,max(InvCdf(5,:)*1.05)])
xticks([1 11 21 31])
xticklabels({'1920', '1930','1940','1950'})
yticks([0,(round(max(Influenza_Cities(26:end,7)),0)),round(max(InvCdf(5,:)))])
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'London','1918-19'},'FontSize',8,'FontWeight','bold')
box off

pb=subplot(2,3,2)
InvCdf = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(4).alpha',Base_Model(4).dmax,Base_Model(4).dmin);
[ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(1,:), InvCdf(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(2,:), InvCdf(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf(3,:),'Color','black')
hf = plot((Influenza_Cities(26:end,5)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3 )
xlim([0,37])
ylim([0,max(InvCdf(5,:)*1.05)])
xticks([1 11 21 31])
xticklabels({'1920', '1930','1940','1950'})
yticks([0,(round(max(Influenza_Cities(26:end,5)),0)),round(max(InvCdf(5,:)))])
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'Glasgow','1918-19'},'FontSize',8,'FontWeight','bold')
box off

pc=subplot(2,3,3)
InvCdf = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(5).alpha',Base_Model(5).dmax,Base_Model(5).dmin);
[ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(1,:), InvCdf(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(2,:), InvCdf(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf(3,:),'Color','black')
hf = plot((Influenza_Cities(26:end,6)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3 )
xlim([0,37])
ylim([0,max(InvCdf(5,:)*1.05)])
xticks([1 11 21 31])
xticklabels({'1920', '1930','1940','1950'})
yticks([0,(round(max(Influenza_Cities(26:end,6)),0)),round(max(InvCdf(5,:)))])
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'Liverpool','1918-19'},'FontSize',8,'FontWeight','bold')
box off


pd=subplot(2,3,4)
InvCdf_EW_1918(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin);
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1918,2), InvCdf_EW_1918(1,:), InvCdf_EW_1918(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1918,2), InvCdf_EW_1918(2,:), InvCdf_EW_1918(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf_EW_1918(3,:),'Color','black')

hf = plot((Influenza_EW(83:119,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3)
xlim([0,37])
xticks([1 11 21 31])
xticklabels({'1920', '1930','1940','1950'})
ylim([0,max(max(InvCdf_EW_1918(5,:)),max(Influenza_EW(83:end,2)))*1.05])

yticks(sort([0,round(max(InvCdf_EW_1918(5,:))),round(max(Influenza_EW(83:end,2)),0)]))
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'England & Wales', '1918-19'},'FontSize',8,'FontWeight','bold')
box off

pe=subplot(2,3,5)
InvCdf_EW_1848(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(10).alpha',Base_Model(10).dmax,Base_Model(10).dmin);
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1848,2), InvCdf_EW_1848(1,:), InvCdf_EW_1848(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1848,2), InvCdf_EW_1848(2,:), InvCdf_EW_1848(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf_EW_1848(3,:),'Color','black')

hf = plot((Influenza_EW(12:52,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize',3)
xlim([0,42])
xticks([2 12 22 32 42])
xticklabels({'1850', '1860','1870','1880','1890'})

ylim([0,max(max(InvCdf_EW_1848(5,:)),max(Influenza_EW(12:52,2)))*1.05])
yticks([0,round(max(Influenza_EW(12:52,2)),0),round(max(InvCdf_EW_1848(5,:)))])
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'England & Wales', '1847-48'},'FontSize',8,'FontWeight','bold')
box off


pf=subplot(2,3,6)

InvCdf_US(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(9).alpha',Base_Model(9).dmax,Base_Model(9).dmin);
[ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(1,:), InvCdf_US(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(2,:), InvCdf_US(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf_US(3,:),'Color','black')

hf = plot((Influenza_US(21:end,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize',3)
xlim([0,37])
xticks([1 11 21 31])
xticklabels({'1920', '1930','1940','1950'})
ylim([0,max(InvCdf_US(5,:)*1.05)])
yticks([0,round(max(Influenza_US(21:end,2)),0),round(max(InvCdf_US(5,:)))])
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'United States','1918-19'},'FontSize',8,'FontWeight','bold')
box off

AddLetters2Plots({pa, pb, pc, pd, pe, pf},{'a','b','c','d','e','f'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown')

h = figure(4);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 12];
exportgraphics(h,'../Figures/Figure_4.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_4.emf','BackgroundColor','none','Resolution', 900)
        



