% This is a function to test cofiCostFunc.m in the Machine Learning Course Ex8 (Week 9-ex8) by Dr. Andrew NG
%
function test3
%Test 3a (Collaborative Filtering Cost):
%input:
printf ("Running Test3 - cofiCostFunc() \n");
    params = [ 1:14 ] / 10;
    Y = magic(4);
    Y = Y(:,1:3); 
    R = [1 0 1; 1 1 1; 0 0 1; 1 1 0] > 0.5;     % R is logical
    num_users = 3;
    num_movies = 4;
    num_features = 2;
    lambda = 0;
    
    J = cofiCostFunc(params, Y, R, num_users, num_movies, num_features, lambda)
    assert(J, 311.63, 0.01);

printf ("Test3 passed\n ");

endfunction