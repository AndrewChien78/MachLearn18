function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
% Setup vectors for C and sigma to try. setup vectors for C temporary and sigma temporary.
C_list = [0.01 0.03 0.1 0.3 1 3 10 30]'; 
sigma_list = [0.01 0.03 0.1 0.3 1 3 10 30]';
n = 0;
%C_temp = zeros(length(C_list),1);
%sigma_temp = zeros(length(sigma_temp),1);

for i = 1:length(C_list)
    for j = 1:length(sigma_list)
        n = n+1;
        model = svmTrain(X, y, C_list(i), @(x1, x2) gaussianKernel(x1, x2, sigma_list(j)));
        pred = svmPredict(model, Xval);
        error_diff = mean(double(pred != yval));    %calcuate the accuracy of prediction
        param_list(n,:) = [C_list(i) sigma_list(j) error_diff]; %stores the corresponding values of C, sigma, error
        printf("n=%d i=%d j=%d C_list=%d sigma_list=%d\n",n,i,j,C_list(i),sigma_list(j)); 
        printf("error_diff=%d\n",error_diff);   
    endfor
endfor
printf(" C_List     sigma_list  error_diff\n");
param_list
[Param_error iParam] = min (param_list(:,3));           %find the row with lowest error
C = param_list(iParam,1);
sigma = param_list(iParam,2); %returns C and sigma in row with lowest error 
% =========================================================================

end
