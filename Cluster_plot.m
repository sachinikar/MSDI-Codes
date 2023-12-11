clc;
%% 

% Load Data
path = 'E:\Research 1 - Copula with index\Matlab codes';
filename = 'original_dataset.xlsx';
fullpath = fullfile(path, filename);
data = xlsread(fullpath, 'C2:D493');
%% 

R = data(:, 1);
T = data(:, 2);
%% 

% Perform k-means clustering
k = 3; % Number of clusters
[idx, centroids] = kmeans(data, k);

% Plot the clusters
figure;
gscatter(data(:, 1), data(:, 2), idx);
hold on;
%plot(centroids(:, 1), centroids(:, 2), 's', 'filled', 'MarkerSize', 10);
plot(centroids(:, 1), centroids(:, 2), 's', 'MarkerFaceColor', 'black', 'MarkerSize', 8);

legend({'Cluster 1', 'Cluster 2', 'Cluster 3', 'Centroids'},'Interpreter', 'latex', 'FontSize', 12);
hold off;
set(gca, ...
  'Box'         , 'on'     , ...
 'ticklabelInterpreter','latex',...
   'FontSize'   , 12 , ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'XColor'      , [.1 .1 .1], ...
  'YColor'      , [.1 .1 .1], ...
    'LineWidth'   , 0.6 ,'XColor', 'black','YColor', 'black'); 
xlabel('Monthly Avg. Rainfall (mm/day) ','Interpreter','latex');
ylabel('Monthly Avg. Temperature ($^0C$) ','Interpreter','latex');
