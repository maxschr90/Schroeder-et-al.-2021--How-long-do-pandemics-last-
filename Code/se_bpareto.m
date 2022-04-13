%% This function calculates numerical standard errors for the bounded pareto estimates

function [SE, HESS] = se_bpareto(theta_hat,x)
    %% Setup
    syms etazero lambda 
    dmax = max(x);
    dmin = min(x);
    t = [1:size(x,1)]'-1;
    alpha = 1./(exp(etazero).*exp(-t.*lambda));
    %% Replace missing values & calculate likelihood
    x(isnan(x))=pi;
    lik = (alpha.*(dmin.^alpha).*x.^(-alpha-1))./(1-(dmin/dmax).^alpha);
    %% Drop missing values
    lik(x==pi)=[];
    %% Calculate average ll
    ll = -mean(log(lik));
    %% Calculate and evaluate symbolic hessian
    variables=[lambda etazero];
    vF=ll;
    H_n = hessian(vF,variables);
    A_n = subs(H_n,variables,theta_hat);
    B_n = double(A_n);
    SE = sqrt(diag(inv(B_n)/sum(~isnan(x))));
    HESS = ((inv(B_n)/sum(~isnan(x))));
    if ~isreal(SE) ==1
        [L,D]=ldlt(pinv(B_n));
        V =L*D*L'/sum(~isnan(x));
        S = (V'*V);
        SE = sqrt(diag(sqrt(S)))';
        HESS = ((sqrt(S)))';
    end
end
