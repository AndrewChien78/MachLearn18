% This is a function to test estimateGaussian.m in the Machine Learning Course Ex8 (Week 9-ex8) by Dr. Andrew NG
%
function test
%Test 1a (Estimate Gaussian Parameters):
%input:
printf ("Running Test1 - estimateGaussian() \n");
    X = sin(magic(4))
    X = X(:,1:3)
    
    [mu sigma2] = estimateGaussian(X)
    assert(mu, [-0.3978779  0.3892253  -0.0080072], 0.00001);
    assert(sigma2,[0.27795 0.65844 0.20414], 0.00001);
printf ("Test1 passed\n ");

endfunction