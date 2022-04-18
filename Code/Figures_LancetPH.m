%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Main Paper Figures  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
close all
load('Fitted_Models')
Linemarkertypes = {'-p','-x','-h','-s','-d','-*','-v','-^','-+','-o'};
Markertypes = {'p','x','h','s','d','*','v','^','+','o'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure(1)
    for b = 2:size(Influenza_UK,2)
        subplot(5,2,b-1)
        plot(years,Influenza_UK(:,b), '-o',  'Linewidth', 0.5, 'Color','black', 'Markersize', 3 ,'MarkerEdgeColor','red')
        ylim([0,max(Influenza_UK(:,b))*1.05])
        yticks([1000,round(max(Influenza_UK(:,b)),0)])
        xlim([1895,1950])
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title(citynames(b),'FontSize',11,'FontWeight','bold');
        box off
    end
        subplot(5,2,b)
        plot(Influenza_US(2,:),Influenza_US(1,:), '-o',  'Linewidth', 0.5, 'Color','black', 'Markersize', 3  ,'MarkerEdgeColor','red')
        ylim([0,max(Influenza_US(1,:))*1.05])
        yticks([1000,round(max(Influenza_US(1,:)),0)])
        xlim([1895,1950])
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title('United States','FontSize',11,'FontWeight','bold')
        box off



        subplot(5,2,b+1)
        plot(Influenza_RUS(2,1:80),Influenza_RUS(1,1:80), '-o',  'Linewidth', 0.5, 'Color','black', 'Markersize',3  ,'MarkerEdgeColor','red')
        ylim([0,max(Influenza_RUS(1,1:80))*1.05])
        yticks([250,round(max(Influenza_RUS(1,1:80)),0)])
        xlim([1838,1917])
        xticks([1840:20:1900,1917])
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title('England & Wales','FontSize',11,'FontWeight','bold')
        box off
        AddLetters2Plots(figure(1), {'a', 'c', 'e', 'g', 'i', 'b', 'd', 'f', 'h', 'j'}, 'HShift', -0.07, 'VShift', -0.035, 'Direction', 'TopDown','fontsize',8) 

                    h = figure(1);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 25];
        exportgraphics(figure(1),'../Figures/Figure_1.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(figure(1),'../Figures/Figure_1.emf','BackgroundColor','none','Resolution', 900)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure(2)
        rng(1001)
        Simulation = simulate_bpareto(1000000,Base_Model(1).alpha',Base_Model(1).dmax,Base_Model(1).dmin);
        shadedplot(1:size(Simulation(:,:,1),2), prctile([Simulation(:,:,1)],10), prctile([Simulation(:,:,1)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        shadedplot(1:size(Simulation(:,:,1),2), prctile([Simulation(:,:,1)],25), prctile([Simulation(:,:,1)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 

        for b = 2:size(Influenza_UK,2)
           hold on
           hc(b) = plot(Influenza_UK(26:end,b), Linemarkertypes{b}, 'Linewidth', 0.01,'Color',[[230, 33, 11]/sum([230, 33, 11]),0.3], 'Markersize', 5 );
        end
        hold on
        hd = plot(median(Simulation(:,:,1)),'-', 'Linewidth', 0.5,'Color','black')
        hold on
        he = plot(median(Influenza_UK(26:end,2:end)','omitnan'),'-', 'Linewidth',0.5, 'Color',[[230, 33, 11]/sum([230, 33, 11]),1])
        yticks([0 500 1000 1500])
        xticklabels({'0', '500', '1000', '1500'}) 
        xlim([0,31])
        xticks([1 6 11 16 21 26 31])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        [leg] = legend([hc(2:end)], 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','Median (cities)', 'Median (model)','FontSize',8,'NumColumns',1,'location','best');
%         leg.ItemTokenSize = [15,9];
        box off
        set(figure(2), 'Units', 'centimeters', 'Position', [20,10,12.95*1.5,12.95],'PaperPositionMode','auto');
        exportgraphics(figure(2),'../Figures/Figure_2.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(figure(2),'../Figures/Figure_2.emf','BackgroundColor','none','Resolution', 900)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Monte Carlo to simulate Model Uncertainty
close all
t = [1:31]'-1;
Covid_Sim = [];
parfor i=1:size(Rand_Parms,1)
    alpha_sim(i,:) =  1./(Rand_Parms(i,2)*exp(-t*Rand_Parms(i,1)));
    temp_1(i,:) = bpareto_outbreakprob(alpha_sim(i,:),1858,24,500)';
    temp_2(i,:) = bpareto_outbreakprob(alpha_sim(i,:),1858,24,1000)';
end
    Covid_Sim(:,:,1) =temp_1;
    Covid_Sim(:,:,2) =temp_2;

figure(3)
        pa = subplot(2,4,[1 2])
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Base_Model(n).alpha',Base_Model(n).dmax,Base_Model(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Base_Model(n+1).alpha',Base_Model(n+1).dmax,Base_Model(n+1).dmin,500),  Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        ylabel(sprintf('Probability of exceeding 500 deaths/million'),'fontsize',8) 
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield', 'US'},'FontSize',8, 'Location','best', 'NumColumns',1);
%         leg.ItemTokenSize = [3,1.5];
        legend boxoff
        xlim([1920,1950])
        xticks([1920:5:1950])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950'})
        yticks([0:0.05:0.4])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})
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
            plot(years(26:end), bpareto_outbreakprob(Base_Model(n).alpha',Base_Model(n).dmax,Base_Model(n).dmin,1000), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Base_Model(n+1).alpha',Base_Model(n+1).dmax,Base_Model(n+1).dmin,1000), Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black' )
        ylabel(sprintf('Probability of exceeding 1,000 deaths/million'),'fontsize',8) 
         a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1920,1950])
        xticks([1920:5:1950])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950'})
        
        pc = subplot(2,4,[5 6])
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,300), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,400), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,500), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('300 deaths/million', '400 deaths/million', '500 deaths/million','FontSize',8, 'location', 'best', 'NumColumns' ,1)
        legend boxoff
%         leg.ItemTokenSize = [3,1.5];
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xticks([1892:5:1917])
        xticklabels({'1892','1897', '1902','1907','1912','1917'})
        yticks([0:0.05:0.4])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})

        pd = subplot(2,4,7)
         hold on
        shadedplot(1:size(Covid_Sim(:,:,1),2), prctile([Covid_Sim(:,:,1)],10), prctile([Covid_Sim(:,:,1)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        shadedplot(1:size(Covid_Sim(:,:,1),2), prctile([Covid_Sim(:,:,1)],25), prctile([Covid_Sim(:,:,1)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
        hold on
        ha = plot(median(Covid_Sim(:,:,1),'omitnan'),'-', 'Linewidth', 1,'Color','black')
        xticks([1 11  21  31])
        xticklabels({'2022', '2032','2042','2052'}) 
        ylabel(sprintf('Probability of exceeding 500 deaths/million'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        pe = subplot(2,4,8)
        hold on
        shadedplot(1:size(Covid_Sim(:,:,2),2), prctile([Covid_Sim(:,:,2)],10), prctile([Covid_Sim(:,:,2)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        shadedplot(1:size(Covid_Sim(:,:,2),2), prctile([Covid_Sim(:,:,2)],25), prctile([Covid_Sim(:,:,2)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
        hold on
        hb = plot(median(Covid_Sim(:,:,2),'omitnan'),'-', 'Linewidth', 1,'Color','black')
        xticks([1 11  21  31])
        xticklabels({'2022', '2032','2042','2052'}) 
        yticks([0:0.025:0.15])
        ylabel(sprintf('Probability of exceeding 1,000 deaths/million'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        AddLetters2Plots({pa, pb, pc, pd, pe},{'a','b','c','d', 'e'}, 'HShift', -0.05, 'VShift', -0.065, 'Direction', 'TopDown') 

        set(figure(3), 'Units', 'centimeters', 'Position', [20,10,12.95*1.5,12.95*1.5], 'PaperPositionMode','auto');
        exportgraphics(figure(3),'../Figures/Figure_3.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(figure(3),'../Figures/Figure_3.emf','BackgroundColor','none','Resolution', 900)