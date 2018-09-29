% This is a function to test projectData.m in the Machine Learning Course Ex6 (Week 8-ex7) by Dr. Andrew NG
%
function test4
% ========== projectData() ============ 
printf ("Running Test4 - projectData() \n");
X = sin(reshape([0:11],4,3));
D=projectData(X, magic(3), 2)

% result
% ans =
%   1.68703   5.12021
%   5.50347  -0.24408
%   4.26005  -5.38397
%  -0.90004  -5.57386

    assert(D(1,1), 1.68703, 0.00001);
    assert(D(1,2), 5.12021, 0.00001);
    assert(D(2,1), 5.50347, 0.00001);
    assert(D(2,2), -0.24408, 0.00001);
    assert(D(3,1), 4.26005, 0.00001);
    assert(D(3,2), -5.38397, 0.00001);
    assert(D(4,1), -0.90004, 0.00001);
    assert(D(4,2), -5.57386, 0.00001);
printf ("Test3 passed\n ");

endfunction