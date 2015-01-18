%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: Linear regression with multiple variables

% Objective: Implement Gradient Descent algorithm to multiple linear regression

% Author: Huihui Duan
% First Created: Sep/10/2013
% Last Modified: Jan/18/2015

% Usage: 
% /usr/local/octave/3.8.0/bin/octave multiple_linear_regression.m arg1 arg2 arg3
% arg1 - training.txt - training data set (no col names, last column as output)
% arg2 - testing.txt - testing data set (no col names)
% arg3 - prediction.txt - predictions of testing data set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#!/usr/local/octave/3.8.0/bin/octave -qf

%% ================ Part 1: Feature Normalization ================
%% Clear and Close Figures
clear ; close all; clc;

fprintf('Loading training data ...\n');

%% Load Data with last column of output, y
training = load(argv(){1});
% number of parameters exclude intercept
p = columns(training) - 1;
X = training(:, 1 : p);
y = training(:, (p + 1));
% number of observations
n = length(y);

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(n, 1) X];

%% ================ Part 2: Gradient Descent =====================

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.01;
num_iters = 4000;

% Init Theta and Run Gradient Descent 
theta = zeros(p + 1, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

%% ==================== Part 3: Estimation =======================
fprintf('Loading testing data ...\n');
testing = load(argv(){2});
fprintf('Making prediction ...\n');
price = predictTesting(testing, mu, sigma, theta);

fprintf('Writing to text file ...\n');
% Write testing predictions to a file
fid = fopen(argv(){3}, "w");
fprintf(fid,'%.7g\n',[price]);
fclose(fid);
fprintf('Done ...\n');




