% This is a function to linearRegCostFunction.m in the Machine Learning Course by Dr. Andrew NG
%
function test
%!test1
printf ("Running Test1 - Sine Wave Test\n");
  X = [ones(10,1) sin(1:1.5:15)' cos(1:1.5:15)'];
  y = sin(1:3:30)';
  [J, grad] = linearRegCostFunction(X, y, [0.1 0.2 0.3]', 0.5)
  assert(J, 0.13856, 0.00001);
printf ("Test1 passed\n ");

%!test2
printf ("Running Test2 - Ex5 standard tes, Cost\n");
  load ('ex5data1.mat');
  m = size(X, 1);
  theta = [1 ; 1];
  [J, grad] = linearRegCostFunction([ones(m, 1) X], y, theta, 1)
  assert(J, 303.993192, 0.000001);
  assert(grad(1), -15.303016, 0.000001);
  assert(grad(2), 598.250744, 0.000001);
printf ("Test2 passed\n ");

%! test3
printf ("Running Test3 - Sine Wave Test - grad\n");
  X = [ones(10,1) sin(1:1.5:15)' cos(1:1.5:15)'];
  y = sin(1:3:30)';
  [J, grad] = linearRegCostFunction(X, y, [0.1 0.2 0.3]', 0.5)
  assert(grad(1), 0.07071, 0.00001);
  assert(grad(2), 0.10090, 0.00001);
  assert(grad(3), 0.11923, 0.00001);
printf ("Test3 passed\n ");

%! test4
printf ("Running Test4 - Tom Mosher Test1 \n");
  X = [1 2 3 4];
  y = 5;
  theta = [0.1 0.2 0.3 0.4]';

  [J grad] = linearRegCostFunction(X, y, theta, 7)
  assert(J, 3.0150, 0.00001);
  assert(grad(1), -2.0000, 0.00001);
  assert(grad(2), -2.6000, 0.00001);
  assert(grad(3), -3.9000, 0.00001);
  assert(grad(4), -5.2000, 0.00001);
printf ("Test4 passed\n ");

%! test5
printf ("Running Test5 - Tom Mosher Test2 \n");
  X = [[1 1 1]' magic(3)];
  y = [7 6 5]';
  theta = [0.1 0.2 0.3 0.4]';

  [J grad] = linearRegCostFunction(X, y, theta,0)
  assert(J, 1.3533, 0.0001);
  assert(grad(1), -1.4000, 0.0001);
  assert(grad(2), -8.7333, 0.0001);
  assert(grad(3), -4.3333, 0.0001);
  assert(grad(4), -7.9333, 0.0001);
printf ("Test5 passed\n ");

%! test6
printf ("Running Test6 - Tom Mosher Test3 \n");
  X = [[1 1 1]' magic(3)];
  y = [7 6 5]';
  theta = [0.1 0.2 0.3 0.4]';

  [J grad] = linearRegCostFunction(X, y, theta,7)
  assert(J, 1.6917, 0.0001);
  assert(grad(1), -1.4000, 0.0001);
  assert(grad(2), -8.2667, 0.0001);
  assert(grad(3), -3.6333, 0.0001);
  assert(grad(4), -7.0000, 0.0001);
printf ("Test6 passed\n ");


endfunction