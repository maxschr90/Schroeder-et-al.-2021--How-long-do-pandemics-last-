%% This function calculates numerical standard errors for the weibull estimates

function [SE] = se_weibull(theta_hat,x)
%% Setup
    syms etazero lambda 
%% Construct path of tail parameter    
    t = [1:size(x,1)]'-1;
    w = etazero(2)*exp(-t*lambda(1));
%% Replace missing values & calculate likelihood
    x(isnan(x))=pi;
    lik = (((log(w).^3)./(log(w)-2)).*(x.*(x+1)).*w.^x);
%% Drop missing values
    lik(x==pi)=[];
%% Calculate average ll
    ll=-mean(log(lik));
%% Calculate and evaluate symbolic hessian
    variables=[lambda etazero];
    vF=ll;
    H_n = hessian(vF,variables);
    A_n = subs(H_n,variables,theta_hat);
    B_n = double(A_n);
    SE = sqrt(diag(inv(B_n)/sum(~isnan(x))));
    
end