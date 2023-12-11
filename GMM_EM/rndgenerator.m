

% generate random numbers from beta distr
n=1000000;
Rbeta = betarnd(0.77897,5.27087,n,1);
Rnor = normrnd(24)
Rcdf = betacdf(R,0.77897,5.27087);

%%
cpairs = nnz(sign(R(2:end) - R(1:end-1)) == sign(B(2:end) - B(1:end-1)))
%%
figure;
histogram(R)

figure;
histogram(Rcdf,'normalization','pdf')