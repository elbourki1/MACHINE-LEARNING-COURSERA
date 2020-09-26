
load ('ex5data1.mat');

% m = Number of examples
m = size(X, 1);
X = [ones(m, 1) X];
lambda = 0;



[theta] = trainLinearReg(X, y, lambda);
fprintf(['theta = [%f; %f]\n'],theta(1),theta(2));
lambda = 0;
[error_train, error_val] = ...
    learningCurve([ones(m, 1) X], y, ...
                  [ones(size(Xval, 1), 1) Xval], yval, ...
                  lambda);

plot(1:m, error_train, 1:m, error_val);
title('Learning curve for linear regression')
legend('Train', 'Cross Validation')
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 150])