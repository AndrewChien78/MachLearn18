% This is a function to test gaussianKernel.m in the Machine Learning Course Ex6 (Week 7) by Dr. Andrew NG
%
function test
%!test1
printf ("Running Test1 - Gaussian Kernel Test1 \n");
    sim = gaussianKernel([1 2 3], [2 4 6], 3)
    assert(sim, 0.45943, 0.00001);


printf ("Test1 passed\n ");

%!test2
printf ("Running Test2 - Gaussian Kernel Test2 \n");
    sim = gaussianKernel([1 1], [1 1], 1)
    assert(sim, 1, 0.000001);
printf ("Test2 passed\n ");

%! test3
printf ("Running Test3 - Gaussian Kernel Test3 \n");
    sim = gaussianKernel([1 1], [100 100], 1)
    assert(sim, 0, 0.000001);
printf ("Test3 passed\n ");

endfunction