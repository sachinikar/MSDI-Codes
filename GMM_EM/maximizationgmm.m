
function param_update = maximizationgmm(LabelUpdates)

pointsin_cluster1 = LabelUpdates((LabelUpdates(:,2)==1),:);
pointsin_cluster2 = LabelUpdates((LabelUpdates(:,2)==2),:);

%weight update
w_update = size(pointsin_cluster2,1)/size(LabelUpdates,1);

%mean update
mu_update = [mean(pointsin_cluster2(:,1)),mean(pointsin_cluster1(:,1))];

%sigma update
sigma_update = [std(pointsin_cluster2(:,1)),std(pointsin_cluster1(:,1))];

param_update = [mu_update,sigma_update,w_update];
end