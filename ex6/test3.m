% This is a function to test processEmail.m in the Machine Learning Course Ex6 (Week 7) by Dr. Andrew NG
%
function test3
%!test1
printf ("Running Test1 - processEmail TestCase1 \n");
    word_indices  = processEmail('abe above abil ab tip the cow')
    assert(word_indices, [2;6;3;2;1695;1666], 0.00001);
printf ("Test1 passed\n ");

endfunction