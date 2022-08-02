clear
clc
close all
load('Fitted_Models_v1.mat')

figure(1)
hold on
plot(Influenza_EW_Gender(:,1,1),Influenza_EW_Gender(:,2,1),'Color','red')
plot(Influenza_EW_Gender(:,1,1),Influenza_EW_Gender(:,2,2),'-o','Color','blue')
plot(Influenza_EW_Gender(:,1,1),Influenza_EW_Gender(:,2,3),'-*','Color','green')
legend('Total', 'Males', 'Females')

axes('Position',[.65 .4 .25 .25])
box on
hold on
plot(Influenza_EW_Gender(55:end,1,1),Influenza_EW_Gender(55:end,2,1),'Color','red')
plot(Influenza_EW_Gender(55:end,1,1),Influenza_EW_Gender(55:end,2,2),'-o','Color','blue')
plot(Influenza_EW_Gender(55:end,1,1),Influenza_EW_Gender(55:end,2,3),'-*','Color','green')

        h = figure(1);
        h.Units='centimeters';
        h.OuterPosition=[0 0 18 15];
        exportgraphics(figure(1),'../Figures/Fig_Gender_a.pdf','BackgroundColor','none','Resolution', 900)

Linemarkertypes = {'-o','-*','-','-o','-*','-'};

figure(2)
        pa = subplot(2,2,1)
        for n=1:3
            hold on
            plot([1920:1956], bpareto_outbreakprob(Base_Model_Gender(n).alpha',Base_Model_Gender(n).dmax,Base_Model_Gender(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        ylabel(sprintf('Prob(>500 deaths/million)'),'fontsize',8) 
        leg = legend({ 'Males', 'Females', 'Total'},'FontSize',6, 'Location','best', 'NumColumns',1);
%         leg.ItemTokenSize = [3,1.5];
        legend boxoff
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
        for n=1:3
            hold on
            plot([1920:1956], bpareto_outbreakprob(Base_Model_Gender(n).alpha',Base_Model_Gender(n).dmax,Base_Model_Gender(n).dmin,1000), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
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
        yticks([0:0.05:0.4])
        ylim([0,0.45])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})

pc = subplot(2,2,3)
        for n=4:6
            hold on
            plot([1971:2000], bpareto_outbreakprob(Base_Model_Gender(n).alpha',Base_Model_Gender(n).dmax,Base_Model_Gender(n).dmin,50), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        ylabel(sprintf('Prob(>50 deaths/million)'),'fontsize',8) 
%         leg.ItemTokenSize = [3,1.5];
        xlim([1970,2000])
        xticks([1970:5:2000])
        xticklabels({'1970','1975', '1980','1985','1990','1995','2000'})
        xtickangle(0)
        yticks([0:0.05:0.4])
        ylim([0,0.3])
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
        for n=4:6
            hold on
            plot([1971:2000], bpareto_outbreakprob(Base_Model_Gender(n).alpha',Base_Model_Gender(n).dmax,Base_Model_Gender(n).dmin,100), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        ylabel(sprintf('Prob(>100 deaths/million)'),'fontsize',8) 
         a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1970,2000])
        xticks([1970:5:2000])
        xticklabels({'1970','1975', '1980','1985','1990','1995','2000'})
        xtickangle(0)
        yticks([0:0.05:0.4])
        ylim([0,0.125])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown') 

                h = figure(2);
        h.Units='centimeters';
        h.OuterPosition=[0 0 18 15];
        exportgraphics(figure(2),'../Figures/Fig_Gender_b.pdf','BackgroundColor','none','Resolution', 900)