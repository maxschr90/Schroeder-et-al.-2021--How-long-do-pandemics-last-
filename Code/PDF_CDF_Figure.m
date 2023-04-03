clear
clc
close all

load('Fitted_Models_v1')
Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x'};


figure(1)
for i=1:8
    subplot(2,4,i)
    hold on
    ylabel('pdf')
    xlabel('mortality rate')
    title(citynames{i})
 plot([linspace(Base_Model(i).dmin,Base_Model(i).dmax,100)],(bpareto_evaluatepdf(Base_Model(i).alpha(1),Base_Model(i).dmax,Base_Model(i).dmin,linspace(Base_Model(i).dmin,Base_Model(i).dmax,100))),'LineWidth',0.5)
    plot([linspace(Base_Model(i).dmin,Base_Model(i).dmax,100)],(bpareto_evaluatepdf(Base_Model(i).alpha(11),Base_Model(i).dmax,Base_Model(i).dmin,linspace(Base_Model(i).dmin,Base_Model(i).dmax,100))),'LineWidth',0.5)
    plot([linspace(Base_Model(i).dmin,Base_Model(i).dmax,100)],(bpareto_evaluatepdf(Base_Model(i).alpha(21),Base_Model(i).dmax,Base_Model(i).dmin,linspace(Base_Model(i).dmin,Base_Model(i).dmax,100))),'LineWidth',0.5)
    plot([linspace(Base_Model(i).dmin,Base_Model(i).dmax,100)],(bpareto_evaluatepdf(Base_Model(i).alpha(31),Base_Model(i).dmax,Base_Model(i).dmin,linspace(Base_Model(i).dmin,Base_Model(i).dmax,100))),'LineWidth',0.5)
    xlim([-10,Base_Model(i).dmax+100])
end
legend('1920', '1930','1940','1950','Location','best')
h = figure(1);

%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 20 20];
exportgraphics(h,'../Figures/Figure_PDF.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_PDF.emf','BackgroundColor','none','Resolution', 900)

figure(2)
for i=1:8
    subplot(2,4,i)
    hold on
    ylabel('cdf')
    xlabel('mortality rate')
    title(citynames{i})
    plot([linspace(Base_Model(i).dmin,Base_Model(i).dmax,100)],(bpareto_evaluatecdf(Base_Model(i).alpha(1),Base_Model(i).dmax,Base_Model(i).dmin,linspace(Base_Model(i).dmin,Base_Model(i).dmax,100))),'LineWidth',0.5)
    plot([linspace(Base_Model(i).dmin,Base_Model(i).dmax,100)],(bpareto_evaluatecdf(Base_Model(i).alpha(11),Base_Model(i).dmax,Base_Model(i).dmin,linspace(Base_Model(i).dmin,Base_Model(i).dmax,100))),'LineWidth',0.5)
    plot([linspace(Base_Model(i).dmin,Base_Model(i).dmax,100)],(bpareto_evaluatecdf(Base_Model(i).alpha(21),Base_Model(i).dmax,Base_Model(i).dmin,linspace(Base_Model(i).dmin,Base_Model(i).dmax,100))),'LineWidth',0.5)
    plot([linspace(Base_Model(i).dmin,Base_Model(i).dmax,100)],(bpareto_evaluatecdf(Base_Model(i).alpha(31),Base_Model(i).dmax,Base_Model(i).dmin,linspace(Base_Model(i).dmin,Base_Model(i).dmax,100))),'LineWidth',0.5)
    xlim([-10,Base_Model(i).dmax+100])
end
legend('1920', '1930','1940','1950','Location','best')
h = figure(2);

%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 20 20];
exportgraphics(h,'../Figures/Figure_CDF.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_CDF.emf','BackgroundColor','none','Resolution', 900)

