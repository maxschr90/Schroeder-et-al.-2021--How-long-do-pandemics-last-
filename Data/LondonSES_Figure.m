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


%% Clear temporary variables
clear opts

figure(1)
temp = table2array(Londond_SES(:,[2,4,8]));
[b,bint] = regress(temp(:,2),[ones(length(temp),1),temp(:,3)]);
prediction = [ones(length(temp),1),temp(:,3)]*b;
% for n=1:38
%     ward(n,1) = mean(temp(temp(:,2)==n,3),'omitnan');
%     ward(n,2) = mean(temp(temp(:,2)==n,4),'omitnan');
% end
% subplot(2,1,1)
hold on
plot(temp(:,3),temp(:,2),'*','Color','black')
plot(temp(:,3),prediction,'--','Color','black')
xlabel('Overcrowding')
ylabel('Infant Mortality (deaths/1,000 births)')

