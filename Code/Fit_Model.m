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
Influenza_US = [267,365,104,192,218,205,102,250,211,133,142,158,100,123,89,157,270,174,3018,990,705,113,310,441,190,291,400,223,448,551,194,265,306,264,173,222,264,295,127,164,153,158,81,128,130,77,63,53,34,31,44;1900:1:1950];
citynames = {'All', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'};
years = 1895:1950;
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
        dmax_RUS = max(Influenza_RUS(1,1:80)');
        dmin_RUS = min(Influenza_RUS(1,54:80)');
        [Base_Model(n+2)] = est_parms_bpareto(Influenza_RUS(1,55:80)',dmax_RUS,dmin_RUS, 'England&Wales');

%%% 3. Estimate Model with common Bounds
    dmax_UK = (max(dmax_UK));
    dmin_UK = (min(dmin_UK));
    for n = 1:size(Influenza_UK,2)
        [Common_Bounds_Model(n)] = est_parms_bpareto(Influenza_UK(26:end,n),dmax_UK,dmin_UK, citynames(n));
    end
        dmax_US = max(Influenza_US(1,:)');
        dmin_US = min(Influenza_US(1,:)');
        [Common_Bounds_Model(n+1)] = est_parms_bpareto(Influenza_US(1,21:end)',dmax_US,dmin_US, 'US');
        dmax_RUS = max(Influenza_RUS(1,1:80)');
        dmin_RUS = min(Influenza_RUS(1,54:80)');
        [Common_Bounds_Model(n+2)] = est_parms_bpareto(Influenza_RUS(1,55:80)',dmax_RUS,dmin_RUS, 'England&Wales');
        
%%% 4. Estimate Model with theoretical Bounds

    for n = 1:size(Influenza_UK,2)
        [Theoretical_Bounds_Model(n)] = est_parms_bpareto(Influenza_UK(26:end,n),1000000,1, citynames(n));
    end
        dmax_US = max(Influenza_US(1,:)');
        dmin_US = min(Influenza_US(1,:)');
        [Theoretical_Bounds_Model(n+1)] = est_parms_bpareto(Influenza_US(1,21:end)',1000000,1, 'US');
        dmax_RUS = max(Influenza_RUS(1,1:80)');
        dmin_RUS = min(Influenza_RUS(1,54:80)');
        [Theoretical_Bounds_Model(n+2)] = est_parms_bpareto(Influenza_RUS(1,55:80)',1000000,1, 'England&Wales');        
        
%%% 5. Estimate Model with estimated Bounds

    for n = 1:size(Influenza_UK,2)
        [Estimated_Bounds_Model(n)] = est_parms_bpareto(Influenza_UK(26:end,n),[],[], citynames(n));
    end
        dmax_US = max(Influenza_US(1,:)');
        dmin_US = min(Influenza_US(1,:)');
        [Estimated_Bounds_Model(n+1)] = est_parms_bpareto(Influenza_US(1,21:end)',[],[], 'US');
        dmax_RUS = max(Influenza_RUS(1,1:80)');
        dmin_RUS = min(Influenza_RUS(1,54:80)');
        [Estimated_Bounds_Model(n+2)] = est_parms_bpareto(Influenza_RUS(1,55:80)',[],[], 'England&Wales');        
        
        
%%% 6. Estimate Weibull Model 
%%% Deaths need to be rescaled for Weibull Distribution
    for n = 1:size(Influenza_UK,2)
        [Weibull_Model(n)] = est_parms_weibull(Influenza_UK(26:end,n)/10, citynames(n));
    end
        [Weibull_Model(n+1)] = est_parms_weibull(Influenza_US(1,21:end)'/10, 'US');
        [Weibull_Model(n+2)] = est_parms_weibull(Influenza_RUS(1,55:80)'/10,'England&Wales');        

        
%%% 7. Model Uncertainty
    for n=1:10
        Parms(n,:) = [log(Base_Model(n+1).lambda) log(Base_Model(n+1).eta_zero)];
    end
    myu = mean(Parms)';
    sig = cov(Parms);
    rng(1001)
    Rand_Parms = exp(mvnrnd(myu,sig,1000000));
    Table_2 = table({'log(\lambda)','log(\eta_{0}'}',myu, sig, 'VariableNames',{'Parameter', 'Mean', 'Variance Covariance'});
    writetable(Table_2,'../Figures/Table_3.xlsx')

%%% 8. Model Summary Table
% Base Model

   Obs = [sum(Influenza_UK(26:end,:)==Influenza_UK(26:end,:)), sum(Influenza_US(1,21:end)==Influenza_US(1,21:end)),sum(Influenza_RUS(1,55:80)==Influenza_RUS(1,55:80))];
   Parameters =[];

    for n=1:11
        Parameters(:,n) = round([(Base_Model(n).lambda) (Base_Model(n).eta_zero) (Base_Model(n).dmin) (Base_Model(n).dmax)],3);
    end
    
    names = {'All Cities', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales'};
    
    for b =1:11
        T1(:,b) = table([Parameters(:,b);Obs(b)]);
    end
    T1.Properties.VariableNames = names;
    T1 = [table({ '\lambda', '\eta_{0}', 'd_{min}', 'd_{max}', 'Observations'}') T1];
    writetable(T1,'../Figures/Table_1.xlsx', 'Sheet', 'Base Model')

    % Model with common bounds
    for n=1:11
        Parameters(:,n) = round([(Common_Bounds_Model(n).lambda) (Common_Bounds_Model(n).eta_zero) (Common_Bounds_Model(n).dmin) (Common_Bounds_Model(n).dmax) ],3);
    end
    
    names = {'All Cities', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales'};
    
    for b =1:11
        T2(:,b) = table([Parameters(:,b);Obs(b)]);
    end
    T2.Properties.VariableNames = names;
    T2 = [table({ '\lambda', '\eta_{0}', 'd_{min}', 'd_{max}', 'Observations'}') T2];
    writetable(T2,'../Figures/Table_1.xlsx', 'Sheet', 'Common Bounds Model')
    
    % Model with estimated bounds
    for n=1:11
        Parameters(:,n) = round([(Estimated_Bounds_Model(n).lambda) (Estimated_Bounds_Model(n).eta_zero) (Estimated_Bounds_Model(n).dmin) (Estimated_Bounds_Model(n).dmax) ],3);
    end
    
    names = {'All Cities', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales'};
    
    for b =1:11
        T3(:,b) = table([Parameters(:,b);Obs(b)]);
    end
    T3.Properties.VariableNames = names;
    T3 = [table({ '\lambda', '\eta_{0}', 'd_{min}', 'd_{max}', 'Observations' }') T3];
    writetable(T3,'../Figures/Table_1.xlsx', 'Sheet', 'Estimated Bounds Model')
    
    % Model with theoretical bounds
    for n=1:11
        Parameters(:,n) = round([(Theoretical_Bounds_Model(n).lambda) (Theoretical_Bounds_Model(n).eta_zero) (Theoretical_Bounds_Model(n).dmin) (Theoretical_Bounds_Model(n).dmax) ],3);
    end
    
    names = {'All Cities', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales'};
    
    for b =1:11
        T4(:,b) = table([Parameters(:,b);Obs(b)]);
    end
    T4.Properties.VariableNames = names;
    T4 = [table({ '\lambda', '\eta_{0}', 'd_{min}', 'd_{max}', 'Observations'}') T4];
    writetable(T4,'../Figures/Table_1.xlsx', 'Sheet', 'Theoretical Bounds Model')
    
   % Weibull
   Parameters =[];
    for n=1:11
        Parameters(:,n) = round([(Weibull_Model(n).lambda) (Weibull_Model(n).eta_zero)  ],3);
    end
    
    names = {'All Cities', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales'};
    
    for b =1:11
        T5(:,b) = table([Parameters(:,b);Obs(b)]);
    end
    T5.Properties.VariableNames = names;
    T5 = [table({ '\lambda', '\eta_{0}', 'Observations'}') T5];
    writetable(T5,'../Figures/Table_1.xlsx', 'Sheet', 'Weibull Model')

    %%% Save Results        

    save('Fitted_Models_unrestricted')








