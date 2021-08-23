%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Appendix  Figures  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
for b = 2:size(Influenza_UK,2) 
    rng(1001)
    Simulation(:,:,b) = simulate_bpareto(1000000,Base_Model(b).alpha',Base_Model(b).dmax,Base_Model(b).dmin);
end
    rng(1001)
    Simulation_US = simulate_bpareto(1000000,Base_Model(b+1).alpha',Base_Model(b+1).dmax,Base_Model(b+1).dmin);    
    rng(1001)
    Simulation_RUS = simulate_bpareto(1000000,Base_Model(b+2).alpha',Base_Model(b+2).dmax,Base_Model(b+2).dmin);
    
figure(1)
        for b = 2:size(Influenza_UK,2)
            subplot((size(Influenza_UK,2)-1)/2+1,2,b-1)
            [ha,~,~] = shadedplot(1:size(Simulation(:,:,b),2), prctile([Simulation(:,:,b)],10), prctile([Simulation(:,:,b)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [hb,~,~] = shadedplot(1:size(Simulation(:,:,b),2), prctile([Simulation(:,:,b)],25), prctile([Simulation(:,:,b)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hd = plot(median(Simulation(:,:,b)),'-', 'Linewidth', 1,'Color','black')
            hold on
            hf = plot((Influenza_UK(26:end,b)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3 )
            xlim([0,31])
            ylim([0,max(prctile([Simulation(:,:,b)],90)*1.05)])
            xticks([1 6 11 16 21 26 31])
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950'}) 
            yticks((round(max(Influenza_UK(26:end,b)),0)))
            title(citynames(b))
        end
        subplot((size(Influenza_UK,2)-1)/2+1,2,b)
            [ha,~,~] = shadedplot(1:size(Simulation_US,2), prctile([Simulation_US],10), prctile([Simulation_US],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [hb,~,~] = shadedplot(1:size(Simulation_US,2), prctile([Simulation_US],25), prctile([Simulation_US],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hd = plot(median(Simulation_US),'-', 'Linewidth', 1,'Color','black')
            hold on
            hf = plot((Influenza_US(1,21:end)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3)
            xlim([0,31])
            ylim([0,max(prctile([Simulation_US],90)*1.05)])

            xticks([1 6 11 16 21 26 31])
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950'}) 
            yticks(round(max(Influenza_US(1,21:end)),0))
            title('US')
            
         subplot((size(Influenza_UK,2)-1)/2+1,2,b+1)
            [ha,~,~] = shadedplot(1:size(Simulation_RUS,2), prctile([Simulation_RUS],10), prctile([Simulation_RUS],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [hb,~,~] = shadedplot(1:size(Simulation_RUS,2), prctile([Simulation_RUS],25), prctile([Simulation_RUS],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hd = plot(median(Simulation_RUS),'-', 'Linewidth', 1,'Color','black')
            hold on
            hf = plot((Influenza_RUS(1,55:80)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3)
            xlim([0,26])
            ylim([0,max(max(prctile(Simulation_RUS,90),Influenza_RUS(1,55:80)))*1.05])

            xticks([1 6 11 16 21 26])
            xticklabels({'1892','1897', '1902','1907','1912','1917'}) 
            yticks(round(max(Influenza_RUS(1,55:80)),0))
            title('England & Wales')           

            set (figure(1), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
            h = figure(1);
            set(h,'Units','Inches');
            pos = get(h,'Position');
            set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
            exportgraphics(h,'../Figures/Appendix_Figure_1.pdf','BackgroundColor','none')
            exportgraphics(h,'../Figures/Appendix_Figure_1.emf','BackgroundColor','none')
            
            
            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        figure(2)
      
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,300), '-', 'Linewidth', 1.5, 'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,400), '--', 'Linewidth', 1.5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,500), '.', 'Linewidth', 1.5, 'Color' ,'black')
        leg=legend('300 deaths per million', '400 deaths per million', '500 deaths per million')
        title(leg, 'Threshold')
        ylabel(sprintf('Probability of mortality rate exceeding threshold'),'FontSize',12,...
       'FontWeight','bold')
        set (figure(2), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(2);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Appendix_Figure_2.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Appendix_Figure_2.emf','BackgroundColor','none')
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 figure(3)
        rng(1001)
        Simulation = simulate_bpareto(1000000,Common_Bounds_Model(1).alpha',Common_Bounds_Model(1).dmax,Common_Bounds_Model(1).dmin);
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
        he = plot(median(Influenza_UK(26:end,2:end)','omitnan'),'-', 'Linewidth', 1.25, 'Color',[230, 33, 11]/sum([230, 33, 11]))
        ylabel('Mortality rate (per million)','FontSize',12,'FontWeight','bold')
        xlim([0,31])
        xticks([1 6 11 16 21 26 31])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950'}) 
        legend([hc(2:end)  he hd], 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','Median (cities)', 'Median (model)')
        set (figure(3), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(3);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Appendix_Figure_3.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Appendix_Figure_3.emf','BackgroundColor','none')
       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%% Figure 5  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 figure(5)
        rng(1001)
        Simulation = simulate_bpareto(1000000,Estimated_Bounds_Model(1).alpha',Estimated_Bounds_Model(1).dmax,Estimated_Bounds_Model(1).dmin);
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
        he = plot(median(Influenza_UK(26:end,2:end)','omitnan'),'-', 'Linewidth', 1.25, 'Color',[230, 33, 11]/sum([230, 33, 11]))
        ylabel('Mortality rate (per million)','FontSize',12,'FontWeight','bold')
        xlim([0,31])
        xticks([1 6 11 16 21 26 31])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950'}) 
        legend([hc(2:end)  he hd], 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','Median (cities)', 'Median (model)')
        set (figure(5), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(5);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Appendix_Figure_5.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Appendix_Figure_5.emf','BackgroundColor','none')
       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 6  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         figure(6)
        subplot(1,2,1)
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Estimated_Bounds_Model(n).alpha',Estimated_Bounds_Model(n).dmax,Estimated_Bounds_Model(n).dmin,500), Linemarkertypes{n}, 'Linewidth', 0.8,'Color','black')
        end
            ylabel(sprintf('Probability of mortality rate exceeding 500 per million'),'FontSize',12,'FontWeight','bold') 
        subplot(1,2,2)
        
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Estimated_Bounds_Model(n).alpha',Estimated_Bounds_Model(n).dmax,Estimated_Bounds_Model(n).dmin,750), Linemarkertypes{n}, 'Linewidth', 0.8,'Color','black')
        end
         legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'})
        ylabel(sprintf('Probability of mortality rate exceeding 750 per million'),'FontSize',12,'FontWeight','bold') 

        set (figure(6), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(6);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Appendix_Figure_6.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Appendix_Figure_6.emf','BackgroundColor','none')
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 7  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 figure(7)
        rng(1001)
        Simulation = simulate_bpareto(1000000,Theoretical_Bounds_Model(1).alpha',Theoretical_Bounds_Model(1).dmax,Theoretical_Bounds_Model(1).dmin);
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
        he = plot(median(Influenza_UK(26:end,2:end)','omitnan'),'-', 'Linewidth', 1.25, 'Color',[230, 33, 11]/sum([230, 33, 11]))
        ylabel('Mortality rate (per million)','FontSize',12,'FontWeight','bold')
        xlim([0,31])
        xticks([1 6 11 16 21 26 31])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950'}) 
        legend([hc(2:end)  he hd], 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','Median (cities)', 'Median (model)')
        set (figure(7), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(7);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Appendix_Figure_7.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Appendix_Figure_7.emf','BackgroundColor','none')
       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 8  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         figure(8)
        subplot(1,2,1)
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Theoretical_Bounds_Model(n).alpha',Theoretical_Bounds_Model(n).dmax,Theoretical_Bounds_Model(n).dmin,500), Linemarkertypes{n}, 'Linewidth', 0.8,'Color','black')
        end
        ylabel(sprintf('Probability of mortality rate exceeding 500 per million'),'FontSize',12,'FontWeight','bold') 
        subplot(1,2,2)
        
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Theoretical_Bounds_Model(n).alpha',Theoretical_Bounds_Model(n).dmax,Theoretical_Bounds_Model(n).dmin,1000), Linemarkertypes{n}, 'Linewidth', 0.8,'Color','black')
        end
         legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'})
        ylabel(sprintf('Probability of mortality rate exceeding 1,000 per million'),'FontSize',12,'FontWeight','bold')

        set (figure(8), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(8);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Appendix_Figure_8.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Appendix_Figure_8.emf','BackgroundColor','none')
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 9  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 figure(9)
        rng(1001)
        Simulation = [simulate_weibull(1000000,Weibull_Model(1).w')]*10;
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
        he = plot(median(Influenza_UK(26:end,2:end)','omitnan'),'-', 'Linewidth', 1.25, 'Color',[230, 33, 11]/sum([230, 33, 11]))
        ylabel('Mortality rate (per million)','FontSize',12,'FontWeight','bold')
        xlim([0,31])
        xticks([1 6 11 16 21 26 31])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950'}) 
        legend([hc(2:end)  he hd], 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','Median (cities)', 'Median (model)')
        set (figure(9), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(9);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Appendix_Figure_9.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Appendix_Figure_9.emf','BackgroundColor','none')
       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 10  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         figure(10)
        subplot(1,2,1)
        for n=2:9
            hold on
            plot(years(26:end), weibull_outbreakprob(Weibull_Model(n).w,50), Linemarkertypes{n}, 'Linewidth', 0.8,'Color','black')
        end
        ylabel(sprintf('Probability of mortality rate exceeding 500 per million'),'FontSize',12,'FontWeight','bold') 
        subplot(1,2,2)
        
        for n=2:9
            hold on
            plot(years(26:end), weibull_outbreakprob(Weibull_Model(n).w,100), Linemarkertypes{n}, 'Linewidth', 0.8,'Color','black')
        end
         legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'})
        ylabel(sprintf('Probability of mortality rate exceeding 1,000 per million'),'FontSize',12,'FontWeight','bold') 

        set (figure(10), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(10);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Appendix_Figure_10.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Appendix_Figure_10.emf','BackgroundColor','none')
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 11  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     figure(11)
        subplot(2,2,1)
       [f, fx,bw] = ksdensity(exp(Parms(:,1)));
       plot(fx,f,'Color', 'black')
        for b=1:10
            hold on
            plot(exp(Parms(b,1)),0.3, Markertypes{b},'Color', 'black')
        end
        ylabel('\lambda','FontSize',12,'FontWeight','bold')
        subplot(2,2,2)
        [f, fx,bw] =ksdensity(exp(Parms(:,2)));
        plot(fx,f,'Color', 'black')
        for b=1:10
            hold on
           ha(b) = plot(exp(Parms(b,2)),0.0001, Markertypes{b},'Color', 'black')
        end
        ylabel('\eta_{0}','FontSize',12,'FontWeight','bold')
         legend(ha(:),{ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield', 'US', 'England & Wales'})
        subplot(2,2,3)
        [f, fx,bw]=ksdensity((Parms(:,1)));
        plot(fx,f,'Color', 'black')
        for b=1:10
            hold on
            plot((Parms(b,1)),0.05, Markertypes{b},'Color', 'black')
        end
        ylabel('log(\lambda)','FontSize',12,'FontWeight','bold')
        subplot(2,2,4)
        [f, fx,bw]=ksdensity((Parms(:,2)));
        plot(fx,f,'Color', 'black')
        for b=1:10
            hold on
            plot((Parms(b,2)),0.01, Markertypes{b},'Color', 'black')
        end
        ylabel('log(\eta_{0})','FontSize',12,'FontWeight','bold')
       
        set (figure(11), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(11);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Appendix_Figure_11.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Appendix_Figure_11.emf','BackgroundColor','none')
        
