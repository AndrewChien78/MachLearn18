% This is a function to test emailFeatures.m in the Machine Learning Course Ex6 (Week 7) by Dr. Andrew NG
%
function test4
%!test1
    % input
    idx = [2 4 6 8 2 4 6 8]';
    v = emailFeatures(idx);
    v(1:10)
    sum(v)
    assert(v(1:10), [0;1;0;1;0;1;0;1;0;0], 0.00001);
    assert(sum(v), [4], 0.00001);
printf ("Test1 passed\n ");

endfunction