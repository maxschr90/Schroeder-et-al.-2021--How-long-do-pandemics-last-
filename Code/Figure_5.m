clear
clc
close all

load('Fitted_Models_v1')
Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x'};

MainWave(1) = mean([285, 459]);
MainWave(2) = mean([157, 574]);
MainWave(3) = mean([3301.46362304688,1264.60046386719]);
MainWave(4) = mean([95.9169845581055,97.1312026977539,148.288146972656]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 5  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
ttt =[1:9,12];
for n=1:10
    i=ttt(n);
    outbreakrisk_500(n,:)=bpareto_outbreakprob(Base_Model(i).alpha',Base_Model(i).dmax,Base_Model(i).dmin,500);
end
slope_500(:,1) = (outbreakrisk_500(:,10) - outbreakrisk_500(:,1))./outbreakrisk_500(:,1)/10;
max_500 = outbreakrisk_500(:,1);

figure(5)
subplot(2,1,1)
hold on
for i=1:10
    plot(NaN,NaN,Markertypes{i}, 'Color','black', 'Markersize',6 );
end
for i=1:10
    plot(mean_temp(i,3),max_500(i,1),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
leg = legend([citynames,'United States', 'England & Wales'],'Location','west','FontSize',6,'Color','black')
legend boxoff
box off
ylim([0.25,0.4])
xlim([0,4000])
ylabel({'Prob(>500 deaths/million)','maximum'},'fontsize',8)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',{[]})
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',8)

subplot(2,1,2)
hold on
for i=1:10
    plot(mean_temp(i,3),slope_500(i,1),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
xlabel({'Average mortality across main waves (1918-19)'},'fontsize',8)
ylabel({'Prob(>500 deaths/million)','10-year slope'},'fontsize',8)

box off
xlim([0,4000])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',8)
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',8)
AddLetters2Plots(figure(5), {'a', 'b'}, 'HShift', -0.05, 'VShift', -0.05, 'Direction', 'TopDown','fontsize',8)

h = figure(5);

%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 16];
exportgraphics(h,'../Figures/Figure_5.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_5.emf','BackgroundColor','none','Resolution', 900)
