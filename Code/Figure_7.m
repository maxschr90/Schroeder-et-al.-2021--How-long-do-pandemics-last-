clear
clc
close all

load('Fitted_Models_v1')
Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 7  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ttt =[1:9,12];
for n=1:10
    i=ttt(n);
    outbreakrisk_500(n,:)=bpareto_outbreakprob(Base_Model(i).alpha',Base_Model(i).dmax,Base_Model(i).dmin,500);
end
slope_500(:,1) = (outbreakrisk_500(:,10) - outbreakrisk_500(:,1))./outbreakrisk_500(:,1)/10;
max_500 = outbreakrisk_500(:,1);

figure(7)
subplot(2,1,1)
hold on
for i=1:10
    plot(average_infant_mort(i),max_500(i),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
ylabel({'Prob(>500 deaths/million)','maximum'},'fontsize',8)

box off
xlim([90,170])
xticks(100:20:170)
ylim([0.25,0.4])
set(gca,'XTickLabel',{[]})
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',8)

subplot(2,1,2)

hold on

for i=1:10
    plot(NaN,NaN,Markertypes{i}, 'Color','black', 'Markersize',6 );
end


for i=1:10
    plot(average_infant_mort(i),slope_500(i),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
xlim([90,170])
xticks(100:20:170)
box off
xlabel({'Pre-pandemic infant mortality'},'Fontsize',8)
ylabel({'Prob(>500 deaths/million)','10-year slope'},'Fontsize',8)

legend([citynames,'United States', 'England & Wales'],'Location','best','FontSize',6,'Color','black')
legend boxoff
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',8)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',8)


AddLetters2Plots(figure(7), {'a', 'b'}, 'HShift', -0.05, 'VShift', -0.05, 'Direction', 'TopDown','fontsize',8)

h = figure(7);

%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 16];
exportgraphics(h,'../Figures/Figure_7.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_7.emf','BackgroundColor','none','Resolution', 900)
