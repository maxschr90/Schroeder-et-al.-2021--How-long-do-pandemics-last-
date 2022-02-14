%% Monte Carlo
clear
clc
close all
parpool([16,512], 'IdleTimeout', Inf)

Estimates =    [0.150617553971732	76.8669383806189	23.8280657383188	3059.18953163917;
		        0.119267149136169	24.8592044966167	21.9770559535845	3643.76590330789;
		        0.144431951234614	58.4423274611897	30.1067420900000	2496.55172400000;
		        0.183709228798927	360.213938409462	12.7053502229789	2671.04056678456;
		        0.166038308471649	74.1188815521203	33	1812;
		        0.165756440768836	126.777678233360	22.7330133872190	1775.05409566877;
		        0.110259436540265	26.3524691693484	23.1179608772970	4458.14912508823;
		        0.179699268112802	208.861452845524	23.0880230880231	3066.95483826394;
		        0.169071731480011	202.689754444945	11.6640746500778	4550;
		        0.278318235644804	802.709364302635	31	3018;
		        0.111090567751803	7.68432200913448	113	574];

for j = 1:11
	trueparms = [Estimates(j,1),Estimates(j,2)];
	dmin = Estimates (j,3);
	dmax = Estimates (j,4);
	alpha = 1./(trueparms(2)*exp(-trueparms(1)*[0:30]));
	

    rng(1001) %% Seed
	Simulation = simulate_bpareto(100000,alpha, dmax, dmin);
	parfor i = 1:100000
    		theta_hat(i,:,j) = est_parms_bpareto(Simulation(i,:)',dmax,dmin)
    end
    
    save("MC_save_v1.mat", 'theta_hat','Estimates', '-v7.3')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% This Function fits the model of the bounded pareto distribution
%% x is a vector of mortality rates 
%% dmin and dmax are the bounds of the bounded pareto distribution
%% if no bounds are supplied the function will fit them as well
function [theta_hat] = est_parms_bpareto(x,dmax,dmin)
ms = MultiStart('UseParallel', true);
options = optimset('Algorithm', 'sqp', 'UseParallel', true,'Display', 'off','MaxIter', 1000,  'MaxFunEvals',1000000, 'TolFun', 1e-12, 'TolX', 1e-12, 'FinDiffType', 'central');
problem = createOptimProblem('fmincon', 'objective',@(y)bpareto_ll(y,x,dmax,dmin), 'lb',[0,0], 'ub', [2,10000], 'x0',[0,2.5], 'options', options);
[theta_hat] = run(ms,problem,1000);
end
%% This function simulates random draws from a bounded pareto distribution
%% N is the number of sequences
%% alpha is sequence of tail parameters
%% dmin and dmax are the bounds of the bounded pareto distribution
function [draws] = simulate_bpareto(N,alpha,dmax,dmin)
T = size(alpha,2);
%% Draw from a uniform distribution
U = rand(N,T);
%% invert CDF to obtain random draw
draws = (-(U.*dmax.^alpha-U.*dmin.^alpha-dmax.^alpha)./((dmin*dmax).^alpha)).^(-1./alpha);

end


%% This function evaluates the average log likelihood of the bounded pareto 
function ll = bpareto_ll(y,x,dmax,dmin)
%% Construct path of tail parameter    
    ozero = y(2);
    lambda = y(1);
    t = [1:size(x,1)]'-1;
    alpha = 1./(ozero*exp(-t*lambda));
%% Replace missing values & calculate likelihood
    x(isnan(x))=pi;
    lik = (alpha.*dmin.^alpha.*x.^(-alpha-1))./(1-(dmin/dmax).^alpha);
%% Drop missing values
    lik(x==pi)=[];
%% Calculate average ll
    ll = - mean(log(lik));

end
