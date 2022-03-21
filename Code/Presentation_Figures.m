%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Presentation Figures  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
        subplot((size(Influenza_UK,2)-1)/2,2,b-1)
        hold on
        plot(years,Influenza_UK(:,b), '-.o',  'Linewidth', 1., 'Color','black', 'Markersize', 3 )
        ylim([0,max(Influenza_UK(:,b))*1.05])
        area([1917.5,1919.5],[max(ylim), max(ylim)], 'FaceColor',[0.6 0.6 0.6])
        area([1919.5,1938.5],[max(ylim), max(ylim)], 'FaceColor',[0.7 0.7 0.7])
        plot(years,Influenza_UK(:,b), '-.o',  'Linewidth', 1., 'Color','black', 'Markersize', 3 )
        yticks([1000,round(max(Influenza_UK(:,b)),0)])
        xlim([1895,1950])
        title(citynames(b),'FontSize',10,'FontWeight','bold');
    end

        set (figure(1), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(1);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Presentation_Figure_1.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Presentation_Figure_1.eps','BackgroundColor','none')


    figure(2)
    hold on
        ylim([0,max(Influenza_US(1,:))*1.05])
        plot(Influenza_US(2,:),Influenza_US(1,:), '-.o',  'Linewidth', 1., 'Color','black', 'Markersize', 3 )
        area([1917.5,1919.5],[max(ylim), max(ylim)], 'FaceColor',[0.6 0.6 0.6])
        area([1919.5,1938.5],[max(ylim), max(ylim)], 'FaceColor',[0.7 0.7 0.7])
        plot(Influenza_US(2,:),Influenza_US(1,:), '-.o',  'Linewidth', 1., 'Color','black', 'Markersize', 3 )
        yticks([1000,round(max(Influenza_US(1,:)),0)])
        xlim([1895,1950])
        ylabel('Influenza (deaths/million)','FontSize',12,'FontWeight','bold')
        title('United States','FontSize',18,'FontWeight','bold')
        set (figure(2), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(2);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Presentation_Figure_2.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Presentation_Figure_2.eps','BackgroundColor','none')

    figure(3)
        ylim([0,max(Influenza_RUS(1,1:79))*1.05])
        hold on
        plot(Influenza_RUS(2,:),Influenza_RUS(1,:), '-.o',  'Linewidth', 1., 'Color','black', 'Markersize', 3 )
        area([1846.5,1849.5],[max(ylim), max(ylim)], 'FaceColor',[0.6 0.6 0.6])
        area([1849.5,1869.5],[max(ylim), max(ylim)], 'FaceColor',[0.7 0.7 0.7])        
        area([1889.5,1892.5],[max(ylim), max(ylim)], 'FaceColor',[0.6 0.6 0.6])
        area([1892.5,1915.5],[max(ylim), max(ylim)], 'FaceColor',[0.7 0.7 0.7])
        plot(Influenza_RUS(2,:),Influenza_RUS(1,:), '-.o',  'Linewidth', 1., 'Color','black', 'Markersize', 3 )
        yticks([250,round(max(Influenza_RUS(1,1:79)),0)])
        xlim([1838,1917])
        ylabel('Influenza (deaths/million)','FontSize',12,'FontWeight','bold')
        title('England & Wales','FontSize',18,'FontWeight','bold')
        set (figure(3), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(3);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Presentation_Figure_3.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Presentation_Figure_3.eps','BackgroundColor','none')

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        figure(4)
        rng(1001)
        Simulation = simulate_bpareto(1000000,Base_Model(1).alpha',Base_Model(1).dmax,Base_Model(1).dmin);
        [ha,~,~] = shadedplot(1:size(Simulation(:,:,1),2), prctile([Simulation(:,:,1)],10), prctile([Simulation(:,:,1)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        [hb,~,~] = shadedplot(1:size(Simulation(:,:,1),2), prctile([Simulation(:,:,1)],25), prctile([Simulation(:,:,1)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 

        for b = 2:size(Influenza_UK,2)
           hold on
           hc(b) = plot(Influenza_UK(26:end,b), Linemarkertypes{b}, 'Linewidth', 0.01,'Color',[[230, 33, 11]/sum([230, 33, 11]),0.3] );
        end
        hold on
        hd = plot(median(Simulation(:,:,1)),'-', 'Linewidth', 1.25,'Color','black')
        hold on
        he = plot(median(Influenza_UK(26:end,2:end)','omitnan'),'-', 'Linewidth', 1.25, 'Color',[[230, 33, 11]/sum([230, 33, 11]),1])
        ylabel('Mortality rate (per million)','FontSize',12,'FontWeight','bold')
        xlim([0,31])
        xticks([1 6 11 16 21 26 31])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950'}) 
        legend([hc(2:end)  he hd], 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','Median (cities)', 'Median (model)')
        set (figure(4), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(4);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Presentation_Figure_4.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Presentation_Figure_4.eps','BackgroundColor','none')
             
        figure(5)
        subplot(1,2,1)
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Base_Model(n).alpha',Base_Model(n).dmax,Base_Model(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.8, 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Base_Model(n+1).alpha',Base_Model(n+1).dmax,Base_Model(n+1).dmin,500),  Linemarkertypes{n+1}, 'Linewidth', 0.8, 'Color', 'black')
        ylabel(sprintf('Probability of mortality rate exceeding 500 per million'),'FontSize',12,'FontWeight','bold')
        subplot(1,2,2)
        
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Base_Model(n).alpha',Base_Model(n).dmax,Base_Model(n).dmin,1000), Linemarkertypes{n}, 'Linewidth', 0.8, 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Base_Model(n+1).alpha',Base_Model(n+1).dmax,Base_Model(n+1).dmin,1000), Linemarkertypes{n+1}, 'Linewidth', 0.8, 'Color', 'black' )
         legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield', 'US'})
        ylabel(sprintf('Probability of mortality rate exceeding 1,000 per million'),'FontSize',12,'FontWeight','bold')

        set (figure(5), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(5);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Presentation_Figure_5.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Presentation_Figure_5.eps','BackgroundColor','none')
 

%% Monte Carlo to simulate Model Uncertainty
t = [1:31]'-1;
Covid_Sim = [];
parfor i=1:size(Rand_Parms,1)
    alpha_sim(i,:) =  1./(Rand_Parms(i,2)*exp(-t*Rand_Parms(i,1)));
    temp_1(i,:) = bpareto_outbreakprob(alpha_sim(i,:),1858,24,500)';
    temp_2(i,:) = bpareto_outbreakprob(alpha_sim(i,:),1858,24,1000)';
end
    Covid_Sim(:,:,1) =temp_1;
    Covid_Sim(:,:,2) =temp_2;
    figure(6)
        subplot(1,2,1)
         hold on
        [hc,~,~] = shadedplot(1:size(Covid_Sim(:,:,1),2), prctile([Covid_Sim(:,:,1)],10), prctile([Covid_Sim(:,:,1)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        [hb,~,~] = shadedplot(1:size(Covid_Sim(:,:,1),2), prctile([Covid_Sim(:,:,1)],25), prctile([Covid_Sim(:,:,1)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
        hold on
        ha = plot(median(Covid_Sim(:,:,1),'omitnan'),'-', 'Linewidth', 1,'Color','black')
        xticks([1 6 11 16 21 26 31])
        xticklabels({'2022','2027', '2032','2037','2042','2047','2052'}) 
        ylabel(sprintf('Probability of mortality rate exceeding 500 per million'),'FontSize',12,'FontWeight','bold')

        subplot(1,2,2)
        hold on
        [hc,~,~] = shadedplot(1:size(Covid_Sim(:,:,2),2), prctile([Covid_Sim(:,:,2)],10), prctile([Covid_Sim(:,:,2)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        [hb,~,~] = shadedplot(1:size(Covid_Sim(:,:,2),2), prctile([Covid_Sim(:,:,2)],25), prctile([Covid_Sim(:,:,2)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
        hold on
        ha = plot(median(Covid_Sim(:,:,2),'omitnan'),'-', 'Linewidth', 1,'Color','black')

        xticks([1 6 11 16 21 26 31])
        xticklabels({'2022','2027', '2032','2037','2042','2047','2052'}) 
        ylabel(sprintf('Probability of mortality rate exceeding 1,000 per million'),'FontSize',12,'FontWeight','bold')

        set (figure(6), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(6);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Presentation_Figure_6.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Presentation_Figure_6.eps','BackgroundColor','none')
