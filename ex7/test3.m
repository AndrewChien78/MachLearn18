% This is a function to test pca.m in the Machine Learning Course Ex6 (Week 8-ex7) by Dr. Andrew NG
%
function test3
% ========== pca() ============ 
printf ("Running Test3 - pca.m \n");
[U, S] = pca(sin([0 1; 2 3; 4 5]))

% result
%U =
%  -0.65435  -0.75619
%  -0.75619   0.65435
%
%S =
%Diagonal Matrix
%   0.79551  0
%   0        0.22019
    assert(U(1,1), -0.65435, 0.00001);
    assert(U(1,2), -0.75619, 0.00001);
    assert(U(2,1), -0.75619, 0.00001);
    assert(U(2,2),  0.65435, 0.00001);
    assert(S(1,1), 0.79551, 0.00001);
    assert(S(1,2), 0, 0.00001);
    assert(S(2,1), 0, 0.00001);
    assert(S(2,2), 0.22019, 0.00001);
printf ("Test3 passed\n ");

endfunction