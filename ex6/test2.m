% This is a function to test dataset3Params.m in the Machine Learning Course Ex6 (Week 7) by Dr. Andrew NG
%
function test2
%!test1
printf ("Running Test1 - DatasetParam TestCase1 \n");
    load('ex6data3.mat');
    x1plot = linspace(-2, 2, 10)';
    x2plot = linspace(-2, 2, 10)';
    [X1, X2] = meshgrid(x1plot, x2plot);
    X = [X1(:) X2(:)];
    Xval = X + 0.3;
    y = double(sum(exp(X),2) > 3);
    yval = double(sum(exp(Xval),2) > 3);
    C = 0.1;
    sigma = 1.0;
    [C sigma] = dataset3Params(X, y, Xval, yval)

printf ("Test1 passed\n ");

endfunction