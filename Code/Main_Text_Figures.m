%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Main Paper Figures  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
close all
load('Fitted_Models_v2')
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
        yticks([0,1000,round(max(Influenza_UK(:,b)),0)])
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
        yticks([0,1000,round(max(Influenza_US(1,:)),0)])
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
        yticks([0,250,round(max(Influenza_RUS(1,1:80)),0)])
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
  

load("MC_save_v2.mat")

figure(2)
pa=subplot(2,2,1)    
    C = theta_hat(:,:,6);
    trueparms = Estimates(6,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,0.2,50)],[linspace(0.5,7,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap(autumn(10))
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',5)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',5)
title('London')
ylabel('\eta_{0}')
xlabel('\lambda')

pb=subplot(2,2,2)    
    C = theta_hat(:,:,4);
    trueparms = Estimates(4,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,0.4,50)],[linspace(0.25,12,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap(autumn(10))
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',5)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',5)
title('Glasgow')
ylabel('\eta_{0}')
xlabel('\lambda')

pc=subplot(2,2,3)    
    C = theta_hat(:,:,9);
    trueparms = Estimates(9,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.,0.6,50)],[linspace(0,16,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap(autumn(10))
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',5)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',5)
title('United States')
ylabel('\eta_{0}')
xlabel('\lambda')

pd=subplot(2,2,4)    
    C = theta_hat(:,:,10);
    trueparms = Estimates(10,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0,0.5,50)],[linspace(0.,14,50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap(autumn(10))
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',5)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',5)
title('England & Wales 1847-48')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
xlabel('\lambda')
AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown') 
           
h = figure(2);
            %set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 25];
        exportgraphics(h,'../Figures/Figure_2.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/Figure_2.emf','BackgroundColor','none','Resolution', 900)   


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3)
pa=subplot(2,2,1)
            InvCdf = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(7).alpha',Base_Model(7).dmax,Base_Model(7).dmin);
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(1,:), InvCdf(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(2,:), InvCdf(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hf = plot((Influenza_UK(26:end,7)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4.5 )
            xlim([0,37])
            ylim([0,max(InvCdf(5,:)*1.05)])
            xticks([1 6 11 16 21 26 31 36])
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            yticks([0,(round(max(Influenza_UK(26:end,7)),0)),round(max(InvCdf(5,:)))])
            ax = gca;
            c = ax.FontSize;
            ax.FontSize =8;
            ax.XTickLabelRotation = 0;
            title('London','FontSize',11)
            box off

pb=subplot(2,2,2)
            InvCdf = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(5).alpha',Base_Model(5).dmax,Base_Model(5).dmin);
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(1,:), InvCdf(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(2,:), InvCdf(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            hf = plot((Influenza_UK(26:end,5)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4.5 )
            xlim([0,37])
            ylim([0,max(InvCdf(5,:)*1.05)])
            xticks([1 6 11 16 21 26 31 36])
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            yticks([0,(round(max(Influenza_UK(26:end,5)),0)),round(max(InvCdf(5,:)))])
            ax = gca;
            c = ax.FontSize;
            ax.FontSize =8;
            ax.XTickLabelRotation = 0;
            title('Glasgow','FontSize',11)
            box off
pc=subplot(2,2,3)

            InvCdf_US(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(10).alpha',Base_Model(10).dmax,Base_Model(10).dmin);
            [ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(1,:), InvCdf_US(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(2,:), InvCdf_US(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on

            hf = plot((Influenza_US(1,21:end)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4.5)
            xlim([0,37])
            ylim([0,max(InvCdf_US(5,:)*1.05)])

            xticks([1 6 11 16 21 26 31 36])
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            yticks([0,round(max(Influenza_US(1,21:end)),0),round(max(InvCdf_US(5,:)))])
            ax = gca;
            c = ax.FontSize;
            ax.FontSize =8;
            ax.XTickLabelRotation = 0;
            title('United States','FontSize',11)
            box off

pd=subplot(2,2,4)
            InvCdf_RUS_1848(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin);
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1848,2), InvCdf_RUS_1848(1,:), InvCdf_RUS_1848(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf_RUS_1848,2), InvCdf_RUS_1848(2,:), InvCdf_RUS_1848(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
 
            hf = plot((Influenza_RUS(1,12:52)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 4.5)
            xlim([0,41])
            ylim([0,max(max(InvCdf_RUS_1848(5,:),Influenza_RUS(1,12:52)))*1.05])

            xticks([1 6 11 16 21 26 31 36 41])
            xticklabels({'1849','1854', '1859','1864','1869','1874','1879','1884','1889'}) 
            yticks([0,round(max(Influenza_RUS(1,12:52)),0),round(max(InvCdf_RUS_1848(5,:)))])
            ax = gca;
            c = ax.FontSize;
            ax.FontSize =8;
            ax.XTickLabelRotation = 0;
            title('England & Wales 1847-48','FontSize',11)
            box off
            
            AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown') 

            h = figure(3);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 25];
        exportgraphics(h,'../Figures/Figure_3.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/Figure_3.emf','BackgroundColor','none','Resolution', 900)   
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure(4)
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
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
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
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.4])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})

        pc = subplot(2,4,[5 6])
        plot(Influenza_RUS(2,12:52),bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,100), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,12:52),bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,200), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,12:52),bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,300), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('100 deaths/million', '200 deaths/million', '300 deaths/million','FontSize',6, 'location', 'best', 'NumColumns' ,1)
        legend boxoff
        title(leg,'England & Wales (1847-48)','FontSize',8);
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1848,1889])
        xticks([1849:5:1889])
        xticklabels({'1849','1854', '1859','1864','1869','1874','1879','1884','1889'}) 
        xtickangle(0)
        yticks([0:0.05:0.4])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})

        pd = subplot(2,4,[7 8])
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin,300), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin,400), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin,500), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('300 deaths/million', '400 deaths/million', '500 deaths/million','FontSize',6, 'location', 'best', 'NumColumns' ,1)
        legend boxoff
        title(leg,{'England & Wales (1889-90)'},'FontSize',8);
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1891,1917])
        xticks([1892:5:1917])
        xticklabels({'1892','1897', '1902','1907','1912','1917'})
        xtickangle(0)

        yticks([0:0.05:0.4])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown') 

            
            h = figure(4);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 25];
        exportgraphics(h,'../Figures/Figure_4.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/Figure_4.emf','BackgroundColor','none','Resolution', 900)   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 5  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Monte Carlo to simulate Model Uncertainty
t = [1:31]'-1;
Covid_Sim = [];
parfor i=1:size(Rand_Parms,1)
    alpha_sim(i,:) =  1./(exp(Rand_Parms(i,2))*exp(-t*Rand_Parms(i,1)));
    temp_1(i,:) = bpareto_outbreakprob(alpha_sim(i,:),1858,24,500)';
    temp_2(i,:) = bpareto_outbreakprob(alpha_sim(i,:),1858,24,1000)';
end
    Covid_Sim(:,:,1) =temp_1;
    Covid_Sim(:,:,2) =temp_2;
    figure(5)
        pa=subplot(1,2,1)
         hold on
        [hc,~,~] = shadedplot(1:size(Covid_Sim(:,:,1),2), prctile([Covid_Sim(:,:,1)],10), prctile([Covid_Sim(:,:,1)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        [hb,~,~] = shadedplot(1:size(Covid_Sim(:,:,1),2), prctile([Covid_Sim(:,:,1)],25), prctile([Covid_Sim(:,:,1)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
        hold on
        ha = plot(median(Covid_Sim(:,:,1),'omitnan'),'-', 'Linewidth', 1,'Color','black')
        xticks([1 6 11 16 21 26 31])
        xticklabels({'2022','2027', '2032','2037','2042','2047','2052'}) 
        ylabel(sprintf('Probability of mortality rate exceeding 500 per million'),'FontSize',12,'FontWeight','bold')

        pb=subplot(1,2,2)
        hold on
        [hc,~,~] = shadedplot(1:size(Covid_Sim(:,:,2),2), prctile([Covid_Sim(:,:,2)],10), prctile([Covid_Sim(:,:,2)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        [hb,~,~] = shadedplot(1:size(Covid_Sim(:,:,2),2), prctile([Covid_Sim(:,:,2)],25), prctile([Covid_Sim(:,:,2)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
        hold on
        ha = plot(median(Covid_Sim(:,:,2),'omitnan'),'-', 'Linewidth', 1,'Color','black')

        xticks([1 6 11 16 21 26 31])
        xticklabels({'2022','2027', '2032','2037','2042','2047','2052'}) 
        ylabel(sprintf('Probability of mortality rate exceeding 1,000 per million'),'FontSize',12,'FontWeight','bold')
        AddLetters2Plots({pa, pb},{'a','b'}, 'HShift', -0.05, 'VShift', -0.035, 'Direction', 'TopDown') 

            
            h = figure(5);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 25];
        exportgraphics(h,'../Figures/Figure_5.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/Figure_5.emf','BackgroundColor','none','Resolution', 900)   
