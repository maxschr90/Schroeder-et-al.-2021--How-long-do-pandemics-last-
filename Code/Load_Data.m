%%% This function loads the data from the excel file and prepares the
%%% demographic variables for Table S1
clear    
citynames = {'Belfast', 'Birmingham' ,'Cardiff', 'Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'};
Belfast = readtable('../Data/UK_Cities_Mortality_Data_v2.xlsx', 'Sheet', ['Belfast data'], 'Range', 'A1:M63');
Birmingham = readtable('../Data/UK_Cities_Mortality_Data_v2.xlsx', 'Sheet', ['Birmingham data'], 'Range', 'A1:M63');
Cardiff = readtable('../Data/UK_Cities_Mortality_Data_v2.xlsx', 'Sheet', ['Cardiff data'], 'Range', 'A1:M63');
Glasgow = readtable('../Data/UK_Cities_Mortality_Data_v2.xlsx', 'Sheet', ['Glasgow data'], 'Range', 'A1:L63');
Liverpool = readtable('../Data/UK_Cities_Mortality_Data_v2.xlsx', 'Sheet', ['Liverpool data'], 'Range', 'A1:M63');
London = readtable('../Data/UK_Cities_Mortality_Data_v2.xlsx', 'Sheet', ['London data'], 'Range', 'A1:M63');
Manchester = readtable('../Data/UK_Cities_Mortality_Data_v2.xlsx', 'Sheet', ['Manchester data'], 'Range', 'A1:M63');
Sheffield = readtable('../Data/UK_Cities_Mortality_Data_v2.xlsx', 'Sheet', ['Sheffield data'], 'Range', 'A1:M63');

Influenza = table(Belfast.Influenza_rate, Birmingham.Influenza_rate ,Cardiff.Influenza_rate, Glasgow.Influenza_rate, Liverpool.Influenza_rate, London.Influenza_rate, Manchester.Influenza_rate, Sheffield.Influenza_rate,'VariableNames', citynames);
Pneumonia = table(Belfast.Pneumonia_rate, Birmingham.Pneumonia_rate ,Cardiff.Pneumonia_rate, Glasgow.Pneumonia_rate, Liverpool.Pneumonia_rate, London.Pneumonia_rate, Manchester.Pneumonia_rate, Sheffield.Pneumonia_rate,'VariableNames', citynames);
Bronchitis = table(Belfast.Bronchitis_rate, Birmingham.Bronchitis_rate ,Cardiff.Bronchitis_rate, Glasgow.Bronchitis_rate, Liverpool.Bronchitis_rate, London.Bronchitis_rate, Manchester.Bronchitis_rate, Sheffield.Bronchitis_rate,'VariableNames', citynames);
Bronchio_pneumonia = table(Belfast.Bronchio_pneumonia_rate, Birmingham.Bronchio_pneumonia_rate ,Cardiff.Bronchio_pneumonia_rate, Glasgow.Bronchio_pneumonia_rate, Liverpool.Bronchio_pneumonia_rate, London.Bronchio_pneumonia_rate, Manchester.Bronchio_pneumonia_rate, Sheffield.Bronchio_pneumonia_rate,'VariableNames', citynames);
Other_respiratory = table(Belfast.Other_respiratory_rate, Birmingham.Other_respiratory_rate ,Cardiff.Other_respiratory_rate, Glasgow.Other_respiratory_rate, Liverpool.Other_respiratory_rate, London.Other_respiratory_rate, Manchester.Other_respiratory_rate, Sheffield.Other_respiratory_rate,'VariableNames', citynames);
Infant_mortality = table(Belfast.Infant_mortality, Birmingham.Infant_mortality ,Cardiff.Infant_mortality, Glasgow.Infant_mortality, Liverpool.Infant_mortality, London.Infant_mortality, Manchester.Infant_mortality, Sheffield.Infant_mortality,'VariableNames', citynames);
Population = table(Belfast.Population, Birmingham.Population ,Cardiff.Population, Glasgow.Population, Liverpool.Population, London.Population, Manchester.Population, Sheffield.Population,'VariableNames', citynames);

%% Calculate Relative Influenza & Respiratory Diseases for outbreak years

outbreakyears = [1922,1924,1927,1929,1933,1937]';
years = [1895:1956]';

Infl = [years,table2array(Influenza)];
temp = [years,sumdatatables(Infl(:,2:end),table2array(Pneumonia))];
temp = [years,sumdatatables(temp(:,2:end),table2array(Bronchitis))];
Resp = [years,sumdatatables(temp(:,2:end),table2array(Bronchio_pneumonia))];

for i =1:length(outbreakyears)
    ind = find(years==outbreakyears(i));
    Excess_Influenza(i,:) = Infl(ind,2:end)./mean([Infl(ind-1,2:end); Infl(ind+1,2:end)],'omitnan');
    Excess_Resp(i,:) = Resp(ind,2:end)./mean([Resp(ind-1,2:end); Resp(ind+1,2:end)],'omitnan');
end
Excess_Resp(6,1) = NaN;

writematrix(Excess_Influenza,'../Data/Relative_Mortality_v2.xlsx','Sheet','Influenza','Range','B2:I7')
writematrix(Excess_Resp,'../Data/Relative_Mortality_v2.xlsx','Sheet','Respiratory','Range','B2:I7')

periods = [nan(3,1);ones(10,1);ones(10,1)*2;ones(2,1)*3;ones(10,1)*4;ones(10,1)*5;ones(10,1)*6];
Cities_EW=[2,3,4:8];
pop = table2array(Population);
inflz = table2array(Influenza);

for i=1:6
    mpop = mean(pop(periods==i,:),'omitnan');
    minfl = mean(inflz(periods==i,:),'omitnan');
    cityaverage_EW(1,i) = sum(mpop(Cities_EW).*minfl(Cities_EW),'omitnan')/sum(mpop(Cities_EW),'omitnan');
    cityaverage_UK(1,i) = sum(mpop(:).*minfl(:),'omitnan')/sum(mpop(:),'omitnan');

end
%% Keep Variables for Analysis
Influenza_US = table2array(readtable('../Data/National_Mortality_Data.xls', 'Sheet', ['US'], 'Range', 'A1:B57'));
Influenza_EW = table2array(readtable('../Data/National_Mortality_Data.xls', 'Sheet', ['England & Wales'], 'Range', 'A1:B163'));
Influenza_Cities = [years,table2array(Influenza)];
Infant_mortality_EW =table2array(readtable('../Data/National_Mortality_Data.xls', 'Sheet', ['England & Wales'], 'Range', 'C1:C163'));

average_infant_mort = mean(table2array(Infant_mortality(1:23,:)),'omitnan')/1000;
average_infant_mort = [average_infant_mort,nan,mean(Infant_mortality_EW(46:68),'omitnan')];

clearvars -except Influenza_US Influenza_EW  Influenza_Cities years citynames Pneumonia Bronchitis Bronchio_pneumonia Resp Infant_mortality average_infant_mort