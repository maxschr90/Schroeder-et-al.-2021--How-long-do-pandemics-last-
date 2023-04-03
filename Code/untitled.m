Markertypes = {'p','o','h','s','d','*','v','^','+','x','>'};
close all
figure(1)
for i=2:9
    subplot(4,2,i-1)
    hold on
    for n=1:6
        plot(n,mean(Resp(periods==n,i),'omitnan'),Markertypes{n});
    end
    title(citynames{i-1})
    xlim([0,7])
    xticks([1:6])
    xticklabels({'1898-1907',	'1908-1917',	'1918-19',	'1920-29',	'1930-39'	,'1940-1949'})
    a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',4)
    xtickangle(0)
    ylabel({'Average respitatory', 'mortality'},'FontSize',6)
end

h = figure(1);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 20];
exportgraphics(h,'../Figures/Figure_XX.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_XX.emf','BackgroundColor','none','Resolution', 900)