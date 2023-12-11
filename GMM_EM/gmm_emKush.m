
clc, clear, close all

load ClusterLabels
%%

paraminit = [25.2455, 28.917, 1.0394, 1.1672,length(find(dfKC(:,2)==2))/length(dfKC)];
%%
shift = 100;
eps = 0.01;
LabelUpdates = dfKC;
param = paraminit;

while shift>eps
    
    % Expectation
    LabelUpdates_ = expectationgmm(LabelUpdates,param);

    % maximization
    param_update_ = maximizationgmm(LabelUpdates_);

    shift = norm((param(1)-param_update_(1)) + (param(2)-param_update_(2)) );
    param = param_update_;
    LabelUpdates = LabelUpdates_;
end

%%
figure;
histogram(LabelUpdates(:,1),35,'Normalization', 'pdf','FaceColor',[0.54 0.81 0.94])
hold on
plotGaussian(LabelUpdates,param,'r','-')
hold on
plotGaussian(dfKC,paraminit,'k','--')
% xlabel('Temperature')
% ylabel('Probability')
% set(gca,'FontName','Times New Roman','FontSize',12)
FigSettings

set(gca, ...
  'Box'         , 'on'     , ...
 'ticklabelInterpreter','latex',...
   'FontSize'   , 12 , ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'XColor'      , [.3 .3 .3], ...
  'YColor'      , [.3 .3 .3], ...
    'LineWidth'   , 0.6 ,'XColor', 'black','YColor', 'black'); 
xlabel('Monthly Avg. Temperature ($^0C$)','Interpreter','latex');
ylabel('Probability ','Interpreter','latex');

yLimits = ylim;
line([21 21], yLimits, 'LineStyle', '--', 'Color', 'b');  % Add dashed line at x = 21
line([27 27], yLimits, 'LineStyle', '--', 'Color', 'b');  % Add dashed line at x = 27
xVals = [21, 27];
%line(repmat(xVals, 2, 1), [yLimits(1); yLimits(2)], 'LineStyle', '--', 'Color', 'b');  % Add dashed lines
hold off;
% %%
% figure
% plotHistograms(LabelUpdates,param)