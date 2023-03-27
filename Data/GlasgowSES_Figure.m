clear
clc
close all

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
temp = table2array(Glasgow_SES(:,[1:2,4,5]));
[b,bint] = regress(temp(:,4),[ones(length(temp),1),temp(:,3)]);
prediction = [ones(length(temp),1),temp(:,3)]*b;
% for n=1:38
%     ward(n,1) = mean(temp(temp(:,2)==n,3),'omitnan');
%     ward(n,2) = mean(temp(temp(:,2)==n,4),'omitnan');
% end
% subplot(2,1,1)
hold on
plot(temp(:,3),temp(:,4),'*','Color','black')
plot(temp(:,3),prediction,'--','Color','black')
xlabel('Persons per Room')
ylabel('Infant Mortality (deaths/1,000 births)')

