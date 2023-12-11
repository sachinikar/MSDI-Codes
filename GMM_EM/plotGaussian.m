
function plotGaussian(Label_updates,param,colorstr,ls)

x = min(Label_updates(:,1))-1:0.1:max(Label_updates(:,1));



mu1 = param(1);
mu2 = param(2);
sigma1 = param(3);
sigma2 = param(4);
w1 = param(5);
w2=1-w1;


%%
for i = 1:length(x)
    L1(i) = (1 / ( sqrt(2 * pi * sigma1^2) )) * exp(-0.5 * ((x(i) - mu1) / sigma1)^2);
    L2(i) = (1 / ( sqrt(2 * pi * sigma2^2) )) * exp(-0.5 * ((x(i) - mu2) / sigma2)^2);
    L(i) = w1*L1(i) + w2*L2(i);
    
end

% figure;
plot(x,L,'LineWidth',2,'Color',colorstr,'LineStyle',ls)

end
