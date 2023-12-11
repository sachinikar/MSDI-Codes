clc;
close all; 
clear;
%% 
%format long;

%% 
%Load NC data set
load 'NC';

%Read data
R=NC(:,1);

T=NC(:,2);

%% 
%Rescaling the rainfall data
R_s=(R-min(R))/(max(R)-min(R));
R_s = double(R_s);

%% 
% Estimate the parameters using the method of moments
mean_R_scale = mean(R_s);
var_R_scale = var(R_s);
a = (((mean_R_scale*(1-mean_R_scale))/var_R_scale)-1)*mean_R_scale;
b = (((mean_R_scale*(1-mean_R_scale))/var_R_scale)-1)*(1-mean_R_scale);

%% 
%Estimated parameters
a=0.56390675;
b=  2.5553623;

%% 
%Calling the beta_pdf function
pb = pdf_br(R, a, b);

%% 
pb(~isfinite(pb))=10000000000;

%% 

% Calculate the log-likelihood of the fitted distribution
ll =log(pb+1e-10);

%% 
ll_new=sum(ll(:));

%% 

% Get number of parameters in model
k = length([a,b]);
% Calculate AIC
AIC = 2 * k - 2 * ll_new;

%% 
% Define the range of x values
x = linspace(min(R), max(R), 50);

%% 

% Plot the histogram of the data
histogram(R, 'Normalization', 'pdf', 'NumBins', 18,'FaceColor',[0.54 0.81 0.94],'EdgeColor','black');
% Overlay the beta PDF on the histogram
hold on;
% Plot the PDF
pdf = ((x - 0).^(a-1) .* (18.41 - x).^(b-1)) ./ (18.41-0).^(a+b-1)./beta(a, b);

plot(x, pdf,'LineWidth',2,'Color', 'blue');
xlabel('Monthly Avg. Rainfall (mm/day)', 'Interpreter', 'latex', 'FontSize', 14, 'FontWeight', 'bold')
ylabel('Probability', 'Interpreter', 'latex', 'FontSize', 14, 'FontWeight', 'bold')
% xlim([0,19])
% ylim([0,0.33])
hold on;
% yLimits = ylim;
line([2.73 2.73], yLimits, 'LineStyle', '--', 'LineWidth', 2,'Color', 'black');  % Add dashed line at x = 2.73
line([4.11 4.11], yLimits, 'LineStyle', '--', 'LineWidth', 2,'Color', 'black');  % Add dashed line at x = 4.11
% xVals = [2.73, 4.11];

% Set plot properties
set(gca, ...
    'Box', 'on', ...
    'ticklabelInterpreter', 'latex', ...
    'FontSize', 14, ...
    'TickDir', 'out', ...
    'TickLength', [.02 .02], ...
    'XMinorTick', 'on', ...
    'YMinorTick', 'on', ...
    'XColor', [0.3 0.3 0.3], ...
    'YColor', [0.3 0.3 0.3], ...
    'LineWidth', 0.6, 'XColor', 'black', 'YColor', 'black');
    
hold off;






