%%% This function loads the data from the excel file and prepares the
%%% demographic variables for Table S1
clear    
citynames = {'Belfast', 'Birmingham' ,'Cardiff', 'Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'};
Belfast = readtable('../Data/UK_Cities_Mortality_Data.xlsx', 'Sheet', ['Belfast data'], 'Range', 'A1:M63');
Birmingham = readtable('../Data/UK_Cities_Mortality_Data.xlsx', 'Sheet', ['Birmingham data'], 'Range', 'A1:M63');
Cardiff = readtable('../Data/UK_Cities_Mortality_Data.xlsx', 'Sheet', ['Cardiff data'], 'Range', 'A1:M63');
Glasgow = readtable('../Data/UK_Cities_Mortality_Data.xlsx', 'Sheet', ['Glasgow data'], 'Range', 'A1:K63');
Liverpool = readtable('../Data/UK_Cities_Mortality_Data.xlsx', 'Sheet', ['Liverpool data'], 'Range', 'A1:M63');
London = readtable('../Data/UK_Cities_Mortality_Data.xlsx', 'Sheet', ['London data'], 'Range', 'A1:M63');
Manchester = readtable('../Data/UK_Cities_Mortality_Data.xlsx', 'Sheet', ['Manchester data'], 'Range', 'A1:M63');
Sheffield = readtable('../Data/UK_Cities_Mortality_Data.xlsx', 'Sheet', ['Sheffield data'], 'Range', 'A1:M63');

Influenza = table(Belfast.Influenza_rate, Birmingham.Influenza_rate ,Cardiff.Influenza_rate, Glasgow.Influenza_rate, Liverpool.Influenza_rate, London.Influenza_rate, Manchester.Influenza_rate, Sheffield.Influenza_rate,'VariableNames', citynames);
Pneumonia = table(Belfast.Pneumonia_rate, Birmingham.Pneumonia_rate ,Cardiff.Pneumonia_rate, Glasgow.Pneumonia_rate, Liverpool.Pneumonia_rate, London.Pneumonia_rate, Manchester.Pneumonia_rate, Sheffield.Pneumonia_rate,'VariableNames', citynames);
Bronchitis = table(Belfast.Bronchitis_rate, Birmingham.Bronchitis_rate ,Cardiff.Bronchitis_rate, Glasgow.Bronchitis_rate, Liverpool.Bronchitis_rate, London.Bronchitis_rate, Manchester.Bronchitis_rate, Sheffield.Bronchitis_rate,'VariableNames', citynames);
All_causes = table(Belfast.All_causes_rate, Birmingham.All_causes_rate ,Cardiff.All_causes_rate, Glasgow.All_causes_rate, Liverpool.All_causes_rate, London.All_causes_rate, Manchester.All_causes_rate, Sheffield.All_causes_rate,'VariableNames', citynames);

A = [mean(Belfast.Population(26:35), 'omitnan'),mean(Birmingham.Population(26:35), 'omitnan'),mean(Cardiff.Population(26:35), 'omitnan'),mean(Glasgow.Population(26:35), 'omitnan'),mean(Liverpool.Population(26:35), 'omitnan'),mean(London.Population(26:35), 'omitnan'),mean(Manchester.Population(26:35), 'omitnan'),mean(Sheffield.Population(26:35), 'omitnan')];
B = [mean(Belfast.Population(36:45), 'omitnan'),mean(Birmingham.Population(36:45), 'omitnan'),mean(Cardiff.Population(36:45), 'omitnan'),mean(Glasgow.Population(36:45), 'omitnan'),mean(Liverpool.Population(36:45), 'omitnan'),mean(London.Population(36:45), 'omitnan'),mean(Manchester.Population(36:45), 'omitnan'),mean(Sheffield.Population(36:45), 'omitnan')];
C = [mean(Belfast.Population(46:55), 'omitnan'),mean(Birmingham.Population(46:55), 'omitnan'),mean(Cardiff.Population(46:55), 'omitnan'),mean(Glasgow.Population(46:55), 'omitnan'),mean(Liverpool.Population(46:55), 'omitnan'),mean(London.Population(46:55), 'omitnan'),mean(Manchester.Population(46:55), 'omitnan'),mean(Sheffield.Population(46:55), 'omitnan')];

Population = [A;B;C];

A = [mean(Belfast.Population_density(26:35), 'omitnan'),mean(Birmingham.Population_density(26:35), 'omitnan'),mean(Cardiff.Population_density(26:35), 'omitnan'),mean(Glasgow.Population_density(26:35), 'omitnan'),mean(Liverpool.Population_density(26:35), 'omitnan'),mean(London.Population_density(26:35), 'omitnan'),mean(Manchester.Population_density(26:35), 'omitnan'),mean(Sheffield.Population_density(26:35), 'omitnan')];
B = [mean(Belfast.Population_density(36:45), 'omitnan'),mean(Birmingham.Population_density(36:45), 'omitnan'),mean(Cardiff.Population_density(36:45), 'omitnan'),mean(Glasgow.Population_density(36:45), 'omitnan'),mean(Liverpool.Population_density(36:45), 'omitnan'),mean(London.Population_density(36:45), 'omitnan'),mean(Manchester.Population_density(36:45), 'omitnan'),mean(Sheffield.Population_density(36:45), 'omitnan')];
C = [mean(Belfast.Population_density(46:55), 'omitnan'),mean(Birmingham.Population_density(46:55), 'omitnan'),mean(Cardiff.Population_density(46:55), 'omitnan'),mean(Glasgow.Population_density(46:55), 'omitnan'),mean(Liverpool.Population_density(46:55), 'omitnan'),mean(London.Population_density(46:55), 'omitnan'),mean(Manchester.Population_density(46:55), 'omitnan'),mean(Sheffield.Population_density(46:55), 'omitnan')];

PopDensity = [A;B;C];


Tab = [Population;PopDensity];
VarNames = {'Population 1920s','Population 1930s','Population 1940s','Population Density 1920s','Population Density 1930s','Population Density 1940s' }';
    for b =1:8
        Tab2(:,b) = table(Tab(:,b));
    end
    Tab2.Properties.VariableNames = { 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'};
    Tab = [table(VarNames) Tab2];
    writetable(Tab,'../Figures/Table_2.xlsx')
