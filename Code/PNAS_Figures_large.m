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
        subplot((size(Influenza_UK,2)-1)/2+3,2,b-1)
        plot(years,Influenza_UK(:,b), '-.o',  'Linewidth', 1., 'Color','black', 'Markersize', 3 )
        ylim([0,max(Influenza_UK(:,b))*1.05])
        yticks([1000,round(max(Influenza_UK(:,b)),0)])
        xlim([1895,1950])
        title(citynames(b),'FontSize',8,'FontWeight','bold');
    end
        subplot((size(Influenza_UK,2)-1)/2+3,2,b)
        plot(Influenza_US(2,:),Influenza_US(1,:), '-.o',  'Linewidth', 1., 'Color','black', 'Markersize', 3 )
        ylim([0,max(Influenza_US(1,:))*1.05])
        yticks([1000,round(max(Influenza_US(1,:)),0)])
        xlim([1895,1950])
        title('United States','FontSize',8,'FontWeight','bold')
        subplot((size(Influenza_UK,2)-1)/2+3,2,b+1)
        plot(Influenza_RUS(2,1:80),Influenza_RUS(1,1:80), '-.o',  'Linewidth', 1., 'Color','black', 'Markersize', 3 )
        ylim([0,max(Influenza_RUS(1,1:80))*1.05])
        yticks([250,round(max(Influenza_RUS(1,1:80)),0)])
        xlim([1838,1917])
        title('England & Wales','FontSize',8,'FontWeight','bold')

        subplot((size(Influenza_UK,2)-1)/2+3,2,[b+2 b+5])
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
        yticks([0 500 1000 1500])
        xticklabels({'0', '500', '1000', '1500'}) 
        xlim([0,31])
        xticks([1 6 11 16 21 26 31])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950'}) 
        legend([hc(2:end)  he hd], 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','Median (cities)', 'Median (model)','FontSize',8,'NumColumns',2)
        AddLetters2Plots(figure(1), {'a', 'c', 'e', 'g', 'i', 'k', 'b', 'd', 'f', 'h', 'j'}, 'HShift', -0.05, 'VShift', -0.0275, 'Direction', 'TopDown')

        set (figure(1), 'Units', 'centimeters', 'Position', [0.16,0,23,23]);
        h = figure(1);
        set(h,'Units','centimeters');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Figure_large_1.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/Figure_large_1.emf','BackgroundColor','none','Resolution', 900)





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

figure(2)
        pa = subplot(2,4,[1 2])
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Base_Model(n).alpha',Base_Model(n).dmax,Base_Model(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.8, 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Base_Model(n+1).alpha',Base_Model(n+1).dmax,Base_Model(n+1).dmin,500),  Linemarkertypes{n+1}, 'Linewidth', 0.8, 'Color', 'black')
        ylabel(sprintf('Probability of exceeding 500 \n deaths deaths per million'),'FontSize',8,'FontWeight','bold')
        legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield', 'US'},'FontSize',8,'NumColumns',2, 'Location','southwest')

        pb = subplot(2,4,[3 4])
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Base_Model(n).alpha',Base_Model(n).dmax,Base_Model(n).dmin,1000), Linemarkertypes{n}, 'Linewidth', 0.8, 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Base_Model(n+1).alpha',Base_Model(n+1).dmax,Base_Model(n+1).dmin,1000), Linemarkertypes{n+1}, 'Linewidth', 0.8, 'Color', 'black' )
        ylabel(sprintf('\n \n Probability of exceeding 1,000 \n deaths per million'),'FontSize',8,'FontWeight','bold')
        
        pc = subplot(2,4,[5 6])
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,300), '-', 'Linewidth', 1.5, 'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,400), '--', 'Linewidth', 1.5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,500), '.', 'Linewidth', 1.5, 'Color' ,'black')
        leg=legend('300 deaths per million', '400 deaths per million', '500 deaths per million','FontSize',6)
        title(leg, 'Threshold')
        ylabel(sprintf('Probability of exceeding threshold'),'FontSize',8,'FontWeight','bold')



        pd = subplot(2,4,7)
         hold on
        shadedplot(1:size(Covid_Sim(:,:,1),2), prctile([Covid_Sim(:,:,1)],10), prctile([Covid_Sim(:,:,1)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        shadedplot(1:size(Covid_Sim(:,:,1),2), prctile([Covid_Sim(:,:,1)],25), prctile([Covid_Sim(:,:,1)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
        hold on
        ha = plot(median(Covid_Sim(:,:,1),'omitnan'),'-', 'Linewidth', 1,'Color','black')
        xticks([1 6 11 16 21 26 31])
        xticklabels({'2022','2027', '2032','2037','2042','2047','2052'}) 
        ylabel(sprintf('Probability of exceeding 500 deaths per million'),'FontSize',8,'FontWeight','bold')
        subplot(2,4,8)
        hold on
        shadedplot(1:size(Covid_Sim(:,:,2),2), prctile([Covid_Sim(:,:,2)],10), prctile([Covid_Sim(:,:,2)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        shadedplot(1:size(Covid_Sim(:,:,2),2), prctile([Covid_Sim(:,:,2)],25), prctile([Covid_Sim(:,:,2)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
        hold on
        hb = plot(median(Covid_Sim(:,:,2),'omitnan'),'-', 'Linewidth', 1,'Color','black')
        xticks([1 6 11 16 21 26 31])
        xticklabels({'2022','2027', '2032','2037','2042','2047','2052'}) 
        ylabel(sprintf('Probability of exceeding 1,000 deaths per million'),'FontSize',8,'FontWeight','bold')

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.05, 'VShift', -0.02, 'Direction', 'TopDown') 

        set (figure(2), 'Units', 'centimeters', 'Position', [0.16,0,23,23]);
        h = figure(2);
        set(h,'Units','centimeters');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Figure_large_2.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/Figure_large_2.emf','BackgroundColor','none','Resolution', 900)