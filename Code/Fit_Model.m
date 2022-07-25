%%% This code fits the models presented in the main paper and the
%%% supplementary materials
clear
clc
close all
%%% 1. Load Data & Prepare Data
Load_Data % Loads data for UK cities from excel file
Influenza_UK = table2array(Influenza);
Influenza_UK = [mean(Influenza_UK,2,'omitnan'), Influenza_UK];
Influenza_RUS = [53,57,66,104,55,63,77,42,65,285,459,92,78,120,75,99,58,193,55,73,93,57,58,38,45,45,39,29,31,29,14,32,28,15,12,11,10,19,8,8,8,11,7,4,3,4,3,5,3,3,3,2,157,574,533,325,220,423,122,195,330,389,504,174,224,190,169,205,184,267,288,254,182,113,143,160,150,273,232,182,2984,1105,256;1838:1:1920];
Influenza_US = [267	365	104	192	218	205	102	250	211	133	142	158	100	123	89	157	270	174	3018	990	705	113	310	441	190	291	400	223	448	551	194	265	306	264	173	222	264	295	127	164	153	158	81	128	130	77	63	53	34	31	44	45	36	60	17	17	14;1900:1:1956];
citynames = {'All', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'};
years = 1895:1956;
years = years(1:end);

%%% 2. Estimate Base Model
    dmax_UK = (max(Influenza_UK));
    dmin_UK =  (min(Influenza_UK));
    for n = 1:size(Influenza_UK,2)
        [Base_Model(n)] = est_parms_bpareto(Influenza_UK(26:end,n),dmax_UK(n),dmin_UK(n), citynames(n));
    end
        dmax_US = max(Influenza_US(1,:)');
        dmin_US = min(Influenza_US(1,:)');
        [Base_Model(n+1)] = est_parms_bpareto(Influenza_US(1,21:end)',dmax_US,dmin_US, 'US');
        dmax_RUS_1848 = max(Influenza_RUS(1,1:52)');
        dmin_RUS_1848 = min(Influenza_RUS(1,1:52)');
        [Base_Model(n+2)] = est_parms_bpareto(Influenza_RUS(1,12:52)',dmax_RUS_1848,dmin_RUS_1848, 'England&Wales 1848');
        dmax_RUS_1890 = max(Influenza_RUS(1,1:80)');
        dmin_RUS_1890 = min(Influenza_RUS(1,54:80)');
        [Base_Model(n+3)] = est_parms_bpareto(Influenza_RUS(1,55:80)',dmax_RUS_1890,dmin_RUS_1890, 'England&Wales 1890');

%%% 3. Estimate Model with common Bounds
    dmax_UK = (max(dmax_UK));
    dmin_UK = (min(dmin_UK));
    for n = 1:size(Influenza_UK,2)
        [Common_Bounds_Model(n)] = est_parms_bpareto(Influenza_UK(26:end,n),dmax_UK,dmin_UK, citynames(n));
    end
        
%%% 4. Estimate Model with theoretical Bounds

    for n = 1:size(Influenza_UK,2)
        [Theoretical_Bounds_Model(n)] = est_parms_bpareto(Influenza_UK(26:end,n),1000000,1, citynames(n));
    end

        [Theoretical_Bounds_Model(n+1)] = est_parms_bpareto(Influenza_US(1,21:end)',1000000,1, 'US');
        [Theoretical_Bounds_Model(n+2)] = est_parms_bpareto(Influenza_RUS(1,12:52)',1000000,1, 'England&Wales');        
        [Theoretical_Bounds_Model(n+3)] = est_parms_bpareto(Influenza_RUS(1,55:80)',1000000,1, 'England&Wales');        
       
%%% 5a. Estimate Model with estimated Bounds

    for n = 1:size(Influenza_UK,2)
        [Estimated_Bounds_Model(n)] = est_parms_bpareto(Influenza_UK(26:end,n),[],[], citynames(n));
    end
        dmax_US = max(Influenza_US(1,:)');
        dmin_US = min(Influenza_US(1,:)');
        [Estimated_Bounds_Model(n+1)] = est_parms_bpareto(Influenza_US(1,21:end)',[],[], 'US');
        [Estimated_Bounds_Model(n+2)] = est_parms_bpareto(Influenza_RUS(1,12:52)',[],[], 'England&Wales 1848');
        [Estimated_Bounds_Model(n+3)] = est_parms_bpareto(Influenza_RUS(1,55:80)',[],[], 'England&Wales 1890');        
        
 %%% 5b. Estimate Model with estimated Bounds

    for n = 1:size(Influenza_UK,2)
        [Estimated_Bounds_Model_v2(n)] = est_parms_bpareto(Influenza_UK(24:end,n),[],[], citynames(n));
    end
        dmax_US = max(Influenza_US(1,:)');
        dmin_US = min(Influenza_US(1,:)');
        [Estimated_Bounds_Model_v2(n+1)] = est_parms_bpareto(Influenza_US(1,19:end)',[],[], 'US');
        [Estimated_Bounds_Model_v2(n+2)] = est_parms_bpareto(Influenza_RUS(1,10:52)',[],[], 'England&Wales 1848');
        [Estimated_Bounds_Model_v2(n+3)] = est_parms_bpareto(Influenza_RUS(1,53:80)',[],[], 'England&Wales 1890');        
        
           
%%% 6. Estimate Weibull Model 
%%% Deaths need to be rescaled for Weibull Distribution
    for n = 1:size(Influenza_UK,2)
        [Weibull_Model(n)] = est_parms_weibull(Influenza_UK(26:end,n)/10, citynames(n));
    end
        [Weibull_Model(n+1)] = est_parms_weibull(Influenza_US(1,21:end)'/10, 'US');
        [Weibull_Model(n+2)] = est_parms_weibull(Influenza_RUS(1,12:52)'/10,'England&Wales');        
        [Weibull_Model(n+3)] = est_parms_weibull(Influenza_RUS(1,55:80)'/10,'England&Wales');        

        
%%% 7. Model Uncertainty
    for n=1:11
        Parms(n,:) = [(Base_Model(n+1).lambda) (Base_Model(n+1).eta_zero)];
    end
    [g1,g2] = meshgrid(linspace(0.9*min(Parms(:,1)),1.1*max(Parms(:,1)),1000),linspace(0.9*min(Parms(:,2)),1.1*max(Parms(:,2)),1000));
    kdensity_estimate = mvksdensity(Parms,[g1(:),g2(:)],'Kernel','normal');
    rng(1001)
    randindexes = randsample(size(kdensity_estimate,1),1000000,true,kdensity_estimate);
    Rand_Parms = [g1(randindexes),g2(randindexes)];


%%% 8. Model Summary Table
% Base Model

   Obs = [sum(Influenza_UK(26:end,:)==Influenza_UK(26:end,:)), sum(Influenza_US(1,21:end)==Influenza_US(1,21:end)),sum(Influenza_RUS(1,12:52)==Influenza_RUS(1,12:52)),sum(Influenza_RUS(1,55:80)==Influenza_RUS(1,55:80))];
   Parameters =[];

    for n=1:12
        Parameters(:,n) = round([(Base_Model(n).lambda) (Base_Model(n).eta_zero) (Base_Model(n).dmin) (Base_Model(n).dmax)],3);
    end
    
    names = {'All Cities', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales 1848','England & Wales 1890'};
    
    for b =1:12
        T1(:,b) = table([Parameters(:,b);Obs(b)]);
    end
    T1.Properties.VariableNames = names;
    T1 = [table({ '\lambda', '\eta_{0}', 'd_{min}', 'd_{max}', 'Observations'}') T1];
    writetable(T1,'../Figures/Table_1.xlsx', 'Sheet', 'Base Model')

    % Model with common bounds
    for n=1:9
        Parameters(:,n) = round([(Common_Bounds_Model(n).lambda) (Common_Bounds_Model(n).eta_zero) (Common_Bounds_Model(n).dmin) (Common_Bounds_Model(n).dmax) ],3);
    end
    
    names = {'All Cities', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'};
    
    for b =1:9
        T2(:,b) = table([Parameters(:,b);Obs(b)]);
    end
    T2.Properties.VariableNames = names;
    T2 = [table({ '\lambda', '\eta_{0}', 'd_{min}', 'd_{max}', 'Observations'}') T2];
    writetable(T2,'../Figures/Table_1.xlsx', 'Sheet', 'Common Bounds Model')
    
    % Model with estimated bounds
    for n=1:12
        Parameters(:,n) = round([(Estimated_Bounds_Model(n).lambda) (Estimated_Bounds_Model(n).eta_zero) (Estimated_Bounds_Model(n).dmin) (Estimated_Bounds_Model(n).dmax) ],3);
    end
    
    names = {'All Cities', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales 1848','England & Wales 1890'};
    
    for b =1:12
        T3(:,b) = table([Parameters(:,b);Obs(b)]);
    end
    T3.Properties.VariableNames = names;
    T3 = [table({ '\lambda', '\eta_{0}', 'd_{min}', 'd_{max}', 'Observations' }') T3];
    writetable(T3,'../Figures/Table_1.xlsx', 'Sheet', 'Estimated Bounds Model')
     
    for n=1:12
        Parameters(:,n) = round([(Estimated_Bounds_Model_v2(n).lambda) (Estimated_Bounds_Model_v2(n).eta_zero) (Estimated_Bounds_Model_v2(n).dmin) (Estimated_Bounds_Model_v2(n).dmax) ],3);
    end
    
    names = {'All Cities', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales 1848','England & Wales 1890'};
    
    for b =1:12
        T3(:,b) = table([Parameters(:,b);Obs(b)]);
    end
    T3.Properties.VariableNames = names;
    T3 = [table({ '\lambda', '\eta_{0}', 'd_{min}', 'd_{max}', 'Observations' }') T3];
    writetable(T3,'../Figures/Table_1.xlsx', 'Sheet', 'Estimated Bounds Model v2')

    % Model with theoretical bounds
    for n=1:12
        Parameters(:,n) = round([(Theoretical_Bounds_Model(n).lambda) (Theoretical_Bounds_Model(n).eta_zero) (Theoretical_Bounds_Model(n).dmin) (Theoretical_Bounds_Model(n).dmax) ],3);
    end
    
    names = {'All Cities', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales 1848','England & Wales 1890'};
    
    for b =1:12
        T4(:,b) = table([Parameters(:,b);Obs(b)]);
    end
    T4.Properties.VariableNames = names;
    T4 = [table({ '\lambda', '\eta_{0}', 'd_{min}', 'd_{max}', 'Observations'}') T4];
    writetable(T4,'../Figures/Table_1.xlsx', 'Sheet', 'Theoretical Bounds Model')
    
   % Weibull
   Parameters =[];
    for n=1:12
        Parameters(:,n) = round([(Weibull_Model(n).lambda) (Weibull_Model(n).eta_zero)  ],3);
    end
    
    names = {'All Cities', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales 1848','England & Wales 1890'};
    
    for b =1:12
        T5(:,b) = table([Parameters(:,b);Obs(b)]);
    end
    T5.Properties.VariableNames = names;
    T5 = [table({ '\lambda', '\eta_{0}', 'Observations'}') T5];
    writetable(T5,'../Figures/Table_1.xlsx', 'Sheet', 'Weibull Model')

    %%% Save Results        

    save('Fitted_Models_v1')








