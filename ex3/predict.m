function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);  %size(X)=[5000 400] 
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
% Make the first layer matrix by taking X and adding bias unit
% X = [ones(m, 1) X];
a1 = horzcat(ones(m,1),X);           %size(a1)=[5000 401]

% Hidden Layer
z2 = Theta1*a1';                     %size(z2)=[25 5000]
a2 = vertcat(ones(1,m),sigmoid(z2)); %size(a2)=[26 5000]

% Output Layer
z3 = Theta2*a2;
a3 = sigmoid(z3);                    %size(a3)=[10 5000]  
% hx=a3
 
% find the max value, prob in each row of matrix hx, returns the column number which is class K 
% and pass to vectors p of size [1 5000] and probability vector prob.
[prob p] = max(a3',[],2); 

% =========================================================================


end
