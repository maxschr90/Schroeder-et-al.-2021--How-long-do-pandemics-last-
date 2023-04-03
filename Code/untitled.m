Markertypes = {'p','o','h','s','d','*','v','^','+','x','>'};
close all
outbreakyears = [1922,1924,1927,1929,1933,1937]';
years = [1895:1956]';
periods = NaN(size(years));
for i=1:6
    ind = find(years==outbreakyears(i));
    periods(ind) = i;
end

figure(1)
for i=2:9
    subplot(4,2,i-1)
    hold on
    for n=1:6
        plot(n,mean(inflz(periods==n,i-1),'omitnan')/mean(Resp(periods==n,i),'omitnan'),Markertypes{n});
    end
    title(citynames{i-1})
    xlim([0,7])
    xticks([1:6])
    xticklabels({'1922',	'1924',	'1927',	'1929',	'1933'	,'1937'})
    a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',4)
    xtickangle(0)
    ylabel({'Share of influenza in', 'combined respiratory mortality'},'FontSize',6)
end

h = figure(1);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 20];
exportgraphics(h,'../Figures/Figure_XX.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_XX.emf','BackgroundColor','none','Resolution', 900)