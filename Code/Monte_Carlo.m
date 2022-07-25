%% Monte Carlo
clear
clc
close all
parpool([16,512], 'IdleTimeout', Inf)

Estimates = [   0.0739027148311974	2.46957448017046	21.9770559535845	3643.76590330789
                0.161090746921530	4.85658149243284	26.8408338552384	2496.55172400000
                0.133579589400983	4.91676992627080	12.7053502229789	2671.04056678456
                0.142411556223517	4.46644573932360	24	1812
                0.197314123909589	6.44529250546731	19	1775.05409566877
                0.0935593818955792	2.99990202383624	23.1179608772970	4458.14912508823
                0.135710770559580	4.44222570529841	23.0880230880231	3066.95483826394
                0.116873920575080	4.26429572435549	11.6640746500778	4550
                0.246284576547407	7.42993066165011	14	3018
                0.187132101850811	5.95147209645256	2	459
                0.111090567436365	2.03918214332711	113	574];

for j = 1:11
	trueparms = [Estimates(j,1),Estimates(j,2)];
	dmin = Estimates (j,3);
	dmax = Estimates (j,4);
	alpha = 1./(exp(trueparms(2))*exp(-trueparms(1)*[0:36]));
	

    rng(1001) %% Seed
	Simulation = simulate_bpareto(10000,alpha, dmax, dmin);
	parfor i = 1:10000
    		theta_hat(i,:,j) = est_parms_bpareto(Simulation(i,:)',dmax,dmin)
    end
    	Sim{j} = Simulation;
    save("MC_save_v2.mat", 'theta_hat','Estimates','Sim', '-v7.3')
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
problem = createOptimProblem('fmincon', 'objective',@(y)bpareto_ll(y,x,dmax,dmin), 'lb',[0,-36.5], 'ub', [2,36.5], 'x0',[0,0], 'options', options);
[theta_hat] = run(ms,problem,1000);
end

