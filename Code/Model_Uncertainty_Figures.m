%% Figures with uncertainty bounds

clear
clc
close all
load('Fitted_Models_v2.mat')

%% Based on Asymptotics
t = [1:37]'-1;
    rng(1001)
    Rand_Parms = (mvnrnd([Base_Model(1).lambda; Base_Model(1).eta_zero]  ,Base_Model(1).VarCovar,10000));

parfor i=1:size(Rand_Parms,1)
    alpha_sim(i,:) =  1./(exp(Rand_Parms(i,2))*exp(-t*Rand_Parms(i,1)));
    temp_1(i,:) = bpareto_outbreakprob(alpha_sim(i,:),Base_Model(1).dmax,Base_Model(1).dmin,500)';
    temp_2(i,:) = bpareto_outbreakprob(alpha_sim(i,:),Base_Model(1).dmax,Base_Model(1).dmin,1000)';
end
    Outbreak_Sim(:,:,1) =temp_1;
    Outbreak_Sim(:,:,2) =temp_2;
    Outbreak_Est(:,:,1) =bpareto_outbreakprob(Base_Model(1).alpha',Base_Model(1).dmax,Base_Model(1).dmin,500)';
    Outbreak_Est(:,:,2) =bpareto_outbreakprob(Base_Model(1).alpha',Base_Model(1).dmax,Base_Model(1).dmin,1000)';
    figure(1)
        subplot(1,2,1)
         hold on
        [hc,~,~] = shadedplot(1:size(Outbreak_Sim(:,:,1),2), prctile([Outbreak_Sim(:,:,1)],10), prctile([Outbreak_Sim(:,:,1)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        [hb,~,~] = shadedplot(1:size(Outbreak_Sim(:,:,1),2), prctile([Outbreak_Sim(:,:,1)],25), prctile([Outbreak_Sim(:,:,1)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
        hold on
        ha = plot(median(Outbreak_Sim(:,:,1),'omitnan'),'-', 'Linewidth', 1,'Color','black')
        hold on
        hd = plot(Outbreak_Est(:,:,1),'--', 'Linewidth', 1,'Color','red')
        xticks([1 6 11 16 21 26 31 36])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
        ylabel(sprintf('Probability of mortality rate exceeding 500 per million'),'FontSize',12,'FontWeight','bold')

        subplot(1,2,2)
        hold on
        [hc,~,~] = shadedplot(1:size(Outbreak_Sim(:,:,2),2), prctile([Outbreak_Sim(:,:,2)],10), prctile([Outbreak_Sim(:,:,2)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        [hb,~,~] = shadedplot(1:size(Outbreak_Sim(:,:,2),2), prctile([Outbreak_Sim(:,:,2)],25), prctile([Outbreak_Sim(:,:,2)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
        hold on
        ha = plot(median(Outbreak_Sim(:,:,2),'omitnan'),'-', 'Linewidth', 1,'Color','black')
        hold on
        hd = plot(Outbreak_Est(:,:,2),'--', 'Linewidth', 1,'Color','red')
        xticks([1 6 11 16 21 26 31 36])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
        ylabel(sprintf('Probability of mortality rate exceeding 1,000 per million'),'FontSize',12,'FontWeight','bold')

        set (figure(1), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(1);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Figure_asymptotics.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Figure_asymptotics.emf','BackgroundColor','none')


        %% Based on Monte Carlo
    load('MC_save_v3.mat')
    t = [1:37]'-1;

parfor i=1:size(Rand_Parms,1)
    alpha_sim(i,:) =  1./(exp(theta_hat(i,2,1))*exp(-t*theta_hat(i,1,1)));
    temp_1(i,:) = bpareto_outbreakprob(alpha_sim(i,:),Base_Model(1).dmax,Base_Model(1).dmin,500)';
    temp_2(i,:) = bpareto_outbreakprob(alpha_sim(i,:),Base_Model(1).dmax,Base_Model(1).dmin,1000)';
end
    Outbreak_Sim(:,:,1) =temp_1;
    Outbreak_Sim(:,:,2) =temp_2;
    Outbreak_Est(:,:,1) =bpareto_outbreakprob(Base_Model(1).alpha',Base_Model(1).dmax,Base_Model(1).dmin,500)';
    Outbreak_Est(:,:,2) =bpareto_outbreakprob(Base_Model(1).alpha',Base_Model(1).dmax,Base_Model(1).dmin,1000)';
    figure(2)
        subplot(1,2,1)
         hold on
        [hc,~,~] = shadedplot(1:size(Outbreak_Sim(:,:,1),2), prctile([Outbreak_Sim(:,:,1)],10), prctile([Outbreak_Sim(:,:,1)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        [hb,~,~] = shadedplot(1:size(Outbreak_Sim(:,:,1),2), prctile([Outbreak_Sim(:,:,1)],25), prctile([Outbreak_Sim(:,:,1)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
        hold on
        ha = plot(median(Outbreak_Sim(:,:,1),'omitnan'),'-', 'Linewidth', 1,'Color','black')
        hold on
        hd = plot(Outbreak_Est(:,:,1),'--', 'Linewidth', 1,'Color','red')
        xticks([1 6 11 16 21 26 31 36])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
        ylabel(sprintf('Probability of mortality rate exceeding 500 per million'),'FontSize',12,'FontWeight','bold')

        subplot(1,2,2)
        hold on
        [hc,~,~] = shadedplot(1:size(Outbreak_Sim(:,:,2),2), prctile([Outbreak_Sim(:,:,2)],10), prctile([Outbreak_Sim(:,:,2)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
        hold on
        [hb,~,~] = shadedplot(1:size(Outbreak_Sim(:,:,2),2), prctile([Outbreak_Sim(:,:,2)],25), prctile([Outbreak_Sim(:,:,2)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
        hold on
        ha = plot(median(Outbreak_Sim(:,:,2),'omitnan'),'-', 'Linewidth', 1,'Color','black')
        hold on
        hd = plot(Outbreak_Est(:,:,2),'--', 'Linewidth', 1,'Color','red')
        xticks([1 6 11 16 21 26 31 36])
        xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'}) 
        ylabel(sprintf('Probability of mortality rate exceeding 1,000 per million'),'FontSize',12,'FontWeight','bold')

        set (figure(2), 'Units', 'normalized', 'Position', [0.16,0,0.66,0.6]);
        h = figure(2);
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
        exportgraphics(h,'../Figures/Figure_montecarlo.pdf','BackgroundColor','none')
        exportgraphics(h,'../Figures/Figure_montecarlo.emf','BackgroundColor','none')