clear
close all
clc
load("MC_save_v1.mat")

i = 1;
trueparms = Estimates(i,1:2);
lambda = theta_hat(:,1,i);
eta = theta_hat(:,2,i);

figure(1)
subplot(1,2,1)  
hold on
ksdensity(lambda)
dims = get(gca,'ylim');
line([trueparms(1),trueparms(1)],[dims],'Color','red','LineStyle','--')
line([mean(lambda),mean(lambda)],[dims],'LineStyle','--')
line([median(lambda),median(lambda)],[dims],'LineStyle','-.')
ylabel('\lambda')
subplot(1,2,2)  
hold on
ksdensity(eta)
dims = get(gca,'ylim');
line([trueparms(2),trueparms(2)],[dims],'Color','red','LineStyle','--')
line([mean(eta),mean(eta)],[dims],'LineStyle','--')
line([median(eta),median(eta)],[dims],'LineStyle','-.')
ylabel('\eta_0')

legend('Kernel Density of Estimated Parameters', 'True Parameter', 'Mean of Estimates', 'Median of Estimates')
        set (figure(1), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(1);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Monte_Carlo_v1.pdf','BackgroundColor','none')

figure(2)
subplot(1,2,1)  
hold on
ksdensity(log(lambda(lambda>0)))
dims = get(gca,'ylim');
line(log([trueparms(1),trueparms(1)]),[dims],'Color','red','LineStyle','--')
line([mean(log(lambda(lambda>0))),mean(log(lambda(lambda>0)))],[dims],'LineStyle','--')
line([median(log(lambda(lambda>0))),median(log(lambda(lambda>0)))],[dims],'LineStyle','-.')
ylabel('log(\lambda)')

subplot(1,2,2)  
hold on
ksdensity(log(eta(eta>0)))
dims = get(gca,'ylim');
line(log([trueparms(2),trueparms(2)]),[dims],'Color','red','LineStyle','--')
line([mean(log(eta(eta>0))),mean(log(eta(eta>0)))],[dims],'LineStyle','--')
line([median(log(eta(eta>0))),median(log(eta(eta>0)))],[dims],'LineStyle','-.')
ylabel('log(\eta_0)')

legend('Kernel Density of Estimated Parameters', 'True Parameter', 'Mean of Estimates', 'Median of Estimates')
        set (figure(2), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(2);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Monte_Carlo_v2.pdf','BackgroundColor','none')


%% Test for Log Normality
%% Standardize
log_eta = [log(eta(eta>0))-mean(log(eta(eta>0)))]./std(log(eta(eta>0)));
log_lambda = [log(lambda(lambda>0))-mean(log(lambda(lambda>0)))]./std(log(lambda(lambda>0)));

[h_lambda,p_lambda] = kstest(log_lambda)
[h_eta,p_eta] = kstest(log_eta)

test = randn(1000000,1);
kstest(test)
