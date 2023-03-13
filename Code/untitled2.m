clear
clc
close all
%%% 1. Load Data & Prepare Data
Load_Data % Loads data for Cities cities from excel file

%%% 2. Estimate Base Model
    dmax_Cities = (max(Resp(24:56,2:end)));
    dmin_Cities = (min(Resp(24:56,2:end)));
    for n = 1:8
        [Base_Model(n)] = est_parms_bpareto(Resp(26:56,n+1),dmax_Cities(n),dmin_Cities(n), citynames(n));
    end