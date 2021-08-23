clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Main Paper Tables  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Table 1: Model Summary  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('Bounded_Pareto_v1')
    
    Parameters = [ozero(1:end) ozero_US ozero_RUS; lam(1:end)' lam_US lam_RUS; dmin, dmin_US, dmin_RUS; dmax, dmax_US, dmax_RUS;f, f_US, f_RUS];
    temp =  [dmin, dmin_US]' .*(1-0.5.*(1-([dmin, dmin_US]'./[dmax, dmax_US]').^[alpha; alpha_US'])).^(-1./[alpha; alpha_US']);
    RMSE = sum(abs(temp-[Disease(26:end,:),Influenza_US(1,21:end)']').^2,2,'omitnan')';
    temp =  [dmin_RUS]' .*(1-0.5.*(1-([dmin_RUS]'./[dmin_RUS]').^[ alpha_RUS'])).^(-1./[alpha_RUS']);
    RMSE = [RMSE, sum(abs(temp-Influenza_RUS(1,54:80)).^2,2,'omitnan')];
    ParNames = {'o_{0}', '\lambda', 'd_{min}', 'd_{max}', 'LL', 'RSME'}';
    Outputs = [Parameters;RMSE];
    Tab1 = table(ParNames);
    names = {'All Cities', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales'}
    for b =1:11
        Tab2(:,b) = table(Outputs(:,b));
    end
    Tab2.Properties.VariableNames = names;
    Tab = [Tab1 Tab2];
    writetable(Tab,'../Figures/Table_1.xlsx')
    
          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Table 2: Demographics %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Load_Data


A = [mean(Belfast.Population(26:35), 'omitnan'),mean(Birmingham.Population(26:35), 'omitnan'),mean(Cardiff.Population(26:35), 'omitnan'),mean(Glasgow.Population(26:35), 'omitnan'),mean(Liverpool.Population(26:35), 'omitnan'),mean(London.Population(26:35), 'omitnan'),mean(Manchester.Population(26:35), 'omitnan'),mean(Sheffield.Population(26:35), 'omitnan')];
B = [mean(Belfast.Population(36:45), 'omitnan'),mean(Birmingham.Population(36:45), 'omitnan'),mean(Cardiff.Population(36:45), 'omitnan'),mean(Glasgow.Population(36:45), 'omitnan'),mean(Liverpool.Population(36:45), 'omitnan'),mean(London.Population(36:45), 'omitnan'),mean(Manchester.Population(36:45), 'omitnan'),mean(Sheffield.Population(36:45), 'omitnan')];
C = [mean(Belfast.Population(46:55), 'omitnan'),mean(Birmingham.Population(46:55), 'omitnan'),mean(Cardiff.Population(46:55), 'omitnan'),mean(Glasgow.Population(46:55), 'omitnan'),mean(Liverpool.Population(46:55), 'omitnan'),mean(London.Population(46:55), 'omitnan'),mean(Manchester.Population(46:55), 'omitnan'),mean(Sheffield.Population(46:55), 'omitnan')];
D = [mean(Belfast.Population(26:55), 'omitnan'),mean(Birmingham.Population(26:55), 'omitnan'),mean(Cardiff.Population(26:55), 'omitnan'),mean(Glasgow.Population(26:55), 'omitnan'),mean(Liverpool.Population(26:55), 'omitnan'),mean(London.Population(26:55), 'omitnan'),mean(Manchester.Population(26:55), 'omitnan'),mean(Sheffield.Population(26:55), 'omitnan')];

Population = [A;B;C;D];

A = [mean(Belfast.Population_density(26:35), 'omitnan'),mean(Birmingham.Population_density(26:35), 'omitnan'),mean(Cardiff.Population_density(26:35), 'omitnan'),mean(Glasgow.Population_density(26:35), 'omitnan'),mean(Liverpool.Population_density(26:35), 'omitnan'),mean(London.Population_density(26:35), 'omitnan'),mean(Manchester.Population_density(26:35), 'omitnan'),mean(Sheffield.Population_density(26:35), 'omitnan')];
B = [mean(Belfast.Population_density(36:45), 'omitnan'),mean(Birmingham.Population_density(36:45), 'omitnan'),mean(Cardiff.Population_density(36:45), 'omitnan'),mean(Glasgow.Population_density(36:45), 'omitnan'),mean(Liverpool.Population_density(36:45), 'omitnan'),mean(London.Population_density(36:45), 'omitnan'),mean(Manchester.Population_density(36:45), 'omitnan'),mean(Sheffield.Population_density(36:45), 'omitnan')];
C = [mean(Belfast.Population_density(46:55), 'omitnan'),mean(Birmingham.Population_density(46:55), 'omitnan'),mean(Cardiff.Population_density(46:55), 'omitnan'),mean(Glasgow.Population_density(46:55), 'omitnan'),mean(Liverpool.Population_density(46:55), 'omitnan'),mean(London.Population_density(46:55), 'omitnan'),mean(Manchester.Population_density(46:55), 'omitnan'),mean(Sheffield.Population_density(46:55), 'omitnan')];
D = [mean(Belfast.Population_density(26:55), 'omitnan'),mean(Birmingham.Population_density(26:55), 'omitnan'),mean(Cardiff.Population_density(26:55), 'omitnan'),mean(Glasgow.Population_density(26:55), 'omitnan'),mean(Liverpool.Population_density(26:55), 'omitnan'),mean(London.Population_density(26:55), 'omitnan'),mean(Manchester.Population_density(26:55), 'omitnan'),mean(Sheffield.Population_density(26:55), 'omitnan')];

PopDensity = [A;B;C;D];


Tab = [Population;PopDensity];
VarNames = {'Population 20s','Population 30s','Population 40s','Population Average','Population Density 20s','Population Density 30s','Population Density 40s','Population Density Average' }';
    for b =1:8
        Tab2(:,b) = table(Tab(:,b));
    end
    Tab2.Properties.VariableNames = { 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'};
    Tab = [table(VarNames) Tab2];
    writetable(Tab,'../Figures/Table_2.xlsx')