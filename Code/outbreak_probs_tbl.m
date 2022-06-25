X500(:,1) = [1920:1956]';
X1000(:,1) = [1920:1956]';

for n=2:9
    X500(:,n)= bpareto_outbreakprob(Estimated_Bounds_Model(n).alpha',Estimated_Bounds_Model(n).dmax,Estimated_Bounds_Model(n).dmin,500);
    X1000(:,n)= bpareto_outbreakprob(Estimated_Bounds_Model(n).alpha',Estimated_Bounds_Model(n).dmax,Estimated_Bounds_Model(n).dmin,1000);
end

    names = {'Year', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'};
for n=1:9
    T500(:,n) = table(X500(:,n));
    T1000(:,n) = table(X1000(:,n));
end
    T500.Properties.VariableNames = names;
    T1000.Properties.VariableNames = names;
    writetable(T500,'outbreak_probs.xlsx', 'Sheet', 'Estimated_Bounds Model 500 dpm')
    writetable(T1000,'outbreak_probs.xlsx', 'Sheet', 'Estimated_Bounds Model 1000 dpm')


    X500(:,1) = [1920:1956]';
X1000(:,1) = [1920:1956]';

for n=2:9
    X500(:,n)= weibull_outbreakprob(Weibull_Model(n).w',50);
    X1000(:,n)= weibull_outbreakprob(Weibull_Model(n).w',100);
end

    names = {'Year', 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'};
for n=1:9
    T500(:,n) = table(X500(:,n));
    T1000(:,n) = table(X1000(:,n));
end
    T500.Properties.VariableNames = names;
    T1000.Properties.VariableNames = names;
    writetable(T500,'outbreak_probs.xlsx', 'Sheet', 'Weibull 500 dpm')
    writetable(T1000,'outbreak_probs.xlsx', 'Sheet', 'Weibull 1000 dpm')