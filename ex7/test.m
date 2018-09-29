% This is a function to test findClosestCentroid.m in the Machine Learning Course Ex6 (Week 8-ex7) by Dr. Andrew NG
%
function test
%!test1
printf ("Running Test1 - findClosestCentroids() \n");
    X = reshape(sin(1:50), 10, 5);
    cent = X(7:10,:);
    idx = findClosestCentroids(X, cent)
    assert(idx(1), 1, 0.00001);
    assert(idx(2), 2, 0.00001);
    assert(idx(3), 3, 0.00001);
    assert(idx(4), 4, 0.00001);
    assert(idx(5), 4, 0.00001);
    assert(idx(6), 1, 0.00001);
    assert(idx(7), 1, 0.00001);
    assert(idx(8), 2, 0.00001);
    assert(idx(9), 3, 0.00001);
    assert(idx(10), 4, 0.00001);
printf ("Test1 passed\n ");

endfunction