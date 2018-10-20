function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
%------------------------------
% Ex4 Section 1.3 Cost Function
%------------------------------

% calculate a3 or the hx
a1 = horzcat(ones(m,1),X);           %size(a1)=[5000 401]

% Hidden Layer
z2 = Theta1*a1';                     %size(z2)=[25 5000] , size(Theta1)=[25 401], size(Theta2) = [10 26]
a2 = vertcat(ones(1,m),sigmoid(z2)); %size(a2)=[26 5000]

% Output Layer
z3 = Theta2*a2;
a3 = sigmoid(z3);                   %size(a3)=[10 5000]

y_m = eye(num_labels)(y,:);         %Transforms the vector y of 1 to 10 into a matrix [5000 10] having 
                                    %only ones and zeros   

% For Cost function calc, a3=hx  
% Need to make sure the equation evaluate to a [5000 10] sized matrix
J = 1/m*sum(sum(-y_m.*log(a3)'-(1-y_m).*(log(1-a3)')));    

%--------------------------------
% Ex4 Section 1.4 Regularization Term
%--------------------------------
% Both J_reg equations below can be used.
%J_reg = lambda/(2*m)*( sum(sum(Theta1.^2)) + sum(sum(Theta2.^2))-sum(Theta1(:,1).^2)-sum(Theta2(:,1).^2) );
J_reg = lambda/(2*m)*( sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2)) );
J = J + J_reg;
% -------------------------------------------------------------
% Section 2.3 Backpropagation
%--------------------------------------------------------------
d3 = a3'-y_m;                                   %size = [mxr] = [5000x10]
d2 = Theta2(:,2:end)'*d3'.*sigmoidGradient(z2); %size = [mxh] = [5000x25]
%D1 = d2*a1(:,2:end);                           %size = [hxn] = [25x400]
D1 = d2*a1;                                     %size = [hx(n+1)] = [25x401]
D2 = d3'*a2';                                   %size = [rx(h+1)] = [10x26]                       
%Theta1_grad = 1/m*D1;                           %size = [hx(n+1)] = [25x401]
%Theta2_grad = 1/m*D2;                           %size = [rx(h+1)] = [10x26] 
% -------------------------------------------------------------
% Section 2.5 Regularization of Gradients
%--------------------------------------------------------------
Theta1_grad(:,1) = 1/m*D1(:,1);
Theta1_grad(:,2:end) = 1/m*D1(:,2:end)+lambda/m*Theta1(:,2:end);                           
Theta2_grad(:,1) = 1/m*D2(:,1);
Theta2_grad(:,2:end) = 1/m*D2(:,2:end)+lambda/m*Theta2(:,2:end); 
% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
