% This is a function to LearningCurve.m in the Machine Learning Course by Dr. Andrew NG
%
function test2
%!test1
    printf ("Running Test1 - Tom Mosher Test\n");
    X = [ones(5,1) reshape(-5:4,5,2)];
    printf ("Size of X\n")
    size(X)
    y = [-2:2]';
    Xval=[X;X]/10;
    yval=[y;y]/10;
    [et ev] = learningCurve(X,y,Xval,yval,1)
    assert(et(1), 0.000000, 0.00001);
    assert(et(2), 0.031250, 0.00001);
    assert(et(3), 0.013333, 0.00001);
    assert(et(4), 0.005165, 0.00001);
    assert(et(5), 0.002268, 0.00001);
    assert(ev(1), 3.0000e-002, 0.0001);
    assert(ev(2), 5.3125e-003, 0.00001);
    assert(ev(3), 6.0000e-004, 0.00001);
    assert(ev(4), 9.2975e-005, 0.00001);
    assert(ev(5), 2.2676e-005, 0.00001); 

    printf ("Test1 passed\n ");

endfunction
