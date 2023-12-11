clc;clear;
close all;

%% read data

load('data.mat')

%columns
%  1. index
%  2. rainfall
%  3. temperature
%% 
year = data(:, 7);
MSDI = data(:, 10);
%% 
figure;
bar(MSDI);
xlabel('Year-Month');
ylabel('MSDI');
%xticks([14:48:493]);
%xticklabels({'1982','1986','1990','1994','1998','2002','2006','2010','2014','2018'});
set(gca, ...
  'Box'         , 'on'     , ...
   'FontSize'   ,14 , ...
  'TickDir'     , 'out'     , ...
  'FontName'   , 'Times New Roman',...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'XColor'      , [.1 .1 .1], ...
  'YColor'      , [.1 .1 .1], ...
    'LineWidth'   , 0.5         );
%% 
%%%%%%%%%%%%%%%%%%%% 3 months %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path = 'E:\Drought Index\Index';
filename = '3_months_dataset.xlsx';
fullpath = fullfile(path, filename);
[~, ~, data] = xlsread(fullpath, 'A2:H491');
%% 
MSDI = cell2mat(data(:, 6));
%% 

figure;
bar(MSDI);
hold on;
% Add horizontal line at -3
line([0, length(MSDI)+1], [-3, -3], 'Color', 'r', 'LineStyle', '--', 'LineWidth', 1.5);
hold off;
line([0, length(MSDI)+1], [-2, -2], 'Color', 'g', 'LineStyle', '--', 'LineWidth', 1.5);
hold off;
line([0, length(MSDI)+1], [-1.3, -1.3], 'Color', 'blue', 'LineStyle', '--', 'LineWidth', 1.5);
hold off;
xlabel('3 Months Average');
ylabel('MSDI');
set(gca, ...
  'Box'         , 'on'     , ...
   'FontSize'   ,12 , ...
  'TickDir'     , 'out'     , ...
  'FontName'   , 'Times New Roman',...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'XColor'      , [.1 .1 .1], ...
  'YColor'      , [.1 .1 .1], ...
    'LineWidth'   , 0.5         );
% Add horizontal line at -3
%% 

%%%%%%%%%%%%%%%%%%%% 6 months %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path = 'E:\Drought Index\Index';
filename = '6_months.xlsx';
fullpath = fullfile(path, filename);
[~, ~, data] = xlsread(fullpath, 'A2:H491');
%% 
MSDI = cell2mat(data(:, 6));
%% 

figure;
bar(MSDI);
hold on;
% Add horizontal line at -3
line([0, length(MSDI)+1], [-2.1, -2.1], 'Color', 'r', 'LineStyle', '--', 'LineWidth', 1.5);
hold off;
line([0, length(MSDI)+1], [-1.5, -1.5], 'Color', 'g', 'LineStyle', '--', 'LineWidth', 1.5);
hold off;
line([0, length(MSDI)+1], [-1.2, -1.2], 'Color', 'blue', 'LineStyle', '--', 'LineWidth', 1.5);
hold off;
xlabel('6 Months Average');
ylabel('MSDI');
set(gca, ...
  'Box'         , 'on'     , ...
   'FontSize'   ,12 , ...
  'TickDir'     , 'out'     , ...
  'FontName'   , 'Times New Roman',...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'XColor'      , [.1 .1 .1], ...
  'YColor'      , [.1 .1 .1], ...
    'LineWidth'   , 0.5         );
% Add horizontal line at -3

%% 

%%%%%%%%%%%%%%%%%%%% 9 months %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path = 'E:\Drought Index\Index';
filename = '9_months.xlsx';
fullpath = fullfile(path, filename);
[~, ~, data] = xlsread(fullpath, 'A2:H491');
%% 
MSDI = cell2mat(data(:, 6));
%% 

figure;
bar(MSDI);
hold on;
% Add horizontal line at -3
line([0, length(MSDI)+1], [-1.7, -1.7], 'Color', 'r', 'LineStyle', '--', 'LineWidth', 1.5);
line([0, length(MSDI)+1], [-1.3, -1.3], 'Color', 'g', 'LineStyle', '--', 'LineWidth', 1.5);
line([0, length(MSDI)+1], [-0.7, -0.7], 'Color', 'blue', 'LineStyle', '--', 'LineWidth', 1.5);
xlabel('9 Months Average');
ylabel('MSDI');
set(gca, ...
  'Box'         , 'on'     , ...
   'FontSize'   ,12 , ...
  'TickDir'     , 'out'     , ...
  'FontName'   , 'Times New Roman',...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'XColor'      , [.1 .1 .1], ...
  'YColor'      , [.1 .1 .1], ...
    'LineWidth'   , 0.5         );
% Add horizontal line at -3


%% 

%%%%%%%%%%%%%%%%%%%% 12 months %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path = 'E:\Drought Index\Index';
filename = '12_months.xlsx';
fullpath = fullfile(path, filename);
[~, ~, data] = xlsread(fullpath, 'A2:H491');
%% 
MSDI = cell2mat(data(:, 6));
%% 

figure;
bar(MSDI);
hold on;
% Add horizontal line at -3
line([0, length(MSDI)+1], [-1.3, -1.3], 'Color', 'r', 'LineStyle', '--', 'LineWidth', 1.5);
line([0, length(MSDI)+1], [-1.2, -1.2], 'Color', 'g', 'LineStyle', '--', 'LineWidth', 1.5);
xlabel('12 Months Average');
ylabel('MSDI');
set(gca, ...
  'Box'         , 'on'     , ...
   'FontSize'   ,12 , ...
  'TickDir'     , 'out'     , ...
  'FontName'   , 'Times New Roman',...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'XColor'      , [.3 .3 .3], ...
  'YColor'      , [.3 .3 .3], ...
    'LineWidth'   , 0.5         );
% Add horizontal line at -3