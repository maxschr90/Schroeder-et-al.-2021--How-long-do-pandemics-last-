%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Appendix  Figures  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
close all
load('Fitted_Models_v1')
load("MC_save_v2.mat")

Linemarkertypes = {'-p','-x','-h','-s','-d','-*','-v','-^','-+','-o'};
Markertypes = {'p','x','h','s','d','*','v','^','+','o','>'};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 1 ab  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
        for b = 1:size(Influenza_UK,2)-1
            subplot((size(Influenza_UK,2)-1)/2,2,b)
            C = theta_hat(:,:,b);
                trueparms = Estimates(b,1:2);
                [~, xi]= ksdensity(C(:,1));
                [~, yi]= ksdensity(C(:,2));
                [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
                [A,B]=ksdensity(C,[x1(:) x2(:)]);
            
            contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
            colormap(autumn(10))
            hold on
            plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',5)
            plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',5)
            title(citynames{b+1})
            ylabel('\eta_{0}')
            xlabel('\lambda')
            box off
        end
            AddLetters2Plots(figure(1), {'a', 'c', 'e', 'g', 'i', 'b', 'd', 'f'}, 'HShift', -0.07, 'VShift', -0.035, 'Direction', 'TopDown','fontsize',8) 
        
            h = figure(1);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 25];
        exportgraphics(h,'../Figures/SI_Figure_1a.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_1a.emf','BackgroundColor','none','Resolution', 900)   
figure(2)
            subplot(3,1,1)
            C = theta_hat(:,:,9);
                trueparms = Estimates(9,1:2);
                [~, xi]= ksdensity(C(:,1));
                [~, yi]= ksdensity(C(:,2));
                [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),95),50)],[linspace(0.,prctile(C(:,2),95),50)]);
                [A,B]=ksdensity(C,[x1(:) x2(:)]);
            
            contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
            colormap(autumn(10))
            hold on
            plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',5)
            plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',5)
            title('United States')
            ylabel('\eta_{0}')
            xlabel('\lambda')
            box off

            subplot(3,1,2)
            C = theta_hat(:,:,10);
                trueparms = Estimates(10,1:2);
                [~, xi]= ksdensity(C(:,1));
                [~, yi]= ksdensity(C(:,2));
                [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
                [A,B]=ksdensity(C,[x1(:) x2(:)]);
            
            contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
            colormap(autumn(10))
            hold on
            plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',5)
            plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',5)
            title('England & Wales (1847-48)')
            ylabel('\eta_{0}')
            xlabel('\lambda')
            box off

            subplot(3,1,3)
            C = theta_hat(:,:,11);
                trueparms = Estimates(11,1:2);
                [~, xi]= ksdensity(C(:,1));
                [~, yi]= ksdensity(C(:,2));
                [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),95),50)],[linspace(0.,prctile(C(:,2),90),50)]);
                [A,B]=ksdensity(C,[x1(:) x2(:)]);
            
            contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
            colormap(autumn(10))
            hold on
            plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',5)
            plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',5)
            title('England & Wales (1889-90)')
            ylabel('\eta_{0}')
            xlabel('\lambda')
            box off

            AddLetters2Plots(figure(2), {'a', 'b', 'c'}, 'HShift', -0.07, 'VShift', -0.035, 'Direction', 'TopDown','fontsize',8) 
        
            h = figure(2);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 25];
        exportgraphics(h,'../Figures/SI_Figure_1b.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_1b.emf','BackgroundColor','none','Resolution', 900)   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 2 ab  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for b = 2:size(Influenza_UK,2) 
    InvCdf(:,:,b) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b).alpha',Base_Model(b).dmax,Base_Model(b).dmin);
end
    InvCdf_US(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b+1).alpha',Base_Model(b+1).dmax,Base_Model(b+1).dmin);
    InvCdf_RUS_1848(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b+2).alpha',Base_Model(b+2).dmax,Base_Model(b+2).dmin);
    InvCdf_RUS_1890(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b+3).alpha',Base_Model(b+3).dmax,Base_Model(b+3).dmin);
    
figure(3)
        for b = 2:size(Influenza_UK,2)
            subplot((size(Influenza_UK,2)-1)/2,2,b-1)
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(1,:,b), InvCdf(5,:,b), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(2,:,b), InvCdf(4,:,b), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            
            hf = plot((Influenza_UK(26:end,b)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4 )
            xlim([0,37])
            ylim([0,max(InvCdf(5,:,b)*1.05)])
            xticks([1 6 11 16 21 26 31 36])
            xtickangle(0)
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            yticks([0,(round(max(Influenza_UK(26:end,b)),0)),round(max(InvCdf(5,:,b)))])
            title(citynames(b))
            box off
        end
        AddLetters2Plots(figure(3), {'a', 'c', 'e', 'g', 'i', 'b', 'd', 'f'}, 'HShift', -0.07, 'VShift', -0.035, 'Direction', 'TopDown','fontsize',8) 
        
            h = figure(3);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 25];
        exportgraphics(h,'../Figures/SI_Figure_2a.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_2a.emf','BackgroundColor','none','Resolution', 900)   

figure(4)

        subplot(3,1,1)
            [ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(1,:), InvCdf_US(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(2,:), InvCdf_US(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hf = plot((Influenza_US(1,21:end)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4)
            xlim([0,37])
            ylim([0,max(InvCdf_US(5,:)*1.05)])

            xticks([1 6 11 16 21 26 31 36])
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            yticks([0,round(max(Influenza_US(1,21:end)),0),round(max(InvCdf_US(5,:)))])
            title('United States')
            box off

         subplot(3,1,2)
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1848,2), InvCdf_RUS_1848(1,:), InvCdf_RUS_1848(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1848,2), InvCdf_RUS_1848(2,:), InvCdf_RUS_1848(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on

            hf = plot((Influenza_RUS(1,12:52)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4)
            xlim([0,26])
            ylim([0,max(max(InvCdf_RUS_1848(5,:),Influenza_RUS(1,12:52)))*1.05])

            xticks([1 6 11 16 21 26 31 36 41])
            xticklabels({'1849','1854', '1859','1864','1869','1874','1879','1884','1889'}) 
            yticks([0,round(max(Influenza_RUS(1,12:52)),0),round(max(InvCdf_RUS_1848(5,:)))])
            title('England & Wales 1847-48')   
            box off

        subplot(3,1,3)
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1890,2), InvCdf_RUS_1890(1,:), InvCdf_RUS_1890(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1890,2), InvCdf_RUS_1890(2,:), InvCdf_RUS_1890(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hf = plot((Influenza_RUS(1,55:80)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4)
            xlim([0,26])
            ylim([0,max(max(InvCdf_RUS_1890(5,:),Influenza_RUS(1,55:80)))*1.05])

            xticks([1 6 11 16 21 26])
            xticklabels({'1892','1897', '1902','1907','1912','1917'}) 
            yticks([0,round(max(InvCdf_RUS_1890(5,:))),round(max(Influenza_RUS(1,55:80)),0)])
            title('England & Wales 1889-90')           
            box off

        AddLetters2Plots(figure(4), {'a', 'b', 'c'}, 'HShift', -0.07, 'VShift', -0.035, 'Direction', 'TopDown','fontsize',8) 

            h = figure(4);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 25];
        exportgraphics(h,'../Figures/SI_Figure_2b.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_2b.emf','BackgroundColor','none','Resolution', 900)   