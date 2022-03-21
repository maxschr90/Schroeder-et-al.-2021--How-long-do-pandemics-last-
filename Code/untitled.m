figure(1)
subplot(1,2,1)
hold on
[hc,~,~] = shadedplot(1:size(Simulation(ind==1,:),2), prctile([Simulation(ind==1,:)],10), prctile([Simulation(ind==1,:)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[hd,~,~] = shadedplot(1:size(Simulation(ind==1,:),2), prctile([Simulation(ind==1,:)],25), prctile([Simulation(ind==1,:)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
hold on
he = plot(median(Simulation(ind==1,:)),'-', 'Linewidth', 1.25,'Color','black');
subplot(1,2,2)
hold on
[hc,~,~] = shadedplot(1:size(Simulation(ind==0,:),2), prctile([Simulation(ind==0,:)],10), prctile([Simulation(ind==0,:)],90), [0.95 0.95 0.95],[0.95 0.95 0.95]); 
hold on

[hd,~,~] = shadedplot(1:size(Simulation(ind==0,:),2), prctile([Simulation(ind==0,:)],25), prctile([Simulation(ind==0,:)],75), [0.9 0.9 0.9],[0.9 0.9 0.9]); 
hold on

he = plot(median(Simulation(ind==0,:)),'-', 'Linewidth', 1.25,'Color','black');