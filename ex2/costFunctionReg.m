function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
n = size(theta,1);
hx = sigmoid(X*theta);

%theta(1)^2 subtracted from cost J because first theta term not included in regularization. 
J = 1/m*(sum(-y.*log(hx)-(1-y).*log(1-hx)))+lambda/(2*m)*(sum(theta.^2)-theta(1)^2);

%grad(1,1) calculated separately because first cost derivative term not included in regularization.
grad_temp=1/m*sum((hx-y).*X);
grad(1,1)=grad_temp(1,1);
grad_temp2=1/m*sum((hx-y).*X).+(lambda/m*theta)';
grad(2:n,1)=(grad_temp2(1,2:n))';
% =============================================================

end
