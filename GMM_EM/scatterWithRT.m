clc;
close all;
clear;
%% 

% Load NC data set
path = 'E:\Drought Index\other';
filename = 'NC.xlsx';
fullpath = fullfile(path, filename);
data = xlsread(fullpath, 'A2:B493');

% Read data
R = data(:,1);
T = data(:,2);
%% 

% Create histograms on the right side
ax1 = axes('Position',[0.7 0.2 0.3 0.9]);

% Load ClusterLabels and perform the GMM fitting (as you've done before)
load ClusterLabels
paraminit = [25.2455, 28.917, 1.0394, 1.1672, length(find(dfKC(:,2)==2))/length(dfKC)];

shift = 100;
eps = 0.01;
LabelUpdates = dfKC;
param = paraminit;

while shift > eps
    % Expectation
    LabelUpdates_ = expectationgmm(LabelUpdates,param);

    % Maximization
    param_update_ = maximizationgmm(LabelUpdates_);

    shift = norm((param(1)-param_update_(1)) + (param(2)-param_update_(2)));
    param = param_update_;
    LabelUpdates = LabelUpdates_;
end

% Plot the histogram of the fitted data
histogram(LabelUpdates(:,1),35,'Normalization', 'pdf','FaceColor',[0.54 0.81 0.94])
hold on
plotGaussian(LabelUpdates,param,'r','-')
hold on
plotGaussian(dfKC,paraminit,'k','--')
xlabel('Monthly Avg. Temperature ($^0C$)', 'Interpreter', 'latex');
ylabel('Probability', 'Interpreter', 'latex');
FigSettings

% Set plot properties for the histogram axes
set(ax1, ...
    'Box', 'on', ...
    'ticklabelInterpreter', 'latex', ...
    'FontSize', 10, ...
    'TickDir', 'out', ...
    'TickLength', [.02 .02], ...
    'XMinorTick', 'on', ...
    'YMinorTick', 'on', ...
    'XColor', [0.3 0.3 0.3], ...
    'YColor', [0.3 0.3 0.3], ...
    'LineWidth', 0.6, 'XColor', 'black', 'YColor', 'black');

% Rainfall histogram at the bottom
ax2 = axes('Position',[0.1 0.1 0.7 0.1]);
a=0.56390675;
b=  2.5553623;
x = linspace(min(R), max(R), 50);

% Plot the histogram of the data
histogram(R, 'Normalization', 'pdf', 'NumBins', 18,'FaceColor',[0.54 0.81 0.94],'EdgeColor','black');
% Overlay the beta PDF on the histogram
hold on;
% Plot the PDF
pdf = ((x - 0).^(a-1) .* (18.41 - x).^(b-1)) ./ (18.41-0).^(a+b-1)./beta(a, b);

plot(x, pdf,'LineWidth',2,'Color', 'blue');
xlabel('Monthly Avg. Rainfall (mm/day)', 'Interpreter', 'latex', 'FontSize', 14, 'FontWeight', 'bold')
ylabel('Probability', 'Interpreter', 'latex', 'FontSize', 14, 'FontWeight', 'bold')
ylim([0,0.3])
hold on;
yLimits = ylim;
line([2.73 2.73], yLimits, 'LineStyle', '--', 'LineWidth', 2,'Color', 'black');  % Add dashed line at x = 2.73
line([4.11 4.11], yLimits, 'LineStyle', '--', 'LineWidth', 2,'Color', 'black');  % Add dashed line at x = 4.11

% Set plot properties
set(gca, ...
    'Box', 'on', ...
    'ticklabelInterpreter', 'latex', ...
    'FontSize', 10, ...
    'TickDir', 'out', ...
    'TickLength', [.02 .02], ...
    'XMinorTick', 'on', ...
    'YMinorTick', 'on', ...
    'XColor', [0.3 0.3 0.3], ...
    'YColor', [0.3 0.3 0.3], ...
    'LineWidth', 0.6, 'XColor', 'black', 'YColor', 'black');

% Create scatter plot
ax_scatter = axes('Position', [0.1 0.2 0.6 0.6]); % Adjust the position values as needed
scatter(R, T, 'filled', 'black');
xlabel('Monthly Avg. Rainfall (mm/day)', 'Interpreter', 'latex');
ylabel('Monthly Avg. Temperature ($^0C$)', 'Interpreter', 'latex');
