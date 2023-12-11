clc, clear, close all

load ClusterLabels
%%

paraminit = [25.2455, 28.917, 1.0394, 1.1672,length(find(dfKC(:,2)==2))/length(dfKC)];
%%
shift = 100;
eps = 0.01;
LabelUpdates = dfKC;
param = paraminit;

while shift > eps
    
    % Expectation
    LabelUpdates_ = expectationgmm(LabelUpdates, param);

    % Maximization
    param_update_ = maximizationgmm(LabelUpdates_);

    shift = norm((param(1)-param_update_(1)) + (param(2)-param_update_(2)));
    param = param_update_;
    LabelUpdates = LabelUpdates_;
end

%%
figure;
histogram(LabelUpdates(:,1), 35, 'Normalization', 'pdf', 'FaceColor', [0.54 0.81 0.94])
hold on
% Plot the combined Gaussian distribution
plotGaussian(LabelUpdates, param, 'k', '-')
% Plot individual Gaussian distributions with dashed lines
x_vals = linspace(min(LabelUpdates(:,1)), max(LabelUpdates(:,1)), 100);
gaussian1 = 0.31*normpdf(x_vals, param(1), param(3));
gaussian2 = 0.69*normpdf(x_vals, param(2), param(4));

plot(x_vals, gaussian1, '--', 'LineWidth', 2, 'Color', 'b');
plot(x_vals, gaussian2, '--', 'LineWidth', 2, 'Color', 'r');



% Plot dashed lines
yLimits = ylim;
% line([21 21], yLimits, 'LineStyle', '--', 'Color', 'b');  % Add dashed line at x = 21
% line([27 27], yLimits, 'LineStyle', '--', 'Color', 'b');  % Add dashed line at x = 27

% Add labels and adjust settings
xlabel('Monthly Avg. Temperature ($^0C$)', 'Interpreter', 'latex');
ylabel('Probability', 'Interpreter', 'latex');
FigSettings;

% Customize axis settings
set(gca, ...
    'Box'                  , 'on'      , ...
    'ticklabelInterpreter', 'latex'    , ...
    'FontSize'            , 12        , ...
    'TickDir'             , 'out'     , ...
    'TickLength'          , [.02 .02] , ...
    'XMinorTick'          , 'on'      , ...
    'YMinorTick'          , 'on'      , ...
    'XColor'              , [.3 .3 .3], ...
    'YColor'              , [.3 .3 .3], ...
    'LineWidth'           , 0.6       , 'XColor', 'black', 'YColor', 'black');

legend('Histogram', 'Gaussian 1 with mean 24.8586 and std 0.8015', 'Gaussian 2 with mean  28.6589 and std 1.3191', 'GMM', 'Location', 'Best', 'Interpreter', 'latex');
