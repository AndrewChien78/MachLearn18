function [all_theta] = oneVsAll(X, y, num_labels, lambda)
%ONEVSALL trains multiple logistic regression classifiers and returns all
%the classifiers in a matrix all_theta, where the i-th row of all_theta 
%corresponds to the classifier for label i
%   [all_theta] = ONEVSALL(X, y, num_labels, lambda) trains num_labels
%   logistic regression classifiers and returns each of these classifiers
%   in a matrix all_theta, where the i-th row of all_theta corresponds 
%   to the classifier for label i

% Set up clock to measure execution time of code
t0 = clock ();

% Some useful variables
m = size(X, 1); %5000 for this example
n = size(X, 2); %400 for this example

% You need to return the following variables correctly 
all_theta = zeros(num_labels, n + 1); %num_labels=10, all_theta 10 row, 401 column matrix

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the following code to train num_labels
%               logistic regression classifiers with regularization
%               parameter lambda. 
%
% Hint: theta(:) will return a column vector.
%
% Hint: You can use y == c to obtain a vector of 1's and 0's that tell you
%       whether the ground truth is true/false for this class.
%
% Note: For this assignment, we recommend using fmincg to optimize the cost
%       function. It is okay to use a for-loop (for c = 1:num_labels) to
%       loop over the different classes.
%
%       fmincg works similarly to fminunc, but is more efficient when we
%       are dealing with large number of parameters.
%
% Example Code for fmincg:
%
%     % Set Initial theta
%     initial_theta = zeros(n + 1, 1);
%     
%     % Set options for fminunc
%     options = optimset('GradObj', 'on', 'MaxIter', 50);
% 
%     % Run fmincg to obtain the optimal theta
%     % This function will return theta and the cost 
%     [theta] = ...
%         fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
%                 initial_theta, options);
%
z = zeros(size(y),1);

for k=1:num_labels
    % Setup another matrix z that only has 2 classes (k and not k)
    %printf("iteration no, k=%d\n",k);
    %for i=1:m
    %    if y(i,1) == k
    %        z(i,1) = 1;
    %    else
    %        z(i,1) = 0;
    %    endif
    %endfor
    % 29Aug18: Alternatively, the y(i)==k can be evaluated right inside fmincg.
    % average execution time for y(i)==k evaluation inside fmincg is 26 secs.
    % average execution time for z matrix style evalution is 26.5secs, so no difference either way.

    %Set Initial theta
    initial_theta = zeros(n + 1, 1); % 401 row, 1 column matrix
   
    % Set options for fminunc
    options = optimset('GradObj', 'on', 'MaxIter', 50);
 
    % Run fmincg to obtain the optimal theta
    % This function will return theta and the cost 
    [theta] = ...
        fmincg (@(t)(lrCostFunction(t, X, (y == k), lambda)), ...
            initial_theta, options);
    %printf("calculated theta(1,1)=%d\n",theta(1,1));

    %Pass theta values for k into the all_theta matrix
    all_theta(k,:)=reshape(theta,1,n + 1);
    %printf("calculated all_theta(%d,1)=%d\n",k,all_theta(k,1));
endfor
elapsed_time = etime (clock (), t0);
printf("Time spent in execution is %d\n",elapsed_time);

%https://en.wikipedia.org/wiki/Multiclass_classification#cite_note-2
%One-vs.-rest[2]:182, 338 (or one-vs.-all, OvA or OvR, one-against-all, OAA) strategy involves training a single classifier per class, with the samples of that class as positive samples and all other samples as negatives. This strategy requires the base classifiers to produce a real-valued confidence score for its decision, rather than just a class label; discrete class labels alone can lead to ambiguities, where multiple classes are predicted for a single sample.[3]:182[note 1]
%In pseudocode, the training algorithm for an OvA learner constructed from a binary classification learner L is as follows:
%
%    Inputs:
%
%        L, a learner (training algorithm for binary classifiers)
%        samples X
%        labels y where yi ∈ {1, … K} is the label for the sample Xi
%
%    Output:
%
%        a list of classifiers fk for k ∈ {1, …, K}
%
%    Procedure:
%
%        For each k in {1, …, K}
%            Construct a new label vector z where zi = 1 if yi = k and zi = 0 otherwise
%            Apply L to X, z to obtain fk
% =========================================================================


end
