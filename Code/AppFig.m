%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Appendix  Figures  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
close all
load('Fitted_Models_v1')
load("MC_output_v1.mat")


Linemarkertypes = {'-p','-x','-h','-s','-d','-*','-v','-^','-+','-o'};
Markertypes = {'p','x','h','s','d','*','v','^','+','o','>'};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 1 A  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Pneumonia_UK = table2array(Pneumonia);
figure(1)
    for b = 1:8
        subplot(4,2,b)
        plot(years,Pneumonia_UK(:,b),'.-',  'Linewidth', 0.5, 'Color','red', 'Markersize', 6 ,'MarkerEdgeColor','red')
        ylim([0,max(Pneumonia_UK(:,b))*1.05])
        yticks([0,1000,round(max(Pneumonia_UK(:,b)),0)])
        xlim([1895,1950])
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title(citynames(b),'FontSize',8,'FontWeight','bold');
        box off
    end
        AddLetters2Plots(figure(1), {'a', 'c', 'e', 'g' 'b', 'd', 'f', 'h'},'HShift', -0.07, 'VShift', -0.075, 'Direction', 'TopDown','fontsize',8) 

                    h = figure(1);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 14 15];
        exportgraphics(h,'../Figures/SI_Figure_A-1.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_A-1.emf','BackgroundColor','none','Resolution', 900)        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 2 A  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Bronchitis_UK = table2array(Bronchitis);
figure(2)
    for b = 1:8
        subplot(4,2,b)
        plot(years,Bronchitis_UK(:,b),'.-',  'Linewidth', 0.5, 'Color','red', 'Markersize', 6 ,'MarkerEdgeColor','red')
        ylim([0,max(Bronchitis_UK(:,b))*1.05])
        yticks([0,1000,round(max(Bronchitis_UK(:,b)),0)])
        xlim([1895,1950])
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title(citynames(b),'FontSize',8,'FontWeight','bold');
        box off
    end
        AddLetters2Plots(figure(2), {'a', 'c', 'e', 'g' 'b', 'd', 'f', 'h'}, 'HShift', -0.07, 'VShift', -0.075, 'Direction', 'TopDown','fontsize',8) 

            h = figure(2);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 14 15];
        exportgraphics(h,'../Figures/SI_Figure_A-2.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_A-2.emf','BackgroundColor','none','Resolution', 900)        


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 1 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
figure(3)
pa=subplot(5,2,1)    
    C = theta_hat(:,:,1);
    trueparms = Estimates(1,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")
% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Belfast','1918-19'},'FontSize',8,'FontWeight','bold')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pb=subplot(5,2,2)    
    C = theta_hat(:,:,2);
    trueparms = Estimates(2,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")
% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Birmingham','1918-19'},'FontSize',8,'FontWeight','bold')
% ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pc=subplot(5,2,3)    
    C = theta_hat(:,:,3);
    trueparms = Estimates(3,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Cardiff','1918-19'},'FontSize',8,'FontWeight','bold')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pd=subplot(5,2,4)    
    C = theta_hat(:,:,4);
    trueparms = Estimates(4,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
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

pe=subplot(5,2,5)    
    C = theta_hat(:,:,5);
    trueparms = Estimates(5,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Liverpool', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pf=subplot(5,2,6)    
    C = theta_hat(:,:,6);
    trueparms = Estimates(6,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'London', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
% ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pg=subplot(5,2,7)    
    C = theta_hat(:,:,7);
    trueparms = Estimates(7,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Manchester', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pj=subplot(5,2,8);    
    C = theta_hat(:,:,8);
    trueparms = Estimates(8,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Sheffield', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
% xlabel('\lambda')
box off

pk=subplot(5,2,9);    

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

pl=subplot(5,2,10);    
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

AddLetters2Plots({pa, pb, pc, pd, pe, pf, pg, pj, pk, pl},{'a','b','c','d','e','f','g','h','i','j'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown') 
           
h = figure(3);
            %set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 25];
        exportgraphics(h,'../Figures/SI_Figure_B-1.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-1.emf','BackgroundColor','none','Resolution', 900)    
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 2 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(4)
pa=subplot(3,1,1)    
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
% xlabel('\lambda')
box off

pb=subplot(3,1,2)    
    C = theta_hat(:,:,11);
    trueparms = Estimates(11,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0,0.2,50)],[linspace(0.,37,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'England & Wales', '1889-90'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
% ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pc=subplot(3,1,3)    
    C = theta_hat(:,:,14);
    trueparms = Estimates(14,1:2);
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
title({'England & Wales', '1968'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
% ylabel('\eta_{0}')
xlabel('\lambda')
box off
AddLetters2Plots({pa, pb, pc },{'a','b','c' }, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown') 
           
h = figure(4);
            %set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 25];
        exportgraphics(h,'../Figures/SI_Figure_B-2.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-2.emf','BackgroundColor','none','Resolution', 900)    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 3 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for b = 1:8
    InvCdf(:,:,b) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b).alpha',Base_Model(b).dmax,Base_Model(b).dmin);
end
    InvCdf_US(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b+1).alpha',Base_Model(b+1).dmax,Base_Model(b+1).dmin);
    InvCdf_EW_1918(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin);
    
figure(5)
        for b = 1:8
            subplot(5,2,b)
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(1,:,b), InvCdf(5,:,b), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(2,:,b), InvCdf(4,:,b), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            plot(InvCdf(3,:,b),'Color','black')
            hf = plot((Influenza_Cities(26:end,b+1)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3 )
            xlim([0,37])
            ylim([0,max(InvCdf(5,:,b)*1.05)])
            xticks([1 6 11 16 21 26 31 36])
            xtickangle(0)
            xticklabels([]) 
            yticks([0,sort(round(max(Influenza_Cities(26:end,b+1)),0)),round(max(InvCdf(5,:,b)))])
            title({citynames{b},'1918-19'},'FontSize',8,'FontWeight','bold')
            box off
        end
            subplot(5,2,9)
            [ha,~,~] = shadedplot(1:size(InvCdf_EW_1918,2), InvCdf_EW_1918(1,:), InvCdf_EW_1918(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_EW_1918,2), InvCdf_EW_1918(2,:), InvCdf_EW_1918(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            plot(InvCdf_EW_1918(3,:),'Color','black')

            hf = plot((Influenza_EW(83:119,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3)
            xlim([0,37])
            xticks([1 6 11 16 21 26 31 36])
            xtickangle(0)
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            ylim([0,max(max(InvCdf_EW_1918(5,:)),max(Influenza_EW(83:end,2)))*1.05])

            yticks(sort([0,round(max(InvCdf_EW_1918(5,:))),round(max(Influenza_EW(83:end,2)),0)]))
            ax = gca;
            c = ax.FontSize;
            ax.FontSize =8;
            ax.XTickLabelRotation = 0;
            title({'England & Wales', '1918-19'},'FontSize',8,'FontWeight','bold')
            box off     

            subplot(5,2,10)

            InvCdf_US(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(9).alpha',Base_Model(9).dmax,Base_Model(9).dmin);
            [ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(1,:), InvCdf_US(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(2,:), InvCdf_US(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            plot(InvCdf_US(3,:),'Color','black')

            hf = plot((Influenza_US(21:end,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize',3)
            xlim([0,37])
            xticks([1 6 11 16 21 26 31 36])
            xtickangle(0)
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            ylim([0,max(InvCdf_US(5,:)*1.05)])
            yticks([0,round(max(Influenza_US(21:end,2)),0),round(max(InvCdf_US(5,:)))])
            ax = gca;
            c = ax.FontSize;
            ax.FontSize =8;
            ax.XTickLabelRotation = 0;
            title({'United States','1918-19'},'FontSize',8,'FontWeight','bold')
            box off
        
            AddLetters2Plots(figure(5), {'a', 'b', 'c', 'd', 'e',  'f', 'g', 'h','i','j'}, 'HShift', -0.07, 'VShift', -0.07, 'Direction', 'TopDown','fontsize',8) 
        
            h = figure(5);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 25];
        exportgraphics(h,'../Figures/SI_Figure_B-3.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-3.emf','BackgroundColor','none','Resolution', 900)   

        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 4 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



figure(6)

subplot(3,1,1)
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

subplot(3,1,2)
InvCdf_EW_1890(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin);
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1890,2), InvCdf_EW_1890(1,:), InvCdf_EW_1890(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1890,2), InvCdf_EW_1890(2,:), InvCdf_EW_1890(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
hold on
plot(InvCdf_EW_1890(3,:),'Color','black')
 
hf = plot((Influenza_EW(56:80,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize',3)
xlim([0,26])
xticks([1 6 11 16 21 26])
xticklabels({'1893', '1898','1903','1908','1913','1918'}) 
      
ylim([0,max(max(InvCdf_EW_1890(5,:)),max(Influenza_EW(56:80,2)))*1.05])
yticks([0,sort(round(max(Influenza_EW(56:80,2)),0),round(max(InvCdf_EW_1890(5,:))))])
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'England & Wales', '1889-90'},'FontSize',8,'FontWeight','bold')
box off

subplot(3,1,3)
InvCdf_EW_1968(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(14).alpha',Base_Model(14).dmax,Base_Model(14).dmin);
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1968,2), InvCdf_EW_1968(1,:), InvCdf_EW_1968(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1968,2), InvCdf_EW_1968(2,:), InvCdf_EW_1968(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
hold on
plot(InvCdf_EW_1968(3,:),'Color','black')
 
hf = plot((Influenza_EW(134:end,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize',3)
xlim([0,31])
xticks([1 6 11 16 21 26, 31])
xticklabels({'1971', '1976','1981','1986','1991','1996'}) 
      
ylim([0,max(max(InvCdf_EW_1968(5,:)),max(Influenza_EW(133:end,2)))*1.05])
yticks([0,sort(round(max(Influenza_EW(134:end,2)),0),round(max(InvCdf_EW_1968(5,:))))])
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'England & Wales', '1968'},'FontSize',8,'FontWeight','bold')
box off
        AddLetters2Plots(figure(6), {'a', 'b', 'c', 'd', 'e',  'f', 'g', 'h','i','j'}, 'HShift', -0.07, 'VShift', -0.07, 'Direction', 'TopDown','fontsize',8) 
        
        h = figure(6);
        h.Units='centimeters';
        h.OuterPosition=[0 0 19 25];
        exportgraphics(h,'../Figures/SI_Figure_B-4.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-4.emf','BackgroundColor','none','Resolution', 900)    
        
        
        
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 5 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
              
figure(7)
        pa = subplot(1,2,1)
        for n=1:8
            hold on
            plot(years(26:end), bpareto_outbreakprob(Common_Bounds_Model(n).alpha',Common_Bounds_Model(n).dmax,Common_Bounds_Model(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
        ylabel(sprintf('Prob(>500 deaths/million)'),'fontsize',8) 

        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.4])
        ylim([0,0.45])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 

        pb = subplot(1,2,2)
        p = get(pb, 'position');
        p(1) = p(1) + 0.03;
        p(3) = p(3) - 0.03;
        set(pb, 'position', p);        
        for n=1:8
            hold on
            plot(years(26:end), bpareto_outbreakprob(Common_Bounds_Model(n).alpha',Common_Bounds_Model(n).dmax,Common_Bounds_Model(n).dmin,1000), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
        ylabel(sprintf('Prob(>1,000 deaths/million)'),'fontsize',8) 
         a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.4])
        ylim([0,0.45])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'},'FontSize',8, 'Location','best', 'NumColumns',1);
%         leg.ItemTokenSize = [3,1.5];
        legend boxoff

        AddLetters2Plots({pa, pb},{'a','b'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown') 

            
            h = figure(7);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 10];
        exportgraphics(h,'../Figures/SI_Figure_B-5.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-5.emf','BackgroundColor','none','Resolution', 900)           
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 6 B %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(8)
        pa = subplot(2,2,1)
        for n=1:8
            hold on
            plot(years(26:end), bpareto_outbreakprob(Theoretical_Bounds_Model(n).alpha',Theoretical_Bounds_Model(n).dmax,Theoretical_Bounds_Model(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        ylabel(sprintf('Prob(>500 deaths/million)'),'fontsize',8) 
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'},'FontSize',6, 'Location','best', 'NumColumns',1);
%         leg.ItemTokenSize = [3,1.5];
        legend boxoff
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.6])
        ylim([0,0.5])
%         yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 

        pb = subplot(2,2,2)
%         p = get(pb, 'position');
%         p(1) = p(1) + 0.03;
%         p(3) = p(3) - 0.03;
%         set(pb, 'position', p);        
        for n=1:8
            hold on
            plot(years(26:end), bpareto_outbreakprob(Theoretical_Bounds_Model(n).alpha',Theoretical_Bounds_Model(n).dmax,Theoretical_Bounds_Model(n).dmin,1000), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        ylabel(sprintf('Prob(>1,000 deaths/million)'),'fontsize',8) 
         a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.45])
        ylim([0,0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45'})

        pc = subplot(2,2,3)
        plot(Influenza_EW(83:119,1),bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,500), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_EW(83:119,1),bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,1000), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('500 deaths/million', '1000 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
        legend boxoff
        title(leg,'England & Wales (1918-19)','FontSize',8);
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.5])
        ylim([0,0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

        pd = subplot(2,2,4)
        plot(Influenza_US(21:end,1),bpareto_outbreakprob(Theoretical_Bounds_Model(9).alpha',Theoretical_Bounds_Model(9).dmax,Theoretical_Bounds_Model(9).dmin,500), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_US(21:end,1),bpareto_outbreakprob(Theoretical_Bounds_Model(9).alpha',Theoretical_Bounds_Model(9).dmax,Theoretical_Bounds_Model(9).dmin,1000), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('500 deaths/million', '1000 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
        legend boxoff
        title(leg,'US (1918-19)','FontSize',8);
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.5])
        ylim([0,0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.06, 'VShift', -0.03, 'Direction', 'TopDown') 

            
            h = figure(8);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 20];
        exportgraphics(h,'../Figures/SI_Figure_B-6.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-6.emf','BackgroundColor','none','Resolution', 900)            
        
        
        
   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 7 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure(9)
       pa = subplot(2,2,1)
        plot(Influenza_EW(12:52,1), bpareto_outbreakprob(Theoretical_Bounds_Model(10).alpha',Theoretical_Bounds_Model(10).dmax,Theoretical_Bounds_Model(10).dmin,Base_Model(10).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(12:52,1), bpareto_outbreakprob(Theoretical_Bounds_Model(10).alpha',Theoretical_Bounds_Model(10).dmax,Theoretical_Bounds_Model(10).dmin,Base_Model(10).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(12:52,1), bpareto_outbreakprob(Theoretical_Bounds_Model(10).alpha',Theoretical_Bounds_Model(10).dmax,Theoretical_Bounds_Model(10).dmin,Base_Model(10).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        legend('2/3 of peak','1/2 of peak','1/3 of peak')
        legend boxoff
        xlim([1848,1890])
        xticks([1850:5:1890])
        xtickangle(0)
        yticks([0:0.05:0.45])
        ylim([0,0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title('England & Wales 1848')
        box off

        pb = subplot(2,2,2)
        
        plot(Influenza_EW(56:80,1), bpareto_outbreakprob(Theoretical_Bounds_Model(11).alpha',Theoretical_Bounds_Model(11).dmax,Theoretical_Bounds_Model(11).dmin,Base_Model(11).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(56:80,1), bpareto_outbreakprob(Theoretical_Bounds_Model(11).alpha',Theoretical_Bounds_Model(11).dmax,Theoretical_Bounds_Model(11).dmin,Base_Model(11).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(56:80,1), bpareto_outbreakprob(Theoretical_Bounds_Model(11).alpha',Theoretical_Bounds_Model(11).dmax,Theoretical_Bounds_Model(11).dmin,Base_Model(11).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

        xlim([1892,1918])
        xticks([1890:5:1915])
        xtickangle(0)
        yticks([0:0.1:0.5])
        ylim([0,0.5])
        yticklabels({'0','0.1',  '0.2', '0.3','0.4','0.5','0.6','0.7'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title('England & Wales 1889-90')
        box off

        pc = subplot(2,2,3)

        plot(Influenza_EW(83:119,1), bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,Base_Model(12).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(83:119,1), bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,Base_Model(12).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(83:119,1), bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,Base_Model(12).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

        xlim([1919,1957])
        xticks([1920:5:1955])
        xtickangle(0)
        yticks([0:0.05:0.45])
        ylim([0,0.45])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title('England & Wales 1918-19')
        box off

        pd = subplot(2,2,4)
        plot(Influenza_EW(134:end,1), bpareto_outbreakprob(Theoretical_Bounds_Model(14).alpha',Theoretical_Bounds_Model(14).dmax,Theoretical_Bounds_Model(14).dmin,Base_Model(14).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(134:end,1), bpareto_outbreakprob(Theoretical_Bounds_Model(14).alpha',Theoretical_Bounds_Model(14).dmax,Theoretical_Bounds_Model(14).dmin,Base_Model(14).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(134:end,1), bpareto_outbreakprob(Theoretical_Bounds_Model(14).alpha',Theoretical_Bounds_Model(14).dmax,Theoretical_Bounds_Model(14).dmin,Base_Model(14).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

        xlim([1970,2001])
        xticks([1970:5:2000])
        xtickangle(0)
        yticks([0:0.05:0.45])
        ylim([0,0.45])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title('England & Wales 1968')
        box off

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.07, 'VShift', -0.045, 'Direction', 'TopDown') 
            
            h = figure(9);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 20];
        exportgraphics(h,'../Figures/SI_Figure_B-7.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-7.emf','BackgroundColor','none','Resolution', 900)            
        
        
        
        
        
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 8 B %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
figure(10)
        pa = subplot(2,2,1)
        for n=1:8
            hold on
            plot(years(24:end), bpareto_outbreakprob(Estimated_Bounds_Model(n).alpha',Estimated_Bounds_Model(n).dmax,Estimated_Bounds_Model(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        ylabel(sprintf('Prob(>500 deaths/million)'),'fontsize',8) 
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'},'FontSize',6, 'Location','best', 'NumColumns',1);
%         leg.ItemTokenSize = [3,1.5];
        legend boxoff
        xlim([1917,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.45])
        ylim([0,0.5])
%         yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 

        pb = subplot(2,2,2)
%         p = get(pb, 'position');
%         p(1) = p(1) + 0.03;
%         p(3) = p(3) - 0.03;
%         set(pb, 'position', p);        
        for n=1:8
            hold on
            plot(years(24:end), bpareto_outbreakprob(Estimated_Bounds_Model(n).alpha',Estimated_Bounds_Model(n).dmax,Estimated_Bounds_Model(n).dmin,1000), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        ylabel(sprintf('Prob(>1,000 deaths/million)'),'fontsize',8) 
         a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1917,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.45])
        ylim([0,0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45'})

        pc = subplot(2,2,3)
        plot(Influenza_EW(81:119,1),bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,500), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_EW(81:119,1),bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,1000), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('500 deaths/million', '1000 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
        legend boxoff
        title(leg,'England & Wales (1918-19)','FontSize',8);
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1917,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.45])
        ylim([0,0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

        pd = subplot(2,2,4)
        plot(Influenza_US(19:end,1),bpareto_outbreakprob(Estimated_Bounds_Model(9).alpha',Estimated_Bounds_Model(9).dmax,Estimated_Bounds_Model(9).dmin,500), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_US(19:end,1),bpareto_outbreakprob(Estimated_Bounds_Model(9).alpha',Estimated_Bounds_Model(9).dmax,Estimated_Bounds_Model(9).dmin,1000), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('500 deaths/million', '1000 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
        legend boxoff
        title(leg,'US (1918-19)','FontSize',8);
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1917,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.45])
        ylim([0,0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.06, 'VShift', -0.03, 'Direction', 'TopDown') 

            
            h = figure(10);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 20];
        exportgraphics(h,'../Figures/SI_Figure_B-8.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-8.emf','BackgroundColor','none','Resolution', 900)              
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 9 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure(11)
       pa = subplot(2,2,1)
        plot(Influenza_EW(11:52,1), bpareto_outbreakprob(Estimated_Bounds_Model(10).alpha',Estimated_Bounds_Model(10).dmax,Estimated_Bounds_Model(10).dmin,Base_Model(10).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(11:52,1), bpareto_outbreakprob(Estimated_Bounds_Model(10).alpha',Estimated_Bounds_Model(10).dmax,Estimated_Bounds_Model(10).dmin,Base_Model(10).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(11:52,1), bpareto_outbreakprob(Estimated_Bounds_Model(10).alpha',Estimated_Bounds_Model(10).dmax,Estimated_Bounds_Model(10).dmin,Base_Model(10).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        legend('2/3 of peak','1/2 of peak','1/3 of peak')
        legend boxoff
        xlim([1847,1890])
        xticks([1850:5:1890])
        xtickangle(0)
        yticks([0:0.05:0.45])
        ylim([0,0.25])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title('England & Wales 1848')
        box off

        pb = subplot(2,2,2)
        
        plot(Influenza_EW(53:80,1), bpareto_outbreakprob(Estimated_Bounds_Model(11).alpha',Estimated_Bounds_Model(11).dmax,Estimated_Bounds_Model(11).dmin,Base_Model(11).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(53:80,1), bpareto_outbreakprob(Estimated_Bounds_Model(11).alpha',Estimated_Bounds_Model(11).dmax,Estimated_Bounds_Model(11).dmin,Base_Model(11).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(53:80,1), bpareto_outbreakprob(Estimated_Bounds_Model(11).alpha',Estimated_Bounds_Model(11).dmax,Estimated_Bounds_Model(11).dmin,Base_Model(11).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

        xlim([1889,1918])
        xticks([1890:5:1915])
        xtickangle(0)
        yticks([0:0.1:0.7])
        ylim([0,0.7])
        yticklabels({'0','0.1',  '0.2', '0.3','0.4','0.5','0.6','0.7'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title('England & Wales 1889-90')
        box off

        pc = subplot(2,2,3)

        plot(Influenza_EW(81:119,1), bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,Base_Model(12).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(81:119,1), bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,Base_Model(12).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(81:119,1), bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,Base_Model(12).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

        xlim([1917,1957])
        xticks([1920:5:1955])
        xtickangle(0)
        yticks([0:0.05:0.45])
        ylim([0,0.25])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title('England & Wales 1918-19')
        box off

        pd = subplot(2,2,4)
        plot(Influenza_EW(131:end,1), bpareto_outbreakprob(Estimated_Bounds_Model(14).alpha',Estimated_Bounds_Model(14).dmax,Estimated_Bounds_Model(14).dmin,Base_Model(14).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(131:end,1), bpareto_outbreakprob(Estimated_Bounds_Model(14).alpha',Estimated_Bounds_Model(14).dmax,Estimated_Bounds_Model(14).dmin,Base_Model(14).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(131:end,1), bpareto_outbreakprob(Estimated_Bounds_Model(14).alpha',Estimated_Bounds_Model(14).dmax,Estimated_Bounds_Model(14).dmin,Base_Model(14).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

        xlim([1967,2001])
        xticks([1970:5:2000])
        xtickangle(0)
        yticks([0:0.05:0.25])
        ylim([0,0.25])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title('England & Wales 1968')
        box off

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.07, 'VShift', -0.045, 'Direction', 'TopDown') 
            
            h = figure(11);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 20];
        exportgraphics(h,'../Figures/SI_Figure_B-9.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-9.emf','BackgroundColor','none','Resolution', 900)      
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 10 B %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
figure(12)
        pa = subplot(2,2,1)
        for n=1:8
            hold on
            plot(years(26:end), weibull_outbreakprob(Weibull_Model(n).w',50), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        ylabel(sprintf('Prob(>500 deaths/million)'),'fontsize',8) 
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'},'FontSize',6, 'Location','best', 'NumColumns',1);
%         leg.ItemTokenSize = [3,1.5];
        legend boxoff
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.7])
        ylim([0,0.7])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 

        pb = subplot(2,2,2)
%         p = get(pb, 'position');
%         p(1) = p(1) + 0.03;
%         p(3) = p(3) - 0.03;
%         set(pb, 'position', p);        
        for n=1:8
            hold on
            plot(years(26:end), weibull_outbreakprob(Weibull_Model(n).w',100), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        ylabel(sprintf('Prob(>1,000 deaths/million)'),'fontsize',8) 
         a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.7])
        ylim([0,0.7])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})

        pc = subplot(2,2,3)
        plot(Influenza_EW(83:119,1),weibull_outbreakprob(Weibull_Model(12).w',50), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_EW(83:119,1),weibull_outbreakprob(Weibull_Model(12).w',100), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('500 deaths/million', '1000 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
        legend boxoff
        title(leg,'England & Wales (1918-19)','FontSize',8);
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.7])
        ylim([0,0.7])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})

        pd = subplot(2,2,4)
        plot(Influenza_US(21:end,1),weibull_outbreakprob(Weibull_Model(9).w',50), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_US(21:end,1),weibull_outbreakprob(Weibull_Model(9).w',100), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('500 deaths/million', '1000 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
        legend boxoff
        title(leg,'US (1918-19)','FontSize',8);
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.7])
        ylim([0,0.7])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.06, 'VShift', -0.03, 'Direction', 'TopDown') 

            
            h = figure(12);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 20];
        exportgraphics(h,'../Figures/SI_Figure_B-10.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-10.emf','BackgroundColor','none','Resolution', 900)               
        
        
        
        
        