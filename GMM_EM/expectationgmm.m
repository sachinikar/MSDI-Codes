
function LabelUpdates = expectationgmm(dfKC,param)

point = dfKC(:,1);
LabelUpdates = dfKC;

mu=param(1:2);
sigma = param(3:4);
w = param(end);

for ii=1:length(dfKC)
    cluster_1 =      w*normpdf(point(ii), mu(1), sigma(1)); %label==2
    cluster_2 =  (1-w)*normpdf(point(ii), mu(2), sigma(2)); %label==1
    
    % update labels
    if cluster_1>cluster_2
        LabelUpdates(ii,2)=2;
    else
        LabelUpdates(ii,2)=1;
    end
end

end