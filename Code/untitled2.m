%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Monte Carlo to simulate Model Uncertainty
close all

figure(2)
        pa = subplot(2,4,[1 2])
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Base_Model(n).alpha',Base_Model(n).dmax,Base_Model(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 1.5 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Base_Model(n+1).alpha',Base_Model(n+1).dmax,Base_Model(n+1).dmin,500),  Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 1.5 , 'Color', 'black')
        ylabel(sprintf('Probability of exceeding 500 deaths per million'),'FontSize',6)
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield', 'US'},'FontSize',6, 'Location','best', 'NumColumns',1);
        leg.ItemTokenSize = [3,1.5];
        legend boxoff
        xlim([1920,1950])
        xticks([1920:5:1950])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950'})
        yticks([0:0.05:0.4])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',6)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',6)

        pb = subplot(2,4,[3 4])
        p = get(pb, 'position');
        p(1) = p(1) + 0.03;
        p(3) = p(3) - 0.03;
        set(pb, 'position', p);        
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Base_Model(n).alpha',Base_Model(n).dmax,Base_Model(n).dmin,1000), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 1.5 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Base_Model(n+1).alpha',Base_Model(n+1).dmax,Base_Model(n+1).dmin,1000), Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 1.5 , 'Color', 'black' )
        ylabel(sprintf('Probability of exceeding 1,000 deaths per million'),'FontSize',6)
         a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',6)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',6)
        xlim([1920,1950])
        xticks([1920:5:1950])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950'})
        
        pc = subplot(2,4,[5 6])
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,300), '-+', 'Linewidth', .5, 'Markersize', 1.5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,400), '-o', 'Linewidth', .5, 'Markersize', 1.5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,500), '-d', 'Linewidth', .5, 'Markersize', 1.5, 'Color' ,'black')
        leg=legend('300 deaths/million', '400 deaths/million', '500 deaths/million','FontSize',6, 'location', 'best', 'NumColumns' ,1)
        legend boxoff
        leg.ItemTokenSize = [3,1.5];

        ylabel(sprintf('Probability of exceeding threshold'),'FontSize',6)
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',6)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',6)
        xticks([1892:5:1917])
        xticklabels({'1892','1897', '1902','1907','1912','1917'})
        pd = subplot(2,4,7)
         hold on
        shadedplot(1:size(Covid_Sim(:,:,1),2), prctile([Covid_Sim(:,:,1)],10), prctile([Covid_Sim(:,:,1)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        shadedplot(1:size(Covid_Sim(:,:,1),2), prctile([Covid_Sim(:,:,1)],25), prctile([Covid_Sim(:,:,1)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
        hold on
        ha = plot(median(Covid_Sim(:,:,1),'omitnan'),'-', 'Linewidth', 1,'Color','black')
        xticks([1 11  21  31])
        xticklabels({'2022', '2032','2042','2052'}) 
        ylabel(sprintf('Probability of exceeding 500 deaths per million'),'FontSize',6)
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',6)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',6)
        pe = subplot(2,4,8)
        hold on
        shadedplot(1:size(Covid_Sim(:,:,2),2), prctile([Covid_Sim(:,:,2)],10), prctile([Covid_Sim(:,:,2)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        shadedplot(1:size(Covid_Sim(:,:,2),2), prctile([Covid_Sim(:,:,2)],25), prctile([Covid_Sim(:,:,2)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
        hold on
        hb = plot(median(Covid_Sim(:,:,2),'omitnan'),'-', 'Linewidth', 1,'Color','black')
        xticks([1 11  21  31])
        xticklabels({'2022', '2032','2042','2052'}) 
        ylabel(sprintf('Probability of exceeding 1,000 deaths per million'),'FontSize',6)
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',6)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',6)
        AddLetters2Plots({pa, pb, pc, pd, pe},{'a','b','c','d', 'e'}, 'HShift', -0.06, 'VShift', -0.065, 'Direction', 'TopDown') 

        set(figure(2), 'Units', 'centimeters', 'Position', [20,10,12.95,12.95], 'PaperPositionMode','auto');
        exportgraphics(figure(2),'../Figures/Figure_medium_2.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(figure(2),'../Figures/Figure_medium_2.emf','BackgroundColor','none','Resolution', 900)