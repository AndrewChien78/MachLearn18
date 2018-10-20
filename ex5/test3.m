% This is a function to LearningCurve.m in the Machine Learning Course by Dr. Andrew NG
%
function test3
%!test1
    printf ("Running Test1 - Tom Mosher Test\n");
    X = [1 2 ; 1 3 ; 1 4 ; 1 5];
    y = [7 6 5 4]';
    Xval = [1 7 ; 1 -2];
    yval = [2 12]';
    [lambda_vec, error_train, error_val] = validationCurve(X,y,Xval,yval)

    assert(lambda_vec(1), 0.000000, 0.00001);
    assert(lambda_vec(2), 0.001000, 0.00001);
    assert(lambda_vec(3), 0.003000, 0.00001);
    assert(lambda_vec(4), 0.010000, 0.00001);
    assert(lambda_vec(5), 0.030000, 0.00001);
    assert(lambda_vec(6), 0.100000, 0.00001);
    assert(lambda_vec(7), 0.300000, 0.00001);
    assert(lambda_vec(8), 1.000000, 0.00001);
    assert(lambda_vec(9), 3.000000, 0.00001);
    assert(lambda_vec(10), 10.00000, 0.00001);

    assert(error_train(1), 0.000000, 0.00001);
    assert(error_train(2), 0.000000, 0.00001);
    assert(error_train(3), 0.000000, 0.00001);
    assert(error_train(4), 0.000000, 0.00001);
    assert(error_train(5), 0.000200, 0.00001);
    assert(error_train(6), 0.000240, 0.00001);
    assert(error_train(7), 0.002000, 0.00001);
    assert(error_train(8), 0.017360, 0.00001);
    assert(error_train(9), 0.087890, 0.00001);
    assert(error_train(10), 0.277780, 0.00001);

    assert(error_val(1), 0.25000, 0.0001);
    assert(error_val(2), 0.25055, 0.00001);
    assert(error_val(3), 0.25165, 0.00001);
    assert(error_val(4), 0.25553, 0.00001);
    assert(error_val(5), 0.26678, 0.00001);
    assert(error_val(6), 0.30801, 0.0001);
    assert(error_val(7), 0.43970, 0.00001);
    assert(error_val(8), 1.00347, 0.00001);
    assert(error_val(9), 2.77539, 0.00001);
    assert(error_val(10), 6.80556, 0.00001);  

    printf ("Test1 passed\n ");

endfunction
