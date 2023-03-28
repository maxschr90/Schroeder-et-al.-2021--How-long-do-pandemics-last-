clear
clc
close all

load('Fitted_Models_v1')
Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 6  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(6)
subplot(1,8,[1,4])
hold on
for i=1:10
    plot(mean_temp(i,3),mean_temp(i,4),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
xlabel({'Average mortality across main waves (1918-19)'},'Fontsize',8)
ylabel({'Average mortality in', 'first post pandemic decade'},'Fontsize',8)

box off
xlim([0,4000])
ylim([230,450])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',8)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',8)

subplot(1,8,[5,8])

hold on

for i=1:10
    plot(NaN,NaN,Markertypes{i}, 'Color','black', 'Markersize',6 );
end


for i=1:10
    plot(average_infant_mort(i),mean_temp(i,4),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
xlim([90,170])
ylim([230,450])
xticks(100:20:170)
box off
xlabel({'Pre-pandemic infant mortality'},'Fontsize',8)
legend([citynames,'United States', 'England & Wales'],'Location','best','FontSize',6,'Color','black')
legend boxoff
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',8)
set(gca,'yticklabel',{[]})


AddLetters2Plots(figure(6), {'a', 'b'}, 'HShift', -0.03, 'VShift', -0.05, 'Direction', 'TopDown','fontsize',8)

h = figure(6);

%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 16];
exportgraphics(h,'../Figures/Figure_6.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_6.emf','BackgroundColor','none','Resolution', 900)
