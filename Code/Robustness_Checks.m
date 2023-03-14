% %% ROBUSTNESS CHECKS %%
% 
% %%% 1. Estimate Base Model with 25% more influenza deaths
% Inf_Cities = Influenza_Cities*1.25;
% Inf_US = Influenza_US*1.25;
% Inf_EW = Influenza_EW*1.25;
% dmax_Cities = (max(Inf_Cities(24:end,2:end)));
% dmin_Cities = (min(Inf_Cities(24:end,2:end)));
% for n = 1:8
%     [Base_Model_robust_125(n)] = est_parms_bpareto(Inf_Cities(26:end,n+1),dmax_Cities(n),dmin_Cities(n), citynames(n));
% end
% dmax_US = max(Inf_US(19:end,2)');
% dmin_US = min(Inf_US(19:end,2)');
% [Base_Model_robust_125(n+1)] = est_parms_bpareto(Influenza_US(21:end,2),dmax_US,dmin_US, 'US');
% 
% dmax_EW_1848 = max(Inf_EW(10:52,2)');
% dmin_EW_1848 = min(Inf_EW(10:52,2)');
% [Base_Model_robust_125(n+2)] = est_parms_bpareto(Inf_EW(12:52,2),dmax_EW_1848,dmin_EW_1848, 'England&Wales 1848');
% 
% dmax_EW_1890 = max(Inf_EW(53:80,2)');
% dmin_EW_1890 = min(Inf_EW(53:80,2)');
% [Base_Model_robust_125(n+3)] = est_parms_bpareto(Inf_EW(55:80,2),dmax_EW_1890,dmin_EW_1890, 'England&Wales 1890');
% 
% dmax_EW_1918 = max(Inf_EW(81:119,2)');
% dmin_EW_1918 = min(Inf_EW(81:119,2)');
% [Base_Model_robust_125(n+4)] = est_parms_bpareto(Inf_EW(83:119,2),dmax_EW_1918,dmin_EW_1918, 'England&Wales 1918');
% 
% dmax_EW_1957 = max(Inf_EW(120:130,2)');
% dmin_EW_1957 = min(Inf_EW(120:130,2)');
% [Base_Model_robust_125(n+5)] = est_parms_bpareto(Inf_EW(123:130,2),dmax_EW_1957,dmin_EW_1957, 'England&Wales 1957');
% 
% dmax_EW_1968 = max(Inf_EW(131:end,2)');
% dmin_EW_1968 = min(Inf_EW(131:end,2)');
% [Base_Model_robust_125(n+6)] = est_parms_bpareto(Inf_EW(134:end,2),dmax_EW_1968,dmin_EW_1968, 'England&Wales 1968');

%%% 2. Estimate Base Model with 25% fewer influenza deaths
Inf_Cities = Influenza_Cities;
Inf_Cities(26:end,:) = Inf_Cities(26:end,:)*0.5;
% Inf_US = Influenza_US*0.5;
% Inf_EW = Influenza_EW*0.5;
dmax_Cities = (max(Inf_Cities(24:end,2:end)));
dmin_Cities = (min(Inf_Cities(24:end,2:end)));
for n = 1:8
    [Base_Model_robust_50(n)] = est_parms_bpareto(Inf_Cities(26:end,n+1),dmax_Cities(n),dmin_Cities(n), citynames(n));
end
% dmax_US = max(Inf_US(19:end,2)');
% dmin_US = min(Inf_US(19:end,2)');
% [Base_Model_robust_50(n+1)] = est_parms_bpareto(Influenza_US(21:end,2),dmax_US,dmin_US, 'US');
% 
% dmax_EW_1848 = max(Inf_EW(10:52,2)');
% dmin_EW_1848 = min(Inf_EW(10:52,2)');
% [Base_Model_robust_50(n+2)] = est_parms_bpareto(Inf_EW(12:52,2),dmax_EW_1848,dmin_EW_1848, 'England&Wales 1848');
% 
% dmax_EW_1890 = max(Inf_EW(53:80,2)');
% dmin_EW_1890 = min(Inf_EW(53:80,2)');
% [Base_Model_robust_50(n+3)] = est_parms_bpareto(Inf_EW(55:80,2),dmax_EW_1890,dmin_EW_1890, 'England&Wales 1890');
% 
% dmax_EW_1918 = max(Inf_EW(81:119,2)');
% dmin_EW_1918 = min(Inf_EW(81:119,2)');
% [Base_Model_robust_50(n+4)] = est_parms_bpareto(Inf_EW(83:119,2),dmax_EW_1918,dmin_EW_1918, 'England&Wales 1918');
% 
% dmax_EW_1957 = max(Inf_EW(120:130,2)');
% dmin_EW_1957 = min(Inf_EW(120:130,2)');
% [Base_Model_robust_50(n+5)] = est_parms_bpareto(Inf_EW(123:130,2),dmax_EW_1957,dmin_EW_1957, 'England&Wales 1957');
% 
% dmax_EW_1968 = max(Inf_EW(131:end,2)');
% dmin_EW_1968 = min(Inf_EW(131:end,2)');
% [Base_Model_robust_50(n+6)] = est_parms_bpareto(Inf_EW(134:end,2),dmax_EW_1968,dmin_EW_1968, 'England&Wales 1968');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1)
        pa = subplot(2,2,1)
        for n=1:8
            hold on
            plot(years(26:end), bpareto_outbreakprob(Base_Model(n).alpha',Base_Model(n).dmax,Base_Model(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
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

        pb = subplot(2,2,2)
%         p = get(pb, 'position');
%         p(1) = p(1) + 0.03;
%         p(3) = p(3) - 0.03;
%         set(pb, 'position', p);        
        for n=1:8
            hold on
            plot(years(26:end), bpareto_outbreakprob(Base_Model(n).alpha',Base_Model(n).dmax,Base_Model(n).dmin,1000), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        ylabel(sprintf('Prob(>1,000 deaths/million)'),'fontsize',8) 
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'},'FontSize',6, 'Location','best', 'NumColumns',1);
        leg.ItemTokenSize = [9,4.5];
        legend boxoff
        title(leg,'UK Cities (1918-19)','FontSize',8);
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

        pc = subplot(2,2,3)
                for n=1:8
            hold on
            plot(years(26:end), bpareto_outbreakprob(Base_Model_robust_50(n).alpha',Base_Model_robust_50(n).dmax,Base_Model_robust_50(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
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

        pd = subplot(2,2,4)
%         p = get(pb, 'position');
%         p(1) = p(1) + 0.03;
%         p(3) = p(3) - 0.03;
%         set(pb, 'position', p);        
        for n=1:8
            hold on
            plot(years(26:end), bpareto_outbreakprob(Base_Model_robust_50(n).alpha',Base_Model_robust_50(n).dmax,Base_Model_robust_50(n).dmin,1000), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        ylabel(sprintf('Prob(>1,000 deaths/million)'),'fontsize',8) 
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'},'FontSize',6, 'Location','best', 'NumColumns',1);
        leg.ItemTokenSize = [9,4.5];
        legend boxoff
        title(leg,'UK Cities (1918-19)','FontSize',8);
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

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown') 

            
            h = figure(1);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 20];
        exportgraphics(h,'../Figures/SI_Figure_X.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_X.emf','BackgroundColor','none','Resolution', 900)   