%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Appendix  Figures  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
close all
load('Fitted_Models_v1')
Linemarkertypes = {'-p','-x','-h','-s','-d','-*','-v','-^','-+','-o'};
Markertypes = {'p','x','h','s','d','*','v','^','+','o','>'};


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 2 ab  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for b = 2:size(Influenza_UK,2) 
    InvCdf(:,:,b) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b).alpha',Base_Model(b).dmax,Base_Model(b).dmin);
end
    InvCdf_US(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b+1).alpha',Base_Model(b+1).dmax,Base_Model(b+1).dmin);
    InvCdf_RUS_1848(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b+2).alpha',Base_Model(b+2).dmax,Base_Model(b+2).dmin);
    InvCdf_RUS_1890(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b+3).alpha',Base_Model(b+3).dmax,Base_Model(b+3).dmin);
    
figure(2)
        for b = 2:size(Influenza_UK,2)
            subplot((size(Influenza_UK,2)-1)/2,2,b-1)
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(1,:,b), InvCdf(5,:,b), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(2,:,b), InvCdf(4,:,b), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hd = plot(InvCdf(3,:,b),'-', 'Linewidth', 1,'Color','black')
            hold on
            hf = plot((Influenza_UK(26:end,b)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4 )
            xlim([0,37])
            ylim([0,max(InvCdf(5,:,b)*1.05)])
            xticks([1 6 11 16 21 26 31 36])
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            yticks((round(max(Influenza_UK(26:end,b)),0)))
            title(citynames(b))
        end
            set (figure(2), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
            h = figure(2);
            set(h,'Units','Inches');
            pos = get(h,'Position');
            set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
            exportgraphics(h,'../Figures/Appendix_Figure_2a.pdf','BackgroundColor','none')
            exportgraphics(h,'../Figures/Appendix_Figure_2a.emf','BackgroundColor','none')

figure(3)

        subplot(3,1,1)
            [ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(1,:), InvCdf_US(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(2,:), InvCdf_US(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hd = plot(InvCdf_US(3,:),'-', 'Linewidth', 1,'Color','black')
            hold on
            hf = plot((Influenza_US(1,21:end)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4)
            xlim([0,37])
            ylim([0,max(InvCdf_US(5,:)*1.05)])

            xticks([1 6 11 16 21 26 31 36])
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            yticks(round(max(Influenza_US(1,21:end)),0))
            title('United States')
         subplot(3,1,2)
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1848,2), InvCdf_RUS_1848(1,:), InvCdf_RUS_1848(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1848,2), InvCdf_RUS_1848(2,:), InvCdf_RUS_1848(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hd = plot(InvCdf_RUS_1848(3,:),'-', 'Linewidth', 1,'Color','black')
            hold on
            hf = plot((Influenza_RUS(1,12:52)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4)
            xlim([0,26])
            ylim([0,max(max(InvCdf_RUS_1848(5,:),Influenza_RUS(1,12:52)))*1.05])

            xticks([1 6 11 16 21 26 31 36 41])
            xticklabels({'1849','1854', '1859','1864','1869','1874','1879','1884','1889'}) 
            yticks(round(max(Influenza_RUS(1,12:52)),0))
            title('England & Wales 1848')                      
        subplot(3,1,3)
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1890,2), InvCdf_RUS_1890(1,:), InvCdf_RUS_1890(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1890,2), InvCdf_RUS_1890(2,:), InvCdf_RUS_1890(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hd = plot(InvCdf_RUS_1890(3,:),'-', 'Linewidth', 1,'Color','black')
            hold on
            hf = plot((Influenza_RUS(1,55:80)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4)
            xlim([0,26])
            ylim([0,max(max(InvCdf_RUS_1890(5,:),Influenza_RUS(1,55:80)))*1.05])

            xticks([1 6 11 16 21 26])
            xticklabels({'1892','1897', '1902','1907','1912','1917'}) 
            yticks(round(max(Influenza_RUS(1,55:80)),0))
            title('England & Wales 1890')           

            set (figure(3), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
            h = figure(3);
            set(h,'Units','Inches');
            pos = get(h,'Position');
            set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
            exportgraphics(h,'../Figures/Appendix_Figure_2b.pdf','BackgroundColor','none')
            exportgraphics(h,'../Figures/Appendix_Figure_2b.emf','BackgroundColor','none')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        figure(4)
        subplot(1,2,1)
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Common_Bounds_Model(n).alpha',Common_Bounds_Model(n).dmax,Common_Bounds_Model(n).dmin,500), Linemarkertypes{n}, 'Linewidth',0.8,'Color','black')
        end
        ylabel(sprintf('Probability of mortality rate exceeding 500 per million'),'FontSize',12,'FontWeight','bold') 
        subplot(1,2,2)
        
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Common_Bounds_Model(n).alpha',Common_Bounds_Model(n).dmax,Common_Bounds_Model(n).dmin,1000), Linemarkertypes{n}, 'Linewidth', 0.8,'Color','black')
        end
         legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'})
        ylabel(sprintf('Probability of mortality rate exceeding 1,000 per million'),'FontSize',12,'FontWeight','bold') 

        set (figure(4), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(4);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Appendix_Figure_4.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Appendix_Figure_4.emf','BackgroundColor','none')
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

       figure(5)
        pa = subplot(2,4,[1 2])
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Theoretical_Bounds_Model(n).alpha',Theoretical_Bounds_Model(n).dmax,Theoretical_Bounds_Model(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Theoretical_Bounds_Model(n+1).alpha',Theoretical_Bounds_Model(n+1).dmax,Theoretical_Bounds_Model(n+1).dmin,500),  Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        ylabel(sprintf('Probability of exceeding 500 deaths/million'),'fontsize',8) 
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield', 'US'},'FontSize',8, 'Location','best', 'NumColumns',1);
%         leg.ItemTokenSize = [3,1.5];
        legend boxoff
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        yticks([0:0.05:0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 

        pb = subplot(2,4,[3 4])
        p = get(pb, 'position');
        p(1) = p(1) + 0.03;
        p(3) = p(3) - 0.03;
        set(pb, 'position', p);        
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Theoretical_Bounds_Model(n).alpha',Theoretical_Bounds_Model(n).dmax,Theoretical_Bounds_Model(n).dmin,1000), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Theoretical_Bounds_Model(n+1).alpha',Theoretical_Bounds_Model(n+1).dmax,Theoretical_Bounds_Model(n+1).dmin,1000), Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black' )
        ylabel(sprintf('Probability of exceeding 1,000 deaths/million'),'fontsize',8) 
         a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        yticks([0:0.05:0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

        pc = subplot(2,4,[5 6])
        plot(Influenza_RUS(2,12:52),bpareto_outbreakprob(Theoretical_Bounds_Model(11).alpha',Theoretical_Bounds_Model(11).dmax,Theoretical_Bounds_Model(11).dmin,100), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,12:52),bpareto_outbreakprob(Theoretical_Bounds_Model(11).alpha',Theoretical_Bounds_Model(11).dmax,Theoretical_Bounds_Model(11).dmin,200), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,12:52),bpareto_outbreakprob(Theoretical_Bounds_Model(11).alpha',Theoretical_Bounds_Model(11).dmax,Theoretical_Bounds_Model(11).dmin,300), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('100 deaths/million', '200 deaths/million', '300 deaths/million','FontSize',8, 'location', 'best', 'NumColumns' ,1)
        legend boxoff
%         leg.ItemTokenSize = [3,1.5];
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1848,1889])
        xticks([1849:5:1889])
        xticklabels({'1849','1854', '1859','1864','1869','1874','1879','1884','1889'}) 
        yticks([0:0.05:0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

        pd = subplot(2,4,[7 8])
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,300), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,400), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,500), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('300 deaths/million', '400 deaths/million', '500 deaths/million','FontSize',8, 'location', 'best', 'NumColumns' ,1)
        legend boxoff
%         leg.ItemTokenSize = [3,1.5];
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1891,1917])
        xticks([1892:5:1917])
        xticklabels({'1892','1897', '1902','1907','1912','1917'})
        yticks([0:0.05:0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.05, 'VShift', -0.065, 'Direction', 'TopDown') 

        set(figure(5), 'Units', 'centimeters', 'Position', [20,10,12.95*1.5,12.95*1.5], 'PaperPositionMode','auto');
        exportgraphics(figure(5),'../Figures/Appendix_Figure_4.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(figure(5),'../Figures/Appendix_Figure_4.emf','BackgroundColor','none','Resolution', 900)
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 5 ab  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for b = 2:size(Influenza_UK,2) 
    InvCdf(:,:,b) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Estimated_Bounds_Model(b).alpha',Estimated_Bounds_Model(b).dmax,Estimated_Bounds_Model(b).dmin);
end
    InvCdf_US(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Estimated_Bounds_Model(b+1).alpha',Estimated_Bounds_Model(b+1).dmax,Estimated_Bounds_Model(b+1).dmin);
    InvCdf_RUS_1848(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Estimated_Bounds_Model(b+2).alpha',Estimated_Bounds_Model(b+2).dmax,Estimated_Bounds_Model(b+2).dmin);
    InvCdf_RUS_1890(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Estimated_Bounds_Model(b+3).alpha',Estimated_Bounds_Model(b+3).dmax,Estimated_Bounds_Model(b+3).dmin);
    
figure(6)
        for b = 2:size(Influenza_UK,2)
            subplot((size(Influenza_UK,2)-1)/2,2,b-1)
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(1,:,b), InvCdf(5,:,b), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(2,:,b), InvCdf(4,:,b), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hf = plot((Influenza_UK(26:end,b)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4 )
            xlim([0,37])
            ylim([0,max(max(InvCdf(5,:,b),max(Influenza_UK(26:end,b)))*1.05)])
            xticks([1 6 11 16 21 26 31 36])
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            yticks((round(max(Influenza_UK(26:end,b)),0)))
            title(citynames(b))
        end
            set (figure(6), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
            h = figure(6);
            set(h,'Units','Inches');
            pos = get(h,'Position');
            set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
            exportgraphics(h,'../Figures/Appendix_Figure_5a.pdf','BackgroundColor','none')
            exportgraphics(h,'../Figures/Appendix_Figure_5a.emf','BackgroundColor','none')

figure(7)

        subplot(3,1,1)
            [ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(1,:), InvCdf_US(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(2,:), InvCdf_US(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hf = plot((Influenza_US(1,21:end)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4)
            xlim([0,37])
            ylim([0,max(max(InvCdf_US(5,:)),max(Influenza_US(1,21:end))*1.05)])

            xticks([1 6 11 16 21 26 31 36])
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            yticks(round(max(Influenza_US(1,21:end)),0))
            title('United States')
         subplot(3,1,2)
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1848,2), InvCdf_RUS_1848(1,:), InvCdf_RUS_1848(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1848,2), InvCdf_RUS_1848(2,:), InvCdf_RUS_1848(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hf = plot((Influenza_RUS(1,12:52)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4)
            xlim([0,41])
            ylim([0,max(max(InvCdf_RUS_1848(5,:),Influenza_RUS(1,12:52)))*1.05])

            xticks([1 6 11 16 21 26 31 36 41])
            xticklabels({'1849','1854', '1859','1864','1869','1874','1879','1884','1889'}) 
            yticks(round(max(Influenza_RUS(1,12:52)),0))
            title('England & Wales 1848')                      
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
            yticks(round(max(Influenza_RUS(1,55:80)),0))
            title('England & Wales 1890')           

            set(figure(7), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
            h = figure(7);
            set(h,'Units','Inches');
            pos = get(h,'Position');
            set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
            exportgraphics(h,'../Figures/Appendix_Figure_5b.pdf','BackgroundColor','none')
            exportgraphics(h,'../Figures/Appendix_Figure_5b.emf','BackgroundColor','none')

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 6  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

       figure(8)
        pa = subplot(2,4,[1 2])
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Estimated_Bounds_Model(n).alpha',Estimated_Bounds_Model(n).dmax,Estimated_Bounds_Model(n).dmin,250), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Estimated_Bounds_Model(n+1).alpha',Estimated_Bounds_Model(n+1).dmax,Estimated_Bounds_Model(n+1).dmin,250),  Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        ylabel(sprintf('Probability of exceeding 250 deaths/million'),'fontsize',8) 
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield', 'US'},'FontSize',8, 'Location','best', 'NumColumns',1);
%         leg.ItemTokenSize = [3,1.5];
        legend boxoff
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        yticks([0:0.05:0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 

        pb = subplot(2,4,[3 4])
        p = get(pb, 'position');
        p(1) = p(1) + 0.03;
        p(3) = p(3) - 0.03;
        set(pb, 'position', p);        
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Estimated_Bounds_Model(n).alpha',Estimated_Bounds_Model(n).dmax,Estimated_Bounds_Model(n).dmin,500), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Estimated_Bounds_Model(n+1).alpha',Estimated_Bounds_Model(n+1).dmax,Estimated_Bounds_Model(n+1).dmin,500), Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black' )
        ylabel(sprintf('Probability of exceeding 500 deaths/million'),'fontsize',8) 
         a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        yticks([0:0.05:0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

        pc = subplot(2,4,[5 6])
        plot(Influenza_RUS(2,12:52),bpareto_outbreakprob(Estimated_Bounds_Model(11).alpha',Estimated_Bounds_Model(11).dmax,Estimated_Bounds_Model(11).dmin,50), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,12:52),bpareto_outbreakprob(Estimated_Bounds_Model(11).alpha',Estimated_Bounds_Model(11).dmax,Estimated_Bounds_Model(11).dmin,100), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,12:52),bpareto_outbreakprob(Estimated_Bounds_Model(11).alpha',Estimated_Bounds_Model(11).dmax,Estimated_Bounds_Model(11).dmin,150), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('50 deaths/million', '100 deaths/million', '150 deaths/million','FontSize',8, 'location', 'best', 'NumColumns' ,1)
        legend boxoff
%         leg.ItemTokenSize = [3,1.5];
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1848,1889])
        xticks([1849:5:1889])
        xticklabels({'1849','1854', '1859','1864','1869','1874','1879','1884','1889'}) 
        yticks([0:0.05:0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

        pd = subplot(2,4,[7 8])
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,300), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,400), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,500), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('300 deaths/million', '400 deaths/million', '500 deaths/million','FontSize',8, 'location', 'best', 'NumColumns' ,1)
        legend boxoff
%         leg.ItemTokenSize = [3,1.5];
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1891,1917])
        xticks([1892:5:1917])
        xticklabels({'1892','1897', '1902','1907','1912','1917'})
        yticks([0:0.05:0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.05, 'VShift', -0.065, 'Direction', 'TopDown') 

        set(figure(8), 'Units', 'centimeters', 'Position', [20,10,12.95*1.5,12.95*1.5], 'PaperPositionMode','auto');
        exportgraphics(figure(8),'../Figures/Appendix_Figure_6.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(figure(8),'../Figures/Appendix_Figure_6.emf','BackgroundColor','none','Resolution', 900)

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 7 ab  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for b = 2:size(Influenza_UK,2) 
    InvCdf(:,:,b) = weibull_invertcdf(0.01*[10, 25, 50, 75, 90]',Weibull_Model(b).w')*10;
end
    InvCdf_US(:,:) = weibull_invertcdf(0.01*[10, 25, 50, 75, 90]',Weibull_Model(b+1).w')*10;
    InvCdf_RUS_1848(:,:) = weibull_invertcdf(0.01*[10, 25, 50, 75, 90]',Weibull_Model(b+2).w')*10;
    InvCdf_RUS_1890(:,:) = weibull_invertcdf(0.01*[10, 25, 50, 75, 90]',Weibull_Model(b+3).w')*10;
    
figure(9)
        for b = 2:size(Influenza_UK,2)
            subplot((size(Influenza_UK,2)-1)/2,2,b-1)
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(1,:,b), InvCdf(5,:,b), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(2,:,b), InvCdf(4,:,b), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hf = plot((Influenza_UK(26:end,b)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4 )
            xlim([0,37])
            ylim([0,max(max(InvCdf(5,:,b),max(Influenza_UK(26:end,b)))*1.05)])
            xticks([1 6 11 16 21 26 31 36])
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            yticks((round(max(Influenza_UK(26:end,b)),0)))
            title(citynames(b))
        end
            set (figure(9), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
            h = figure(9);
            set(h,'Units','Inches');
            pos = get(h,'Position');
            set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
            exportgraphics(h,'../Figures/Appendix_Figure_7a.pdf','BackgroundColor','none')
            exportgraphics(h,'../Figures/Appendix_Figure_7a.emf','BackgroundColor','none')

figure(10)

        subplot(3,1,1)
            [ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(1,:), InvCdf_US(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(2,:), InvCdf_US(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hf = plot((Influenza_US(1,21:end)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4)
            xlim([0,37])
            ylim([0,max(max(InvCdf_US(5,:)),max(Influenza_US(1,21:end))*1.05)])

            xticks([1 6 11 16 21 26 31 36])
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            yticks(round(max(Influenza_US(1,21:end)),0))
            title('United States')
         subplot(3,1,2)
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1848,2), InvCdf_RUS_1848(1,:), InvCdf_RUS_1848(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1848,2), InvCdf_RUS_1848(2,:), InvCdf_RUS_1848(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hf = plot((Influenza_RUS(1,12:52)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4)
            xlim([0,41])
            ylim([0,max(max(InvCdf_RUS_1848(5,:),Influenza_RUS(1,12:52)))*1.05])

            xticks([1 6 11 16 21 26 31 36 41])
            xticklabels({'1849','1854', '1859','1864','1869','1874','1879','1884','1889'}) 
            yticks(round(max(Influenza_RUS(1,12:52)),0))
            title('England & Wales 1848')                      
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
            yticks(round(max(Influenza_RUS(1,55:80)),0))
            title('England & Wales 1890')           

            set(figure(10), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
            h = figure(10);
            set(h,'Units','Inches');
            pos = get(h,'Position');
            set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
            exportgraphics(h,'../Figures/Appendix_Figure_7b.pdf','BackgroundColor','none')
            exportgraphics(h,'../Figures/Appendix_Figure_7b.emf','BackgroundColor','none')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 8  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

       figure(11)
        pa = subplot(2,4,[1 2])
        for n=2:9
            hold on
            plot(years(26:end), weibull_outbreakprob(Weibull_Model(n).w',50), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),weibull_outbreakprob(Weibull_Model(n+1).w',50),  Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        ylabel(sprintf('Probability of exceeding 500 deaths/million'),'fontsize',8) 
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield', 'US'},'FontSize',8, 'Location','best', 'NumColumns',1);
%         leg.ItemTokenSize = [3,1.5];
        legend boxoff
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        yticks([0:0.05:0.75])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7','0.75'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 

        pb = subplot(2,4,[3 4])
        p = get(pb, 'position');
        p(1) = p(1) + 0.03;
        p(3) = p(3) - 0.03;
        set(pb, 'position', p);        
        for n=2:9
            hold on
            plot(years(26:end),weibull_outbreakprob(Weibull_Model(n).w',100), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),weibull_outbreakprob(Weibull_Model(n+1).w',100), Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black' )
        ylabel(sprintf('Probability of exceeding 1,000 deaths/million'),'fontsize',8) 
         a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        yticks([0:0.05:0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

        pc = subplot(2,4,[5 6])
        plot(Influenza_RUS(2,12:52),weibull_outbreakprob(Weibull_Model(11).w',10), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,12:52),weibull_outbreakprob(Weibull_Model(11).w',20), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,12:52),weibull_outbreakprob(Weibull_Model(11).w',30), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('100 deaths/million', '200 deaths/million', '300 deaths/million','FontSize',8, 'location', 'best', 'NumColumns' ,1)
        legend boxoff
%         leg.ItemTokenSize = [3,1.5];
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1848,1889])
        xticks([1849:5:1889])
        xticklabels({'1849','1854', '1859','1864','1869','1874','1879','1884','1889'}) 
        yticks([0:0.05:0.85])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7','0.75','0.8','0.85'})

        pd = subplot(2,4,[7 8])
        plot(Influenza_RUS(2,55:80),weibull_outbreakprob(Weibull_Model(12).w',30), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,55:80),weibull_outbreakprob(Weibull_Model(12).w',40), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,55:80),weibull_outbreakprob(Weibull_Model(12).w',50), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('300 deaths/million', '400 deaths/million', '500 deaths/million','FontSize',8, 'location', 'best', 'NumColumns' ,1)
        legend boxoff
%         leg.ItemTokenSize = [3,1.5];
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1891,1917])
        xticks([1892:5:1917])
        xticklabels({'1892','1897', '1902','1907','1912','1917'})
        yticks([0:0.05:0.5])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.05, 'VShift', -0.065, 'Direction', 'TopDown') 

        set(figure(11), 'Units', 'centimeters', 'Position', [20,10,12.95*1.5,12.95*1.5], 'PaperPositionMode','auto');
        exportgraphics(figure(11),'../Figures/Appendix_Figure_8.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(figure(11),'../Figures/Appendix_Figure_8.emf','BackgroundColor','none','Resolution', 900)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 9  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     figure(12)
        subplot(3,2,1)
       [f, fx,bw] = ksdensity(exp(Parms(:,1)));
       plot(fx,f,'Color', 'black')
        for b=1:11
            hold on
            plot(exp(Parms(b,1)),0.3, Markertypes{b},'Color', 'black')
        end
        ylabel('\lambda','FontSize',12,'FontWeight','bold')
        subplot(3,2,2)
        [f, fx,bw] =ksdensity(exp(Parms(:,2)));
        plot(fx,f,'Color', 'black')
        for b=1:11
            hold on
            plot(exp(Parms(b,2)),0.0001, Markertypes{b},'Color', 'black')
        end
        ylabel('\eta_{0}','FontSize',12,'FontWeight','bold')
        subplot(3,2,3)
        [f, fx,bw]=ksdensity((Parms(:,1)));
        plot(fx,f,'Color', 'black')
        for b=1:11
            hold on
           plot((Parms(b,1)),0.05, Markertypes{b},'Color', 'black')
        end
        ylabel('log(\lambda)','FontSize',12,'FontWeight','bold')
        pa = subplot(3,2,4)
        [f, fx,bw]=ksdensity((Parms(:,2)));
        plot(fx,f,'Color', 'black')
        for b=1:11
            hold on
            ha(b)=plot((Parms(b,2)),0.01, Markertypes{b},'Color', 'black')
        end
        ylabel('log(\eta_{0})','FontSize',12,'FontWeight','bold')
        subplot(3,2,[5 6])
        axis off
 
        legend(ha,{ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield', 'US', 'England & Wales 1848', 'England & Wales 1890'},'FontSize',6,'NumColumns',3,'Orientation','horizontal')

        set(figure(12), 'Units', 'centimeters', 'Position', [20,10,12.95,12.95],'PaperPositionMode','auto');
        h = figure(12);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Appendix_Figure_9.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Appendix_Figure_9.emf','BackgroundColor','none')