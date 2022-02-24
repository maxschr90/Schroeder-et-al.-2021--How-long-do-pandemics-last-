%% This Function fits the model using the Weibull distribution
%% x is a vector of mortality rates 
function [Calibrated_Model] = est_parms_weibull(x, name)
    ms = MultiStart('UseParallel', true);
%     options = optimset('Algorithm', 'sqp', 'UseParallel', true,'Display', 'off','MaxIter', 1000,  'MaxFunEvals',1000000, 'TolFun', 1e-12, 'TolX', 1e-12, 'FinDiffType', 'central');
%     problem = createOptimProblem('fmincon', 'objective',@(y)weibull_ll(y,x), 'lb',[0,0], 'ub', [10,1], 'x0',[0.25,.5], 'options', options);
    options = optimset('Algorithm', 'sqp', 'UseParallel', true,'Display', 'off','MaxIter', 1000,  'MaxFunEvals',1000000, 'TolFun', 1e-12, 'TolX', 1e-12, 'FinDiffType', 'central');
    problem = createOptimProblem('fminunc', 'objective',@(y)weibull_ll(y,x), 'x0',[0.1,.9], 'options', options);

    [theta_hat,Fval] = run(ms,problem,1000);
    t = [1:size(x,1)]'-1;
    w = theta_hat(2)*exp(-t*theta_hat(1));
    SE = se_weibull(theta_hat,x);
    Calibrated_Model = struct('Model', name,'lambda', theta_hat(1),'eta_zero', theta_hat(2), 'w', w,  'LL',-Fval,'Problem', problem, 'SE', SE);

end
