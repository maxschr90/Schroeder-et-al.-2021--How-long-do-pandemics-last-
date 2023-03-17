clear
clc
close all

load('Fitted_Models_v2.mat')
t =[0:36];
figure(1)
for n=1:8
    subplot(4,2,n)
    title(citynames(n))
            hold on

        alpha = 1./(exp(Base_Model(n).eta_zero)*exp(-t*Base_Model(n).lambda));
        plot(years(26:end), bpareto_outbreakprob(alpha',Base_Model(n).dmax,Base_Model(n).dmin,500));
                alpha = 1./(exp(Base_Model(n).eta_zero)*exp(-t*Base_Model(n).lambda*0.9));
        plot(years(26:end), bpareto_outbreakprob(alpha',Base_Model(n).dmax,Base_Model(n).dmin,500));
                alpha = 1./(exp(Base_Model(n).eta_zero)*exp(-t*Base_Model(n).lambda*0.95));
        plot(years(26:end), bpareto_outbreakprob(alpha',Base_Model(n).dmax,Base_Model(n).dmin,500));
                alpha = 1./(exp(Base_Model(n).eta_zero)*exp(-t*Base_Model(n).lambda*1.05));
        plot(years(26:end), bpareto_outbreakprob(alpha',Base_Model(n).dmax,Base_Model(n).dmin,500));
                        alpha = 1./(exp(Base_Model(n).eta_zero)*exp(-t*Base_Model(n).lambda*1.1));
        plot(years(26:end), bpareto_outbreakprob(alpha',Base_Model(n).dmax,Base_Model(n).dmin,500));
end

leg = legend('Baseline', '-10%', '-5%', '+5%', '+10%')
title(leg,'\lambda')


        h = figure(1);
        h.Units='centimeters';
        h.OuterPosition=[0 0 18 15]*2;
        exportgraphics(figure(1),'../Figures/Figure_lambda.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(figure(1),'../Figures/Figure_lambda.emf','BackgroundColor','none','Resolution', 900)       