clear
clc
close all
load('Fitted_Models_v2')
Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x'};
citynames = {'Belfast', 'Birmingham' ,'Cardiff', 'Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'};
Infant_Mort = table2array(readtable('../Data/Infant_Mortality.xlsx', 'Range', 'B2:I57'));
Year = [1895:1950]';

pre_average = mean(Infant_Mort(1:23,:),'omitnan')/1000;
for n=1:8
    temp(n,:) = bpareto_outbreakprob(Base_Model(n).alpha',Base_Model(n).dmax,Base_Model(n).dmin,500);
    halflife(n) = find(temp(n,:)>temp(n,1)/2,1,'last');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1)
hold on
for i=1:8
    plot(pre_average(i),mean_temp(i,3),Markertypes{i}, 'Color','black', 'Markersize',6 );
end
legend([citynames],'Location','best','FontSize',6)
legend boxoff
box off
%     ylim([0,450])
%     xlim([0,4000])
xlabel({'Infant Mortality','(deaths/1,000 births'})
ylabel({'Average mortality across main waves (1918-19)'})

h = figure(1);
%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 10];
exportgraphics(h,'../Figures/Infant_Figure_1.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Infant_Figure_1.emf','BackgroundColor','none','Resolution', 900)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure(2)
hold on
for i=1:8
    plot(pre_average(i),mean_temp(i,4),Markertypes{i}, 'Color','black', 'Markersize',6 );
end
legend([citynames],'Location','best','FontSize',6)
legend boxoff
box off
%     ylim([0,450])
%     xlim([0,4000])
xlabel({'Infant Mortality','(deaths/1,000 births'})
ylabel({'Average mortality in first','post-pandemic decade (1920-1929)'})

h = figure(2);
%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 10];
exportgraphics(h,'../Figures/Infant_Figure_2.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Infant_Figure_2.emf','BackgroundColor','none','Resolution', 900)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(3)
hold on
for i=1:8
    plot(pre_average(i),halflife(i),Markertypes{i}, 'Color','black', 'Markersize',6 );
end
legend([citynames],'Location','best','FontSize',6)
legend boxoff
box off
%     ylim([0,450])
%     xlim([0,4000])
xlabel({'Infant Mortality','(deaths/1,000 births'})
ylabel({'Halflife of recurrent outbreak risk'})

h = figure(3);
%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 10];
exportgraphics(h,'../Figures/Infant_Figure_3.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Infant_Figure_3.emf','BackgroundColor','none','Resolution', 900)

figure(4)
hold on
for i=1:8
    plot(pre_average(i),Base_Model(i).lambda,Markertypes{i}, 'Color','black', 'Markersize',6 );
end
legend([citynames],'Location','best','FontSize',6)
legend boxoff
box off
%     ylim([0,450])
%     xlim([0,4000])
xlabel({'Infant Mortality','(deaths/1,000 births'})
ylabel({'\lambda'})

h = figure(4);
%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 10];
exportgraphics(h,'../Figures/Infant_Figure_4.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Infant_Figure_4.emf','BackgroundColor','none','Resolution', 900)