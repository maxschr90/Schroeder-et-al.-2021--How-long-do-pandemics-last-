clear
clc
close all
load('Fitted_Models_v1')
Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x'};
citynames = {'Belfast', 'Birmingham' ,'Cardiff', 'Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'};
Pop_Density = table2array(readtable('../Data/Population_Density.xlsx', 'Range', 'A2:H57'));
Year = [1895:1950]';

pre_average = mean(Pop_Density(1:23,:),'omitnan');
post_average = mean(Pop_Density(24:end,:),'omitnan');

% pre_average = mean(Pop_Density(14:23,:),'omitnan');
% post_average = mean(Pop_Density(24:33,:),'omitnan');

for n=1:8
    temp(n,:) = bpareto_outbreakprob(Base_Model(n).alpha',Base_Model(n).dmax,Base_Model(n).dmin,500);
    halflife(n) = find(temp(n,:)>temp(n,1)/2,1,'last');
end
h=figure(1)
plot(Year,Pop_Density)
ylabel({'Population Density','(people/acre)'})
legend([citynames],'Location','best','FontSize',6)
legend boxoff
box off

h.Units='centimeters';
h.OuterPosition=[0 0 19 10];
exportgraphics(h,'../Figures/PopDensity_Figure_0.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/PopDensity_Figure_0.emf','BackgroundColor','none','Resolution', 900)
close all
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
xlabel({'Population Density','(people/acre)','pre-1918'})
ylabel({'Average mortality across main waves (1918-19)'})

h = figure(1);
%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 10];
exportgraphics(h,'../Figures/PopDensity_Figure_1.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/PopDensity_Figure_1.emf','BackgroundColor','none','Resolution', 900)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure(2)
subplot(1,2,1)
hold on
for i=1:8
    plot(pre_average(i),mean_temp(i,4),Markertypes{i}, 'Color','black', 'Markersize',6 );
end
legend([citynames],'Location','best','FontSize',6)
legend boxoff
box off
%     ylim([0,450])
%     xlim([0,4000])
xlabel({'Population Density','(people/acre)','pre-1918'})
ylabel({'Average mortality in first','post-pandemic decade (1920-1929)'})
subplot(1,2,2)
hold on
for i=1:8
    plot(post_average(i),mean_temp(i,4),Markertypes{i}, 'Color','black', 'Markersize',6 );
end
xlabel({'Population Density','(people/acre)','post-1918'})

h = figure(2);
%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 10];
exportgraphics(h,'../Figures/PopDensity_Figure_2.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/PopDensity_Figure_2.emf','BackgroundColor','none','Resolution', 900)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(3)
subplot(1,2,1)

hold on
for i=1:8
    plot(pre_average(i),halflife(i),Markertypes{i}, 'Color','black', 'Markersize',6 );
end
legend([citynames],'Location','best','FontSize',6)
legend boxoff
box off
%     ylim([0,450])
%     xlim([0,4000])
xlabel({'Population Density','(people/acre)','pre-1918'})
ylabel({'Halflife of recurrent outbreak risk'})
subplot(1,2,2)
hold on
for i=1:8
    plot(pre_average(i),halflife(i),Markertypes{i}, 'Color','black', 'Markersize',6 );
end
legend([citynames],'Location','best','FontSize',6)
legend boxoff
box off
%     ylim([0,450])
%     xlim([0,4000])
xlabel({'Population Density','(people/acre)','post-1918'})

h = figure(3);
%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 10];
exportgraphics(h,'../Figures/PopDensity_Figure_3.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/PopDensity_Figure_3.emf','BackgroundColor','none','Resolution', 900)

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
xlabel({'Population Density','(people/acre)','pre-1918'})
ylabel({'\lambda'})

h = figure(4);
%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 10];
exportgraphics(h,'../Figures/PopDensity_Figure_4.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/PopDensity_Figure_4.emf','BackgroundColor','none','Resolution', 900)