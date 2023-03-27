clear
clc
close all

%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 10);

% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "A2:J523";

% Specify column names and types
opts.VariableNames = ["MetB", "Year", "Population", "inf_mor", "OC_smte_pro", "OC_pesmte", "OC_pesmteoc", "OC_pesmteoc_pro_D", "OC_peallteoc", "OC_peallteoc_pro"];
opts.VariableTypes = ["categorical", "double", "double", "double", "double", "double", "double", "double", "string", "string"];

% Specify variable properties
opts = setvaropts(opts, ["OC_peallteoc", "OC_peallteoc_pro"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["MetB", "OC_peallteoc", "OC_peallteoc_pro"], "EmptyFieldRule", "auto");

% Import the data
Londond_SES = readtable("D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\London_data.xlsx", opts, "UseExcel", false);

%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 6);

% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "A2:F483";

% Specify column names and types
opts.VariableNames = ["Year", "Ward_num", "Ward_name", "Persons_per_room", "Deaths_under_1_year_thou_births","Population"];
opts.VariableTypes = ["double", "double", "categorical", "double", "double", "double"];

% Specify variable properties
opts = setvaropts(opts, "Ward_name", "EmptyFieldRule", "auto");

% Import the data
Glasgow_SES = readtable("D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\Glasgow_IM_and_SES.xlsx", opts, "UseExcel", false);

%% Clear temporary variables
clear opts

figure(1)
temp = table2array(Londond_SES(:,[2,4,8]));
[b,bint] = regress(temp(:,2),[ones(length(temp),1),temp(:,3)]);
prediction = [ones(length(temp),1),temp(:,3)]*b;

subplot(2,1,1)
hold on
plot(temp(:,3),temp(:,2),'*','Color','black')
plot(temp(:,3),prediction,'--','Color','black')
xlabel('Overcrowding')
ylabel({'Infant Mortality', '(deaths/1,000 births)'})
title('London')
subplot(2,1,2)
temp = table2array(Glasgow_SES(:,[1:2,4,5]));
[b,bint] = regress(temp(:,4),[ones(length(temp),1),temp(:,3)]);
prediction = [ones(length(temp),1),temp(:,3)]*b;
hold on
plot(temp(:,3),temp(:,4),'*','Color','black')
plot(temp(:,3),prediction,'--','Color','black')
xlabel('Persons per Room')
ylabel({'Infant Mortality', '(deaths/1,000 births)'})
title('Glasgow')

        h = figure(1);
        h.Units='centimeters';
        h.OuterPosition=[0 0 18 15];
        exportgraphics(figure(1),'../Figures/Figure_SES.pdf','BackgroundColor','none','Resolution', 900)
        exportgraphics(figure(1),'../Figures/Figure_SES.emf','BackgroundColor','none','Resolution', 900)    
