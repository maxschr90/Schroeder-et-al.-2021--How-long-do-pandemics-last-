clear
clc
close all
Load_Data
years = [1895:1956]';
A = [years,table2array(Influenza)];
B = [years,sumdatatables(A(:,2:end),table2array(Pneumonia))];
C = [years,sumdatatables(B(:,2:end),table2array(Bronchitis))];
D = [years,sumdatatables(C(:,2:end),table2array(Bronchio_pneumonia))];
E = [years,sumdatatables(D(:,2:end),table2array(Other_respiratory))];
F = [years, table2array(All_causes)];

    names = {'Year', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'};
for n=1:9
    TA(:,n) = table(A(:,n));
    TB(:,n) = table(B(:,n));
    TC(:,n) = table(C(:,n));
    TD(:,n) = table(D(:,n));
    TE(:,n) = table(E(:,n));
    TF(:,n) = table(F(:,n));
end
    TA.Properties.VariableNames = names;
    TB.Properties.VariableNames = names;
    TC.Properties.VariableNames = names;
    TD.Properties.VariableNames = names;
    TE.Properties.VariableNames = names;
    TF.Properties.VariableNames = names;

    writetable(TA,'Infectious_Disease_Panel.xlsx', 'Sheet', 'Influenza')
    writetable(TB,'Infectious_Disease_Panel.xlsx', 'Sheet', 'Influenza+Pneumonia')
    writetable(TC,'Infectious_Disease_Panel.xlsx', 'Sheet', 'Influenza+Pneumonia+Bronchitis')
    writetable(TD,'Infectious_Disease_Panel.xlsx', 'Sheet', 'Inf+Pneu+Bronchitis+BronchioPne')
    writetable(TE,'Infectious_Disease_Panel.xlsx', 'Sheet', 'Inf+Pneu+Bron+BronchPneu+Other')
    writetable(TF,'Infectious_Disease_Panel.xlsx', 'Sheet', 'All Causes')



    [~,hp_Pneumonia] = hpfilter(mean(table2array(Pneumonia),2,'omitnan'),'Smoothing',6.25);
    [~,hp_Bronchitis] = hpfilter(mean(table2array(Bronchitis),2,'omitnan'),'Smoothing',6.25);
    [~,hp_PneumoniaBronchitis] = hpfilter(mean(C(:,2:end)-A(:,2:end),2,'omitnan'),'Smoothing',6.25);
    [~,hp_PneumoniaBronchitisBronchiPneu] = hpfilter(mean(D(:,2:end)-A(:,2:end),2,'omitnan'),'Smoothing',6.25);
    [~,hp_SelectedResp] = hpfilter(mean(E(:,2:end),2,'omitnan'),'Smoothing',6.25);
    [~,hp_AllCauses] = hpfilter(mean(F(:,2:end),2,'omitnan'),'Smoothing',6.25);



    figure(1)
    subplot(2,3,1)
    plot(years,A(:,2:end))
    ylabel('Influenza')
    subplot(2,3,2)
    plot(years,B(:,2:end))
    ylabel('+Pneumonia')    
    subplot(2,3,3)
    plot(years,C(:,2:end))
    ylabel('+Bronchitis')
    subplot(2,3,4)
    plot(years,D(:,2:end))
    ylabel('+BronchioPneumonia')
    subplot(2,3,5)
    plot(years,E(:,2:end))
    ylabel('+Other Respiratory')
    subplot(2,3,6)
    plot(years,F(:,2:end))
    ylabel('All Causes')
    h = figure(1);
            %set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
    h.Units='centimeters';
    h.OuterPosition=[0 0 19 25];
    exportgraphics(h,'../Figures/Resp_Diseases.pdf','BackgroundColor','none','Resolution', 900)


figure(2)
subplot(2,3,1)
plot(years,hp_Pneumonia )
ylabel('HP Filtered Pneumonia')
subplot(2,3,2)
plot(years,hp_Bronchitis )
ylabel('HP Filtered Bronchitis')
subplot(2,3,3)
plot(years,hp_PneumoniaBronchitis )
ylabel('HP Filtered Pneumonia+Bronchitis')
subplot(2,3,4)
plot(years,hp_PneumoniaBronchitisBronchiPneu )
ylabel('HP Filtered Pneumonia+Bronchitis+BronchioPneumonia')
subplot(2,3,5)
plot(years,hp_SelectedResp )
ylabel('HP Filtered Pneumonia+Bronchitis+BronchioPneumonia+Other')
subplot(2,3,6)
plot(years,hp_AllCauses )
ylabel('HP Filtered All Causes')
h = figure(2);
            %set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 25];
exportgraphics(h,'../Figures/HP_filtered_disease.pdf','BackgroundColor','none','Resolution', 900)
