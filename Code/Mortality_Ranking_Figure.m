clear
clc
close all
Load_Data
years = [1895:1956]';
outbreakyears = [1922,1924,1927,1929,1933,1937]';
Markertypes = {'p','x','h','s','d','*','v','^','+','o'};

A = [years,table2array(Influenza)];
B = [years,sumdatatables(A(:,2:end),table2array(Pneumonia))];
C = [years,sumdatatables(B(:,2:end),table2array(Bronchitis))];
D = [years,sumdatatables(C(:,2:end),table2array(Bronchio_pneumonia))];
E = [years,sumdatatables(D(:,2:end),table2array(Other_respiratory))];
F = [years, table2array(All_causes)];



for i =1:length(outbreakyears)
    ind = find(years==outbreakyears(i));
    Excess_Influenza(i,:) = A(ind,2:end)./mean([A(ind-1,2:end); A(ind+1,2:end)],'omitnan');
    Excess_Resp(i,:) = D(ind,2:end)./mean([D(ind-1,2:end); D(ind+1,2:end)],'omitnan');
end
Excess_Resp(6,1) = NaN;


figure(1)
    pa = subplot(2,3,1)
    hold on
        for i =1:8
            plot(Excess_Influenza(1,i),Excess_Resp(1,i),Markertypes{i},'Color','black','MarkerSize',6)
        end
        title(outbreakyears(1),'FontSize',8,'FontWeight','bold')
        ylabel({'Relative mortality from', 'respiratory diseases'},'fontsize',8)
    pb = subplot(2,3,2)
        hold on

        for i =1:8
            plot(Excess_Influenza(2,i),Excess_Resp(2,i),Markertypes{i},'Color','black','MarkerSize',6)
        end
        title(outbreakyears(2),'FontSize',8,'FontWeight','bold')    
    pc = subplot(2,3,3)
        hold on

        for i =1:8
            plot(Excess_Influenza(3,i),Excess_Resp(3,i),Markertypes{i},'Color','black','MarkerSize',6)
        end
        title(outbreakyears(3),'FontSize',8,'FontWeight','bold')
    pd = subplot(2,3,4)
        hold on

        for i =1:8
            plot(Excess_Influenza(4,i),Excess_Resp(4,i),Markertypes{i},'Color','black','MarkerSize',6)
        end
        ylabel({'Relative mortality from', 'respiratory diseases'},'fontsize',8)
        xlabel({'Relative mortality', ' from influenza'},'fontsize',8)

        title(outbreakyears(4),'FontSize',8,'FontWeight','bold')
    pe = subplot(2,3,5)
        hold on

        for i =1:8
            plot(Excess_Influenza(5,i),Excess_Resp(5,i),Markertypes{i},'Color','black','MarkerSize',6)
        end
                xlabel({'Relative mortality', ' from influenza'},'fontsize',8)

        title(outbreakyears(5),'FontSize',8,'FontWeight','bold')    
    pf = subplot(2,3,6)
        hold on

        for i =1:8
            plot(Excess_Influenza(6,i),Excess_Resp(6,i),Markertypes{i},'Color','black','MarkerSize',6)
        end
                xlabel({'Relative mortality', ' from influenza'},'fontsize',8)

        title(outbreakyears(6),'FontSize',8,'FontWeight','bold')
legend(pc,citynames,'Location','northwest','Box','off','FontSize',8)
h = figure(1);
h.Units='centimeters';
h.OuterPosition=[0 0 19 25];
exportgraphics(h,'../Figures/Excess_Mort_Ranking.pdf','BackgroundColor','none','Resolution', 900)