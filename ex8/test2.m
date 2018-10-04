% This is a function to test selectThreshold.m in the Machine Learning Course Ex8 (Week 9-ex8) by Dr. Andrew NG
%
function test2
%Test 2a (Select threshold):
%input:
printf ("Running Test2 - selectThreshold() \n");
    [epsilon F1] = selectThreshold([1 0 0 1 1]', [0.1 0.2 0.3 0.4 0.5]')
    
    assert(epsilon, 0.40040, 0.00001);
    assert(F1, 0.57143, 0.00001);
printf ("Test2 passed\n ");

endfunction