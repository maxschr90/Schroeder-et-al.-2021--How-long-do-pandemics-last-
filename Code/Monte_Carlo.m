%% Monte Carlo
clear
clc
close all
load('Monte_Carlo_Input.mat')
parpool([16,512], 'IdleTimeout', Inf)

for j = 1:14
	Estimates(j,:) = [Base_Model(j).lambda, Base_Model(j).eta_zero];

    rng(1001) %% Seed
	Simulation = simulate_bpareto(1000,Base_Model(j).alpha', Base_Model(j).dmax, Base_Model(j).dmin);
	parfor i = 1:1000
    		theta_hat(i,:,j) = est_parms_bpareto(Simulation(i,:)',dmax,dmin)
    end
    	Sim{j} = Simulation;
    save("MC_output_v1.mat", 'theta_hat','Estimates','Sim', '-v7.3')
end

