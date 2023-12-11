%% 
close all;
clear all;
clc;
%% 
% % Load Data
% path = 'E:\Research 1 - Copula with index\Matlab codes';
% filename = 'original_dataset.xlsx';
% fullpath = fullfile(path, filename);
% data = xlsread(fullpath, 'C2:D493');
%% 
load('data.mat');

%% 
R = data(:, 2);
T = data(:, 3);
%% 
a1= 0.77897; 
b1= 5.27087;
R_new=(R-min(R))/(max(R)-min(R));

u=betacdf(R_new,a1,b1);
%% 
mu1=24.8586;
mu2=28.65893;
sigma1= 0.80152;
sigma2=1.31911;

%x=randsample(n,n*0.3);
%T1=normrnd(mu1,sigma1,n,1);
percentage1 = 0.3;
numDataPoints1 = numel(T);
subsetSize1 = round(percentage1 * numDataPoints1);
% Select a random subset of data for fitting
subset1 = datasample(T, subsetSize1, 'Replace', false);
T1_cdf=normcdf(subset1,mu1,sigma1);


%% 
percentage2 = 0.7;
numDataPoints2 = numel(T);
subsetSize2 = round(percentage2 * numDataPoints2);

% Select a random subset of data for fitting
subset2= datasample(T, subsetSize2, 'Replace', false)
T2_cdf=normcdf(subset2,mu2,sigma2);

%% 
T_CDF=[T1_cdf; T2_cdf];
%% 

v=T_CDF;
%% 

tau=corr(u,v,'type','kendall');
tau  %-0.007111774604487
%% 
% Write the subset1 data to an Excel file
filename = 'UV_data_matlab.xlsx'; % Replace with your desired filename
sheetname = 'Sheet 1'; % Replace with your desired sheet name
xlswrite(filename,u , sheetname);
disp('Data written to Excel file.');
%% 
% Write the subset1 data to an Excel file
filename = 'UV_data_matlab.xlsx'; % Replace with your desired filename
sheetname = 'Sheet 2'; % Replace with your desired sheet name
xlswrite(filename,v, sheetname);
disp('Data written to Excel file.');
%% 
%Drawing the copula distribution and density plots
% Define the values of u and v over a grid
[u,v] = meshgrid(0:0.1:1);

% Define the value of delta_uv
theta = -0.03195;
% theta1=+1;

%copula distribution
%c=u.*v+(u.*v.*(1-u).*(1-v).*theta);

%copula density
c=1+(1-2.*u).*(1-2.*v).*theta;

% Plot the surface of c(u,v)
figure();
surf(u, v, c);
ax = gca;
ax.BoxStyle = 'full';
% figure();
% surf(u, v, c1, 'edgecolor', 'none');
%box
set(gca, ...
  'Box'         , 'on'     , ...
  'ticklabelInterpreter','latex',...
   'FontSize'   , 14 , ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'ZMinorTick'  , 'on'      , ...
  'XColor'      , [.1 .1 .1], ...
  'YColor'      , [.1 .1 .1], ...
  'ZColor'      , [.1 .1 .1], ...
    'LineWidth'   , 0.5         );
xlabel('u','Interpreter','latex');
ylabel('v','Interpreter','latex');
zlabel('c(u,v)','Interpreter','latex');
grid off;
%% 














%Rainfall --->u

a1= 0.77897; 
b1= 5.27087;

n=1000;

%Generating rainfall data
R=betarnd(a1,b1,n,1);

%R----->uniform distribution
R_CDF=betacdf(R,a1,b1);
%% 

%Temp --->mixed gaussian -->v
mu1=24.8586;
mu2=28.65893;
sigma1= 0.80152;
sigma2=1.31911;

x=randsample(n,n*0.3);

T1=normrnd(mu1,sigma1,n,1);
T1_cdf=normcdf(T1,mu1,sigma1,n,1);
T11=T1_cdf(x);
y=randsample(n,n*0.7);
T2=normrnd(mu2,sigma2,n,1);
T2_cdf=normcdf(T2,mu2,sigma2,n,1);
T22=T2_cdf(y);
T=zeros(n,1);
T(1:n*0.3)=T11;
T((n*0.3)+1:end)=T22;

%% 
%theta=-1
u=R_CDF;
v=T;
%% 

tau=corr(u,v,'type','kendall');
tau
%% 
% Define the values of u and v over a grid
[u,v] = meshgrid(0:0.05:1);

% Define the value of delta_uv
theta = -0.03195;
% theta1=+1;
%theta = +1;
% Calculate the function c(u,v)--->distribution
%c = 1 + theta*(1-2*u).*(1-2*v);
%c=u.*v+(u.*v.*(1-u).*(1-v).*theta);
%c1=u.*v+(u.*v.*(1-u).*(1-v).*theta1);

%density
 c = 1 + theta*(1-2*u).*(1-2*v);
%  c1=1 + theta1*(1-2*u).*(1-2*v);

% Plot the surface of c(u,v)
figure();
surf(u, v, c, 'edgecolor', 'black');
ax = gca;
ax.BoxStyle = 'full';
% custom_blue = [
%     0.5 0.7 1;   % Medium Blue
%     0.8 0.9 1;   % Light Blue
%     0.2 0.4 0.8; % Dark Blue  
% ];

% Set the custom colormap
% colormap(custom_blue);
% figure();
% surf(u, v, c1, 'edgecolor', 'none');
%box
set(gca, ...
  'Box'         , 'on'     , ...
  'ticklabelInterpreter','latex',...
   'FontSize'   , 14 , ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'ZMinorTick'  , 'on'      , ...
  'XColor'      , [.1 .1 .1], ...
  'YColor'      , [.1 .1 .1], ...
  'ZColor'      , [.1 .1 .1], ...
    'LineWidth'   , 0.5         );
xlabel('u','Interpreter','latex');
ylabel('v','Interpreter','latex');
zlabel('c(u,v)','Interpreter','latex');
grid off;

%% 
[C, hContour] = contour(u, v, c, 20);
colormap(winter)
clabel(C, hContour);  % Label the contour lines with their values
hContour.LevelList = round(hContour.LevelList, 4);
set(gca, ...
  'Box'         , 'on'     , ...
  'ticklabelInterpreter','latex',...
   'FontSize'   , 14 , ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'ZMinorTick'  , 'on'      , ...
  'XColor'      , [.1 .1 .1], ...
  'YColor'      , [.1 .1 .1], ...
  'ZColor'      , [.1 .1 .1], ...
    'LineWidth'   , 0.5         );
xlabel('u','Interpreter','latex');
ylabel('v','Interpreter','latex');
zlabel('c(u,v)','Interpreter','latex');
grid off;
%% 



