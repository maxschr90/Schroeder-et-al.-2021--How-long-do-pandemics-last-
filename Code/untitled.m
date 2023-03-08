%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Presentation Figures  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
close all
load('Fitted_Models_v1')
Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure(1)
    for b = 1:8
        subplot(5,2,b)
        plot(years,Influenza_Cities(:,b+1),'.-',  'Linewidth', 0.5, 'Color','red', 'Markersize', 6 ,'MarkerEdgeColor','red')
        ylim([0,max(Influenza_Cities(:,b+1))*1.05])
        yticks([0,1000,round(max(Influenza_Cities(:,b+1)),0)])
        xticks([])
        xlim([1895,1956])
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title(citynames(b),'FontSize',8,'FontWeight','bold');
        box off
    end
        
        subplot(5,2,b+1)
        plot(Influenza_EW(58:119,1),Influenza_EW(58:119,2),'.-', 'Linewidth', 0.5, 'Color','red', 'Markersize',6  ,'MarkerEdgeColor','red')
        ylim([0,max(Influenza_EW(58:119,2))*1.05])
        yticks([0,1000,round(max(Influenza_EW(58:119,2)),0)])
        xticks([1900:10:1950])
        xtickangle(0)
        xlim([1895,1956])
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title('England & Wales','FontSize',8,'FontWeight','bold')
        box off
        subplot(5,2,b+2)
        plot(Influenza_US(:,1),Influenza_US(:,2),'.-',  'Linewidth', 0.5, 'Color','red', 'Markersize', 6  ,'MarkerEdgeColor','red')
        ylim([0,max(Influenza_US(:,2))*1.05])
        yticks([0,1000,round(max(Influenza_US(:,2)),0)])
        xticks([1900:10:1950])
        xlim([1895,1956])
        xtickangle(0)
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title('United States','FontSize',8,'FontWeight','bold')
        box off


        h = figure(1);
        h.Units='centimeters';
        h.OuterPosition=[0 0 28 12];
        exportgraphics(figure(1),'../Presentation/Figure_1.emf','BackgroundColor','none','Resolution', 900)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
plot(Influenza_EW(1:end,1),Influenza_EW(1:end,2),'.-', 'Linewidth', 0.5, 'Color','red', 'Markersize',6  ,'MarkerEdgeColor','red')
hold on
patch([1846.5,1846.5, 1888.5, 1888.5],[0 max(ylim) max(ylim) 0], [0.9 0.9 0.9],'EdgeColor','none')
patch([1888.5,1888.5, 1917.5, 1917.5],[0 max(ylim) max(ylim) 0], [0.8 0.8 0.8],'EdgeColor','none')
patch([1917.5,1917.5, 1956.5, 1956.5],[0 max(ylim) max(ylim) 0], [0.9 0.9 0.9],'EdgeColor','none')
patch([1956.5,1956.5, 1967.5, 1967.5],[0 max(ylim) max(ylim) 0], [0.8 0.8 0.8],'EdgeColor','none')
patch([1967.5,1967.5, 2000.5, 2000.5],[0 max(ylim) max(ylim) 0], [0.9 0.9 0.9],'EdgeColor','none')

plot(Influenza_EW(1:end,1),Influenza_EW(1:end,2),'.-', 'Linewidth', 0.5, 'Color','red', 'Markersize',6  ,'MarkerEdgeColor','red')

ylabel('Mortality rate (deaths/million)')
box off
xticks([1840:20:2000])
xtickangle(0)
xlim([1838,2000])
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',8)        
% aa = get(gca,'YTickLabel');
% set(gca,'YTickLabel',aa,'fontsize',8) 

axes('Position',[.65 .6 .25 .25])
box on
plot(Influenza_EW(118:end,1),Influenza_EW(118:end,2),'.-', 'Linewidth', 0.5, 'Color','red', 'Markersize',6  ,'MarkerEdgeColor','red')
yticks([0,100,200])

xticks([1950:10:2000])
xtickangle(0)
xlim([1955,2000])
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',6)        
% aa = get(gca,'YTickLabel');
% set(gca,'YTickLabel',aa,'fontsize',6) 

axes('Position',[.2 .6 .25 .25])
box on
plot(Influenza_EW(1:80,1),Influenza_EW(1:80,2),'.-', 'Linewidth', 0.5, 'Color','red', 'Markersize',6  ,'MarkerEdgeColor','red')
yticks([0,250,500])

xticks([1830:20:2000])
xtickangle(0)
xlim([1838,1917])
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',6)        
% aa = get(gca,'YTickLabel');
% set(gca,'YTickLabel',aa,'fontsize',6) 
h = figure(2);

            %set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 28 12];
        exportgraphics(h,'../Presentation/Figure_2.emf','BackgroundColor','none','Resolution', 900)   



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

load("MC_output_v1.mat")
close all
figure(4)
pa=subplot(3,2,1)    
    C = theta_hat(:,:,6);
    trueparms = Estimates(6,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,0.275,50)],[linspace(0.5,7,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")
% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'London','1918-19'},'FontSize',8,'FontWeight','bold')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pb=subplot(3,2,2)    
    C = theta_hat(:,:,4);
    trueparms = Estimates(4,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,0.4,50)],[linspace(0.25,12,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")
% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Glasgow','1918-19'},'FontSize',8,'FontWeight','bold')
% ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pc=subplot(3,2,3)    
    C = theta_hat(:,:,5);
    trueparms = Estimates(5,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.,0.6,50)],[linspace(0,17.5,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Liverpool','1918-19'},'FontSize',8,'FontWeight','bold')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off


pd=subplot(3,2,4)    
    C = theta_hat(:,:,12);
    trueparms = Estimates(12,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0,0.25,50)],[linspace(0.,7.5,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'England & Wales', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
% ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pe=subplot(3,2,5)    
    C = theta_hat(:,:,10);
    trueparms = Estimates(10,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0,0.5,50)],[linspace(0.,14,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'England & Wales', '1847-48'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
xlabel('\lambda')
box off


pf=subplot(3,2,6)    
    C = theta_hat(:,:,9);
    trueparms = Estimates(9,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.,0.6,50)],[linspace(0,16,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'United States','1918-19'},'FontSize',8,'FontWeight','bold')
% ylabel('\eta_{0}')
xlabel('\lambda')
box off


           
h = figure(4);
            %set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 12 20];
        exportgraphics(h,'../Presentation/Figure_4.emf','BackgroundColor','none','Resolution', 900)   


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(6)
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
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'},'FontSize',6, 'Location','best', 'NumColumns',2);
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
        plot(Influenza_EW(83:119,1),bpareto_outbreakprob(Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin,500), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_EW(83:119,1),bpareto_outbreakprob(Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin,1000), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('500 deaths/million', '1000 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
        leg.ItemTokenSize = [9,4.5];

        legend boxoff
        title(leg,'England & Wales (1918-19)','FontSize',8);
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
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

        pd = subplot(2,2,4)
        plot(Influenza_US(21:end,1),bpareto_outbreakprob(Base_Model(9).alpha',Base_Model(9).dmax,Base_Model(9).dmin,500), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_US(21:end,1),bpareto_outbreakprob(Base_Model(9).alpha',Base_Model(9).dmax,Base_Model(9).dmin,1000), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('500 deaths/million', '1000 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
        leg.ItemTokenSize = [9,4.5];
        legend boxoff
        title(leg,'United States (1918-19)','FontSize',8);
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
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


            
            h = figure(6);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 28 12];
        exportgraphics(h,'../Presentation/Figure_6.emf','BackgroundColor','none','Resolution', 900)   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 7  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    figure(7)
       pa = subplot(2,2,1)
        plot(Influenza_EW(12:52,1), bpareto_outbreakprob(Base_Model(10).alpha',Base_Model(10).dmax,Base_Model(10).dmin,Base_Model(10).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(12:52,1), bpareto_outbreakprob(Base_Model(10).alpha',Base_Model(10).dmax,Base_Model(10).dmin,Base_Model(10).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(12:52,1), bpareto_outbreakprob(Base_Model(10).alpha',Base_Model(10).dmax,Base_Model(10).dmin,Base_Model(10).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        leg=legend('2/3 of peak','1/2 of peak','1/3 of peak')
        leg.ItemTokenSize = [9,4.5];

        legend boxoff
        xlim([1848,1890])
        xticks([1850:5:1890])
        xtickangle(0)
        yticks([0:0.05:0.4])
        ylim([0,0.25])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title('England & Wales 1847-48')
        box off
        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 

        pb = subplot(2,2,2)
        
        plot(Influenza_EW(55:80,1), bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,Base_Model(11).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(55:80,1), bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,Base_Model(11).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(55:80,1), bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,Base_Model(11).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

        xlim([1891,1918])
        xticks([1890:5:1915])
        xticklabels([1890:5:1915])
        xtickangle(0)
        yticks([0:0.1:0.7])
        ylim([0,0.7])
        yticklabels({'0','0.1',  '0.2', '0.3','0.4','0.5','0.6','0.7'})
        b = get(gca,'XTickLabel');
        set(gca,'XTickLabel',b,'fontsize',8)        
        bb = get(gca,'YTickLabel');
        set(gca,'YTickLabel',bb,'fontsize',8) 
        title('England & Wales 1889-90')
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 

        pc = subplot(2,2,3)

        plot(Influenza_EW(83:119,1), bpareto_outbreakprob(Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin,Base_Model(12).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(83:119,1), bpareto_outbreakprob(Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin,Base_Model(12).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(83:119,1), bpareto_outbreakprob(Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin,Base_Model(12).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

        xlim([1919,1957])
        xticks([1920:5:1955])
        xtickangle(0)
        yticks([0:0.05:0.4])
        ylim([0,0.25])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title('England & Wales 1918-19')
        box off
        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 

        pd = subplot(2,2,4)
        plot(Influenza_EW(134:end,1), bpareto_outbreakprob(Base_Model(14).alpha',Base_Model(14).dmax,Base_Model(14).dmin,Base_Model(14).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        hold on 
        plot(Influenza_EW(134:end,1), bpareto_outbreakprob(Base_Model(14).alpha',Base_Model(14).dmax,Base_Model(14).dmin,Base_Model(14).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        plot(Influenza_EW(134:end,1), bpareto_outbreakprob(Base_Model(14).alpha',Base_Model(14).dmax,Base_Model(14).dmin,Base_Model(14).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

        xlim([1970,2001])
        xticks([1970:5:2000])
        xtickangle(0)
        yticks([0:0.05:0.4])
        ylim([0,0.25])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title('England & Wales 1968-70')
        box off
        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 

            
            h = figure(7);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 28 12];
        exportgraphics(h,'../Presentation/Figure_7.emf','BackgroundColor','none','Resolution', 900)   


