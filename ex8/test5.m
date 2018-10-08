% This is a function to test coficostFunc.m in the Machine Learning Course Ex8 (Week 9-ex8) by Dr. Andrew NG
%
function test5
%Test 5a (Regularized Cost):
%input:
printf ("Running Test5 - Regularized Cost for cofiCostFunc() \n");
    params = [ 1:14 ] / 10;
    Y = magic(4);
    Y = Y(:,1:3);
    R = [1 0 1; 1 1 1; 0 0 1; 1 1 0] > 0.5;     % R is logical
    num_users = 3;
    num_movies = 4;
    num_features = 2;
    lambda = 6;
    J = cofiCostFunc(params, Y, R, num_users, num_movies, num_features, lambda)
    assert(J, 342.08, 0.001);

printf ("Test5 passed\n ");

endfunction