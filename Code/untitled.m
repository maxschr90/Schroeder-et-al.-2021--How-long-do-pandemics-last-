       
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 11 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure(13)
       pa = subplot(2,2,1)
        plot(Influenza_EW(12:52,1), weibull_outbreakprob(Weibull_Model(10).w',Base_Model(10).dmax/3*2/10),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(12:52,1), weibull_outbreakprob(Weibull_Model(10).w',Base_Model(10).dmax/2/10),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(12:52,1), weibull_outbreakprob(Weibull_Model(10).w',Base_Model(10).dmax/3/10),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        legend('2/3 of peak','1/2 of peak','1/3 of peak')
        legend boxoff
        xlim([1849,1890])
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
        
        plot(Influenza_EW(56:80,1), weibull_outbreakprob(Weibull_Model(11).w',Base_Model(11).dmax/3*2/10),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(56:80,1), weibull_outbreakprob(Weibull_Model(11).w',Base_Model(11).dmax/2/10),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(56:80,1), weibull_outbreakprob(Weibull_Model(11).w',Base_Model(11).dmax/3/10),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

        xlim([1891,1918])
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

        plot(Influenza_EW(83:119,1), weibull_outbreakprob(Weibull_Model(12).w',Base_Model(12).dmax/3*2/10),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(83:119,1), weibull_outbreakprob(Weibull_Model(12).w',Base_Model(12).dmax/2/10),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(83:119,1), weibull_outbreakprob(Weibull_Model(12).w',Base_Model(12).dmax/3/10),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

        xlim([1919,1957])
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
        plot(Influenza_EW(134:end,1), weibull_outbreakprob(Weibull_Model(14).w',Base_Model(14).dmax/3*2/10),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(134:end,1), weibull_outbreakprob(Weibull_Model(14).w',Base_Model(14).dmax/2/10),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(134:end,1), weibull_outbreakprob(Weibull_Model(14).w',Base_Model(14).dmax/3/10),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

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
            
            h = figure(13);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 20];
        exportgraphics(h,'../Figures/SI_Figure_B-11.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-11.emf','BackgroundColor','none','Resolution', 900)      
        