% This is a function to test cofiCostFunc.m in the Machine Learning Course Ex8 (Week 9-ex8) by Dr. Andrew NG
%
function test4
%Test 4a (Collaborative Filtering Gradient):
%input:
printf ("Running Test4 - cofiCostFunc() \n");
    params = [ 1:14 ] / 10;
    Y = magic(4);
    Y = Y(:,1:3);
    R = [1 0 1; 1 1 1; 0 0 1; 1 1 0] > 0.5;     % R is logical
    num_users = 3;
    num_movies = 4;
    num_features = 2;
    lambda = 0;
    [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, num_features, lambda)

    assert(J, 311.63, 0.00001);
    assert(grad,[-16.1880; -23.5440; -5.1590; -14.9720; -21.4380; -30.4620; -6.5660; -19.5440; -3.4230; -7.0280;
-3.4140; -12.2590; -16.0600; -9.7420], 0.00001);
printf ("Test4 passed\n ");

endfunction