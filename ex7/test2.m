% This is a function to test computeCentroids.m in the Machine Learning Course Ex6 (Week 8-ex7) by Dr. Andrew NG
%
function test2
%!test1
printf ("Running Test2 - computeCentroids() \n");
% ========== computeCentroids() ============
X = reshape([1:24],8,3)
cent=computeCentroids(X, [1 1 3 3 4 4 2 2]',4)

% result
%ans =
%    1.5000    9.5000   17.5000
%    7.5000   15.5000   23.5000
%    3.5000   11.5000   19.5000
%    5.5000   13.5000   21.5000
    assert(cent(1,1), 1.5, 0.00001);
    assert(cent(1,2), 9.5, 0.00001);
    assert(cent(1,3), 17.5, 0.00001);
    assert(cent(2,1), 7.5, 0.00001);
    assert(cent(2,2), 15.5, 0.00001);
    assert(cent(2,3), 23.5, 0.00001);
    assert(cent(3,1), 3.5, 0.00001);
    assert(cent(3,2), 11.5, 0.00001);
    assert(cent(3,3), 19.5, 0.00001);
    assert(cent(4,1), 5.5, 0.00001);
    assert(cent(4,2), 13.5, 0.00001);
    assert(cent(4,3), 21.5, 0.00001);
    printf ("Test2 passed\n ");

endfunction