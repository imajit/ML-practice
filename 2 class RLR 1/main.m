%trying to predict 2class dataset using regularised logistic regression
clear;close all;clc;
fprintf('loading dataset\n');
dataset=csvread('ex2data2.csv');
X=dataset(:,[1,2]);
y=dataset(:,3);
plotData(X, y);
hold on;
xlabel('parameter 1');
ylabel('parameter 2');
legend('y = 1', 'y = 0');
hold off;
%as seen by figure linear curve cannot fit the curve so I consider to take a
% ploynomial curve instead.

X=mapFeatures(X(:,1),X(:,2));

theta1=zeros(size(X,2),1);
reg_par=0;

[cost, grad] = reg_cost(theta1, X, y, reg_par);
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimizing RLR using inbuilt function fminunc
[theta, J, exit_flag] = fminunc(@(t)(reg_cost(t, X, y, reg_par)), theta1, options);

plotBoundary(theta, X, y);
hold on;
title(sprintf('lambda = %g', reg_par))

% Labels and Legend
xlabel('parameter 1')
ylabel('parameter 2')

legend('y = 1', 'y = 0', 'Decision boundary')
hold off;
%accuracy
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
pause;