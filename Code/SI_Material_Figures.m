%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Appendix  Figures  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
close all
load('Fitted_Models_v1')
load("MC_save_v2.mat")


Linemarkertypes = {'-p','-x','-h','-s','-d','-*','-v','-^','-+','-o'};
Markertypes = {'p','x','h','s','d','*','v','^','+','o','>'};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 1 A  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Pneumonia_UK = table2array(Pneumonia);
figure(1)
    for b = 1:size(Pneumonia_UK,2)
        subplot(4,2,b)
        plot(years,Pneumonia_UK(:,b),'.-',  'Linewidth', 0.5, 'Color','red', 'Markersize', 6 ,'MarkerEdgeColor','red')
        ylim([0,max(Pneumonia_UK(:,b))*1.05])
        yticks([0,1000,round(max(Pneumonia_UK(:,b)),0)])
        xlim([1895,1950])
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title(citynames(b+1),'FontSize',8,'FontWeight','bold');
        box off
    end
        AddLetters2Plots(figure(1), {'a', 'c', 'e', 'g', 'i', 'b', 'd', 'f'}, 'HShift', -0.07, 'VShift', -0.075, 'Direction', 'TopDown','fontsize',8) 

                    h = figure(1);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 14 15];
        exportgraphics(figure(1),'../Figures/SI_Figure_A-1.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(figure(1),'../Figures/SI_Figure_A-1.emf','BackgroundColor','none','Resolution', 900)        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 2 A  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Bronchitis_UK = table2array(Bronchitis);
figure(2)
    for b = 1:size(Bronchitis_UK,2)
        subplot(4,2,b)
        plot(years,Bronchitis_UK(:,b),'.-',  'Linewidth', 0.5, 'Color','red', 'Markersize', 6 ,'MarkerEdgeColor','red')
        ylim([0,max(Bronchitis_UK(:,b))*1.05])
        yticks([0,1000,round(max(Bronchitis_UK(:,b)),0)])
        xlim([1895,1950])
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        title(citynames(b+1),'FontSize',8,'FontWeight','bold');
        box off
    end
        AddLetters2Plots(figure(2), {'a', 'c', 'e', 'g', 'i', 'b', 'd', 'f'}, 'HShift', -0.07, 'VShift', -0.075, 'Direction', 'TopDown','fontsize',8) 

            h = figure(2);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 14 15];
        exportgraphics(figure(2),'../Figures/SI_Figure_A-2.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(figure(2),'../Figures/SI_Figure_A-2.emf','BackgroundColor','none','Resolution', 900)        


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 1 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  

figure(3)
pa=subplot(4,2,1)    
    C = theta_hat(:,:,1);
    trueparms = Estimates(1,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")
% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Belfast','1918-19'},'FontSize',8,'FontWeight','bold')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pb=subplot(4,2,2)    
    C = theta_hat(:,:,2);
    trueparms = Estimates(2,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")
% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Birmingham','1918-19'},'FontSize',8,'FontWeight','bold')
% ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pc=subplot(4,2,3)    
    C = theta_hat(:,:,3);
    trueparms = Estimates(3,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Cardiff','1918-19'},'FontSize',8,'FontWeight','bold')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pd=subplot(4,2,4)    
    C = theta_hat(:,:,4);
    trueparms = Estimates(4,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
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

pe=subplot(4,2,5)    
    C = theta_hat(:,:,5);
    trueparms = Estimates(5,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Liverpool', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pf=subplot(4,2,6)    
    C = theta_hat(:,:,6);
    trueparms = Estimates(6,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'London', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
% ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pg=subplot(4,2,7)    
    C = theta_hat(:,:,7);
    trueparms = Estimates(7,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Manchester', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
xlabel('\lambda')
box off

pj=subplot(4,2,8)    
    C = theta_hat(:,:,8);
    trueparms = Estimates(8,1:2);
    [~, xi]= ksdensity(C(:,1));
    [~, yi]= ksdensity(C(:,2));
    [x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
    [A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Sheffield', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
xlabel('\lambda')
box off
AddLetters2Plots({pa, pb, pc, pd, pe, pf, pg, pj},{'a','b','c','d','e','f','g','h'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown') 
           
h = figure(3);
            %set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 25];
        exportgraphics(h,'../Figures/SI_Figure_B-1.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-1.emf','BackgroundColor','none','Resolution', 900)    
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 2 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for b = 2:size(Influenza_UK,2) 
    InvCdf(:,:,b) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b).alpha',Base_Model(b).dmax,Base_Model(b).dmin);
end
    InvCdf_US(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b+1).alpha',Base_Model(b+1).dmax,Base_Model(b+1).dmin);
    InvCdf_RUS_1848(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b+2).alpha',Base_Model(b+2).dmax,Base_Model(b+2).dmin);
    InvCdf_RUS_1890(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b+3).alpha',Base_Model(b+3).dmax,Base_Model(b+3).dmin);
    
figure(4)
        for b = 2:size(Influenza_UK,2)
            subplot((size(Influenza_UK,2)-1)/2,2,b-1)
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(1,:,b), InvCdf(5,:,b), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
            hold on
            [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(2,:,b), InvCdf(4,:,b), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
            hold on
            plot(InvCdf(3,:,b),'Color','black')
            hf = plot((Influenza_UK(26:end,b)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3 )
            xlim([0,37])
            ylim([0,max(InvCdf(5,:,b)*1.05)])
            xticks([1 6 11 16 21 26 31 36])
            xtickangle(0)
            xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
            yticks([0,(round(max(Influenza_UK(26:end,b)),0)),round(max(InvCdf(5,:,b)))])
            title({citynames{b},'1918-19'},'FontSize',8,'FontWeight','bold')
            box off
        end
        AddLetters2Plots(figure(4), {'a', 'b', 'c', 'd', 'e',  'f', 'g', 'h'}, 'HShift', -0.07, 'VShift', -0.07, 'Direction', 'TopDown','fontsize',8) 
        
            h = figure(4);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 25];
        exportgraphics(h,'../Figures/SI_Figure_B-2.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-2.emf','BackgroundColor','none','Resolution', 900)   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 3 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(5)
        pa = subplot(1,2,1)
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Common_Bounds_Model(n).alpha',Common_Bounds_Model(n).dmax,Common_Bounds_Model(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
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

        pb = subplot(1,2,2)
        p = get(pb, 'position');
        p(1) = p(1) + 0.03;
        p(3) = p(3) - 0.03;
        set(pb, 'position', p);        
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Common_Bounds_Model(n).alpha',Common_Bounds_Model(n).dmax,Common_Bounds_Model(n).dmin,1000), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
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
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'},'FontSize',8, 'Location','best', 'NumColumns',1);
%         leg.ItemTokenSize = [3,1.5];
        legend boxoff

        AddLetters2Plots({pa, pb},{'a','b'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown') 

            
            h = figure(5);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 10];
        exportgraphics(h,'../Figures/SI_Figure_B-3.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-3.emf','BackgroundColor','none','Resolution', 900)   

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 4 B %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(6)
        pa = subplot(2,4,[1 2])
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Theoretical_Bounds_Model(n).alpha',Theoretical_Bounds_Model(n).dmax,Theoretical_Bounds_Model(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Theoretical_Bounds_Model(n+1).alpha',Theoretical_Bounds_Model(n+1).dmax,Theoretical_Bounds_Model(n+1).dmin,500),  Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        ylabel(sprintf('Prob(>500 deaths/million)'),'fontsize',8) 
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield', 'US'},'FontSize',8, 'Location','best', 'NumColumns',1);
%         leg.ItemTokenSize = [3,1.5];
        legend boxoff
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.5])
        ylim([0,0.55])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})
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
            plot(years(26:end), bpareto_outbreakprob(Theoretical_Bounds_Model(n).alpha',Theoretical_Bounds_Model(n).dmax,Theoretical_Bounds_Model(n).dmin,1000), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Theoretical_Bounds_Model(n+1).alpha',Theoretical_Bounds_Model(n+1).dmax,Theoretical_Bounds_Model(n+1).dmin,1000), Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black' )
        ylabel(sprintf('Prob(>1,000 deaths/million)'),'fontsize',8) 
         a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.5])
        ylim([0,0.55])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

        pc = subplot(2,4,[5 6])
        plot(Influenza_RUS(2,12:52),bpareto_outbreakprob(Theoretical_Bounds_Model(11).alpha',Theoretical_Bounds_Model(11).dmax,Theoretical_Bounds_Model(11).dmin,100), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,12:52),bpareto_outbreakprob(Theoretical_Bounds_Model(11).alpha',Theoretical_Bounds_Model(11).dmax,Theoretical_Bounds_Model(11).dmin,200), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,12:52),bpareto_outbreakprob(Theoretical_Bounds_Model(11).alpha',Theoretical_Bounds_Model(11).dmax,Theoretical_Bounds_Model(11).dmin,300), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('100 deaths/million', '200 deaths/million', '300 deaths/million','FontSize',8, 'location', 'northeast', 'NumColumns' ,1)
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
        yticks([0:0.05:0.5])
        ylim([0,0.55])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

        pd = subplot(2,4,[7 8])
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,300), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,400), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,500), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('300 deaths/million', '400 deaths/million', '500 deaths/million','FontSize',8, 'location', 'southeast', 'NumColumns' ,1)
        legend boxoff
        title(leg,{'England & Wales (1890-91)'},'FontSize',8);
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

        yticks([0:0.05:0.5])
        ylim([0,0.55])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown') 

            
            h = figure(6);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 20];
        exportgraphics(h,'../Figures/SI_Figure_B-4.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-4.emf','BackgroundColor','none','Resolution', 900)   


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 5 B %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(7)
        pa = subplot(2,4,[1 2])
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Estimated_Bounds_Model(n).alpha',Estimated_Bounds_Model(n).dmax,Estimated_Bounds_Model(n).dmin,250), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Estimated_Bounds_Model(n+1).alpha',Estimated_Bounds_Model(n+1).dmax,Estimated_Bounds_Model(n+1).dmin,250),  Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        ylabel(sprintf('Prob(>250 deaths/million)'),'fontsize',8) 
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield', 'US'},'FontSize',6, 'Location','best', 'NumColumns',1);
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

        pb = subplot(2,4,[3 4])
        p = get(pb, 'position');
        p(1) = p(1) + 0.03;
        p(3) = p(3) - 0.03;
        set(pb, 'position', p);        
        for n=2:9
            hold on
            plot(years(26:end), bpareto_outbreakprob(Estimated_Bounds_Model(n).alpha',Estimated_Bounds_Model(n).dmax,Estimated_Bounds_Model(n).dmin,500), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),bpareto_outbreakprob(Estimated_Bounds_Model(n+1).alpha',Estimated_Bounds_Model(n+1).dmax,Estimated_Bounds_Model(n+1).dmin,500), Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black' )
        ylabel(sprintf('Prob(>500 deaths/million)'),'fontsize',8) 
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

        pc = subplot(2,4,[5 6])
        plot(Influenza_RUS(2,12:52),bpareto_outbreakprob(Estimated_Bounds_Model(11).alpha',Estimated_Bounds_Model(11).dmax,Estimated_Bounds_Model(11).dmin,50), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,12:52),bpareto_outbreakprob(Estimated_Bounds_Model(11).alpha',Estimated_Bounds_Model(11).dmax,Estimated_Bounds_Model(11).dmin,100), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,12:52),bpareto_outbreakprob(Estimated_Bounds_Model(11).alpha',Estimated_Bounds_Model(11).dmax,Estimated_Bounds_Model(11).dmin,150), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('50 deaths/million', '100 deaths/million', '150 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
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
        ylim([0,0.45])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})

        pd = subplot(2,4,[7 8])
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,300), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,400), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,55:80),bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,500), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('300 deaths/million', '400 deaths/million', '500 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
        legend boxoff
        title(leg,{'England & Wales (1890-91)'},'FontSize',8);
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
        ylim([0,0.45])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown') 
          
            h = figure(7);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 20];
        exportgraphics(h,'../Figures/SI_Figure_B-5.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-5.emf','BackgroundColor','none','Resolution', 900)   



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 6 B %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(8)
        pa = subplot(2,4,[1 2])
        for n=2:9
            hold on
            plot(years(24:end), bpareto_outbreakprob(Estimated_Bounds_Model_v2(n).alpha',Estimated_Bounds_Model_v2(n).dmax,Estimated_Bounds_Model_v2(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,19:end),bpareto_outbreakprob(Estimated_Bounds_Model_v2(n+1).alpha',Estimated_Bounds_Model_v2(n+1).dmax,Estimated_Bounds_Model_v2(n+1).dmin,500),  Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        ylabel(sprintf('Prob(>500 deaths/million)'),'fontsize',8) 
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield', 'US'},'FontSize',6, 'Location','best', 'NumColumns',1);
%         leg.ItemTokenSize = [3,1.5];
        legend boxoff
        xlim([1917,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.5])
        ylim([0,0.55])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})
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
            plot(years(24:end), bpareto_outbreakprob(Estimated_Bounds_Model_v2(n).alpha',Estimated_Bounds_Model_v2(n).dmax,Estimated_Bounds_Model_v2(n).dmin,1000), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,19:end),bpareto_outbreakprob(Estimated_Bounds_Model_v2(n+1).alpha',Estimated_Bounds_Model_v2(n+1).dmax,Estimated_Bounds_Model_v2(n+1).dmin,1000), Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black' )
        ylabel(sprintf('Prob(>1000 deaths/million)'),'fontsize',8) 
         a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1917,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.4])
        ylim([0,0.45])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})

        pc = subplot(2,4,[5 6])
        plot(Influenza_RUS(2,10:52),bpareto_outbreakprob(Estimated_Bounds_Model_v2(11).alpha',Estimated_Bounds_Model_v2(11).dmax,Estimated_Bounds_Model_v2(11).dmin,100), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,10:52),bpareto_outbreakprob(Estimated_Bounds_Model_v2(11).alpha',Estimated_Bounds_Model_v2(11).dmax,Estimated_Bounds_Model_v2(11).dmin,200), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,10:52),bpareto_outbreakprob(Estimated_Bounds_Model_v2(11).alpha',Estimated_Bounds_Model_v2(11).dmax,Estimated_Bounds_Model_v2(11).dmin,300), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('100 deaths/million', '200 deaths/million', '300 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
        legend boxoff
        title(leg,'England & Wales (1847-48)','FontSize',8);
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1845,1889])
        xticks([1849:5:1889])
        xticklabels({'1849','1854', '1859','1864','1869','1874','1879','1884','1889'}) 
        xtickangle(0)
        yticks([0:0.05:0.4])
        ylim([0,0.45])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})

        pd = subplot(2,4,[7 8])
        plot(Influenza_RUS(2,53:80),bpareto_outbreakprob(Estimated_Bounds_Model_v2(12).alpha',Estimated_Bounds_Model_v2(12).dmax,Estimated_Bounds_Model_v2(12).dmin,300), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,53:80),bpareto_outbreakprob(Estimated_Bounds_Model_v2(12).alpha',Estimated_Bounds_Model_v2(12).dmax,Estimated_Bounds_Model_v2(12).dmin,400), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,53:80),bpareto_outbreakprob(Estimated_Bounds_Model_v2(12).alpha',Estimated_Bounds_Model_v2(12).dmax,Estimated_Bounds_Model_v2(12).dmin,500), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('300 deaths/million', '400 deaths/million', '500 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
        legend boxoff
        title(leg,{'England & Wales (1890-91)'},'FontSize',8);
        box off

        ylabel(sprintf('Probability of exceeding threshold'),'fontsize',8) 
        a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1888,1917])
        xticks([1892:5:1917])
        xticklabels({'1892','1897', '1902','1907','1912','1917'})
        xtickangle(0)

        yticks([0:0.05:0.4])
        ylim([0,0.45])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown') 
          
            h = figure(8);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 20];
        exportgraphics(h,'../Figures/SI_Figure_B-6.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-6.emf','BackgroundColor','none','Resolution', 900)   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 7 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  

figure(9)
        pa = subplot(2,4,[1 2])
        for n=2:9
            hold on
            plot(years(26:end), weibull_outbreakprob(Weibull_Model(n).w',50), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),weibull_outbreakprob(Weibull_Model(n+1).w',50),  Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        ylabel(sprintf('Prob(>500 deaths/million)'),'fontsize',8) 
        leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield', 'US'},'FontSize',8, 'Location','best', 'NumColumns',1);
%         leg.ItemTokenSize = [3,1.5];
        legend boxoff
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.95])
        ylim([0,0.95])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7','0.75','0.8','0.85','0.9','0.95'})
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
            plot(years(26:end),weibull_outbreakprob(Weibull_Model(n).w',100), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
        end
            hold on
        plot(Influenza_US(2,21:end),weibull_outbreakprob(Weibull_Model(n+1).w',100), Linemarkertypes{n+1}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black' )
        ylabel(sprintf('Prob(>1,000 deaths/million)'),'fontsize',8) 
         a = get(gca,'XTickLabel');
        set(gca,'XTickLabel',a,'fontsize',8)        
        aa = get(gca,'YTickLabel');
        set(gca,'YTickLabel',aa,'fontsize',8) 
        xlim([1919,1956])
        xticks([1920:5:1956])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
        xtickangle(0)
        yticks([0:0.05:0.95])
        ylim([0,0.95])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7','0.75','0.8','0.85','0.9','0.95'})

        pc = subplot(2,4,[5 6])
               plot(Influenza_RUS(2,12:52),weibull_outbreakprob(Weibull_Model(11).w',10), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,12:52),weibull_outbreakprob(Weibull_Model(11).w',20), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,12:52),weibull_outbreakprob(Weibull_Model(11).w',30), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('100 deaths/million', '200 deaths/million', '300 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
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
        yticks([0:0.05:0.95])
        ylim([0,0.95])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7','0.75','0.8','0.85','0.9','0.95'})

        pd = subplot(2,4,[7 8])
                plot(Influenza_RUS(2,55:80),weibull_outbreakprob(Weibull_Model(12).w',30), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
        hold on        
        plot(Influenza_RUS(2,55:80),weibull_outbreakprob(Weibull_Model(12).w',40), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        hold on
        plot(Influenza_RUS(2,55:80),weibull_outbreakprob(Weibull_Model(12).w',50), '-d', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
        leg=legend('300 deaths/million', '400 deaths/million', '500 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
        legend boxoff
        title(leg,{'England & Wales (1890-91)'},'FontSize',8);
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

        yticks([0:0.05:0.95])
        ylim([0,0.95])
        yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7','0.75','0.8','0.85','0.9','0.95'})

        AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.05, 'VShift', -0.05, 'Direction', 'TopDown') 

            
            h = figure(9);
            %set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
            h.Units='centimeters';
            h.OuterPosition=[0 0 19 20];
        exportgraphics(h,'../Figures/SI_Figure_B-7.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(h,'../Figures/SI_Figure_B-7.emf','BackgroundColor','none','Resolution', 900)   


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 8  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(10)

contour(g1,g2,reshape(kdensity_estimate,[size(g1,1)],[]),'ShowText','off')
colormap("jet")
for b=1:11
    hold on
    ha(b)=plot((Parms(b,1)),(Parms(b,2)), Markertypes{b},'Color', 'black','MarkerSize',6)
end
legend(ha,{ 'Belfast 1918-19', 'Birmingham 1918-19' ,'Cardiff 1918-19','Glasgow 1918-19', 'Liverpool 1918-19', 'London 1918-19', 'Manchester 1918-19', 'Sheffield 1918-19', 'United States  1918-19', 'England & Wales 1847-48', 'England & Wales 1890-91'},'FontSize',8,'NumColumns',3,'Orientation','horizontal','Location','bestoutside')
legend boxoff
ylabel('\eta_{0}')
xlabel('\lambda')
box off
h = figure(10);
h.Units='centimeters';
h.OuterPosition=[0 0 19 12];
exportgraphics(h,'../Figures/SI_Figure_B-7.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-7.emf','BackgroundColor','none','Resolution', 900)  