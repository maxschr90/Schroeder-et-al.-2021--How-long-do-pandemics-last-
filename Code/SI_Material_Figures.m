%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Appendix  Figures  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
close all
load('Fitted_Models_v1.mat')
load("MC_output_v1.mat")


Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x','>'};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 1 A  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Pneumonia_UK = table2array(Pneumonia);
figure(1)
for b = 1:8
    subplot(4,2,b)
    plot(years,Pneumonia_UK(:,b),'.-',  'Linewidth', 0.5, 'Color','red', 'Markersize', 6 ,'MarkerEdgeColor','red')
    ylim([0,max(Pneumonia_UK(:,b))*1.05])
    yticks([0,1000,round(max(Pneumonia_UK(:,b)),0)])
    xlim([1895,1950])
    a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'fontsize',6)
    aa = get(gca,'YTickLabel');
    set(gca,'YTickLabel',aa,'fontsize',6)
    title(citynames(b),'fontsize',6,'FontWeight','bold');
    box off
end
AddLetters2Plots(figure(1), {'a', 'c', 'e', 'g' 'b', 'd', 'f', 'h'},'HShift', -0.07, 'VShift', -0.075, 'Direction', 'TopDown','fontsize',6)

h = figure(1);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 14 15];
exportgraphics(h,'../Figures/SI_Figure_A-1.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_A-1.emf','BackgroundColor','none','Resolution', 900)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 2 A  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Bronchitis_UK = table2array(Bronchitis);
figure(2)
for b = 1:8
    subplot(4,2,b)
    plot(years,Bronchitis_UK(:,b),'.-',  'Linewidth', 0.5, 'Color','red', 'Markersize', 6 ,'MarkerEdgeColor','red')
    ylim([0,max(Bronchitis_UK(:,b))*1.05])
    yticks([0,1000,round(max(Bronchitis_UK(:,b)),0)])
    xlim([1895,1950])
    a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'fontsize',6)
    aa = get(gca,'YTickLabel');
    set(gca,'YTickLabel',aa,'fontsize',6)
    title(citynames(b),'fontsize',6,'FontWeight','bold');
    box off
end
AddLetters2Plots(figure(2), {'a', 'c', 'e', 'g' 'b', 'd', 'f', 'h'}, 'HShift', -0.07, 'VShift', -0.075, 'Direction', 'TopDown','fontsize',6)

h = figure(2);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 14 15];
exportgraphics(h,'../Figures/SI_Figure_A-2.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_A-2.emf','BackgroundColor','none','Resolution', 900)














%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 5 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(7)
pa = subplot(1,2,1)
for n=1:8
    hold on
    plot(years(26:end), bpareto_outbreakprob(Common_Bounds_Model(n).alpha',Common_Bounds_Model(n).dmax,Common_Bounds_Model(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
end
ylabel(sprintf('Prob(>500 deaths/million)'),'fontsize',6)

xlim([1919,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.4])
ylim([0,0.45])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)

pb = subplot(1,2,2)
p = get(pb, 'position');
p(1) = p(1) + 0.03;
p(3) = p(3) - 0.03;
set(pb, 'position', p);
for n=1:8
    hold on
    plot(years(26:end), bpareto_outbreakprob(Common_Bounds_Model(n).alpha',Common_Bounds_Model(n).dmax,Common_Bounds_Model(n).dmin,750), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
end
ylabel(sprintf('Prob(>750 deaths/million)'),'fontsize',6)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
xlim([1919,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.4])
ylim([0,0.45])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})
leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'},'fontsize',6, 'Location','best', 'NumColumns',1);
leg.ItemTokenSize = [9,4.5];
legend boxoff

AddLetters2Plots({pa, pb},{'a','b'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown')


h = figure(7);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 10];
exportgraphics(h,'../Figures/SI_Figure_B-5.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-5.emf','BackgroundColor','none','Resolution', 900)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 6 B %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(8)
pa = subplot(2,2,1)
for n=1:8
    hold on
    plot(years(26:end), bpareto_outbreakprob(Theoretical_Bounds_Model(n).alpha',Theoretical_Bounds_Model(n).dmax,Theoretical_Bounds_Model(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
end
hold on
ylabel(sprintf('Prob(>500 deaths/million)'),'fontsize',6)
leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'},'FontSize',6, 'Location','best', 'NumColumns',1);
leg.ItemTokenSize = [9,4.5];
legend boxoff
title(leg,'UK Cities (1918-19)','fontsize',6);
xlim([1919,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.6])
ylim([0,0.5])
%         yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)

pb = subplot(2,2,2)
%         p = get(pb, 'position');
%         p(1) = p(1) + 0.03;
%         p(3) = p(3) - 0.03;
%         set(pb, 'position', p);
for n=1:8
    hold on
    plot(years(26:end), bpareto_outbreakprob(Theoretical_Bounds_Model(n).alpha',Theoretical_Bounds_Model(n).dmax,Theoretical_Bounds_Model(n).dmin,750), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
end
hold on
ylabel(sprintf('Prob(>750 deaths/million)'),'fontsize',6)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
xlim([1919,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.45])
ylim([0,0.5])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45'})

pc = subplot(2,2,3)
plot(Influenza_EW(83:119,1),bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,500), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
hold on
plot(Influenza_EW(83:119,1),bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,750), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
leg=legend('500 deaths/million', '750 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
legend boxoff
title(leg,'England & Wales (1918-19)','fontsize',6);
leg.ItemTokenSize = [9,4.5];

box off

ylabel(sprintf('Probability of exceeding threshold'),'fontsize',6)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
xlim([1919,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.5])
ylim([0,0.5])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

pd = subplot(2,2,4)
plot(Influenza_US(21:end,1),bpareto_outbreakprob(Theoretical_Bounds_Model(9).alpha',Theoretical_Bounds_Model(9).dmax,Theoretical_Bounds_Model(9).dmin,500), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
hold on
plot(Influenza_US(21:end,1),bpareto_outbreakprob(Theoretical_Bounds_Model(9).alpha',Theoretical_Bounds_Model(9).dmax,Theoretical_Bounds_Model(9).dmin,750), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
leg=legend('500 deaths/million', '750 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
legend boxoff
title(leg,'United States (1918-19)','fontsize',6);
leg.ItemTokenSize = [9,4.5];

box off

ylabel(sprintf('Probability of exceeding threshold'),'fontsize',6)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
xlim([1919,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.5])
ylim([0,0.5])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.06, 'VShift', -0.03, 'Direction', 'TopDown')


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
pa = subplot(2,2,1)
plot(Influenza_EW(12:52,1), bpareto_outbreakprob(Theoretical_Bounds_Model(10).alpha',Theoretical_Bounds_Model(10).dmax,Theoretical_Bounds_Model(10).dmin,Base_Model(10).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(12:52,1), bpareto_outbreakprob(Theoretical_Bounds_Model(10).alpha',Theoretical_Bounds_Model(10).dmax,Theoretical_Bounds_Model(10).dmin,Base_Model(10).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(12:52,1), bpareto_outbreakprob(Theoretical_Bounds_Model(10).alpha',Theoretical_Bounds_Model(10).dmax,Theoretical_Bounds_Model(10).dmin,Base_Model(10).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
leg = legend('2/3 of peak','1/2 of peak','1/3 of peak')
legend boxoff
leg.ItemTokenSize = [9,4.5];

xlim([1848,1890])
xticks([1850:5:1890])
xtickangle(0)
yticks([0:0.05:0.45])
ylim([0,0.5])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
title('England & Wales 1847-48')
box off

pb = subplot(2,2,2)

plot(Influenza_EW(55:80,1), bpareto_outbreakprob(Theoretical_Bounds_Model(11).alpha',Theoretical_Bounds_Model(11).dmax,Theoretical_Bounds_Model(11).dmin,Base_Model(11).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(55:80,1), bpareto_outbreakprob(Theoretical_Bounds_Model(11).alpha',Theoretical_Bounds_Model(11).dmax,Theoretical_Bounds_Model(11).dmin,Base_Model(11).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(55:80,1), bpareto_outbreakprob(Theoretical_Bounds_Model(11).alpha',Theoretical_Bounds_Model(11).dmax,Theoretical_Bounds_Model(11).dmin,Base_Model(11).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
%         a = get(gca,'XTickLabel');
%         set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
xlim([1891,1918])
xticks([1890:5:1915])

xtickangle(0)
yticks([0:0.1:0.5])
ylim([0,0.5])
yticklabels({'0','0.1',  '0.2', '0.3','0.4','0.5','0.6','0.7'})

title('England & Wales 1889-90')
box off

pc = subplot(2,2,3)

plot(Influenza_EW(83:119,1), bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,Base_Model(12).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(83:119,1), bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,Base_Model(12).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(83:119,1), bpareto_outbreakprob(Theoretical_Bounds_Model(12).alpha',Theoretical_Bounds_Model(12).dmax,Theoretical_Bounds_Model(12).dmin,Base_Model(12).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

xlim([1919,1957])
xticks([1920:5:1955])
xtickangle(0)
yticks([0:0.05:0.45])
ylim([0,0.45])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
title('England & Wales 1918-19')
box off

pd = subplot(2,2,4)
plot(Influenza_EW(134:end,1), bpareto_outbreakprob(Theoretical_Bounds_Model(14).alpha',Theoretical_Bounds_Model(14).dmax,Theoretical_Bounds_Model(14).dmin,Base_Model(14).dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(134:end,1), bpareto_outbreakprob(Theoretical_Bounds_Model(14).alpha',Theoretical_Bounds_Model(14).dmax,Theoretical_Bounds_Model(14).dmin,Base_Model(14).dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(134:end,1), bpareto_outbreakprob(Theoretical_Bounds_Model(14).alpha',Theoretical_Bounds_Model(14).dmax,Theoretical_Bounds_Model(14).dmin,Base_Model(14).dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

xlim([1970,2001])
xticks([1970:5:2000])
xtickangle(0)
yticks([0:0.05:0.45])
ylim([0,0.45])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
title('England & Wales 1968-70')
box off

AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.07, 'VShift', -0.045, 'Direction', 'TopDown')

h = figure(9);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 20];
exportgraphics(h,'../Figures/SI_Figure_B-7.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-7.emf','BackgroundColor','none','Resolution', 900)








