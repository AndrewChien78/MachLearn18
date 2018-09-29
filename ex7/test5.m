% This is a function to test recoverData.m in the Machine Learning Course Ex6 (Week 8-ex7) by Dr. Andrew NG
%
function test5
% ========== recoverData() ============
printf ("Running Test5 - RecoverData() \n");
Q = reshape([1:15],5,3);
Xa=recoverData(Q, magic(5), 3) %Xa=X_approx

% result
%ans =
%   172   130   183   291   394
%   214   165   206   332   448
%   256   200   229   373   502
%   298   235   252   414   556
%   340   270   275   455   610
    assert(Xa(1,:),[172   130   183   291   394] , 0.00001);
    assert(Xa(2,:),[214   165   206   332   448], 0.00001);
    assert(Xa(3,:),[256   200   229   373   502], 0.00001);
    assert(Xa(4,:),[298   235   252   414   556], 0.00001);
    assert(Xa(5,:),[340   270   275   455   610], 0.00001);
  
printf ("Test3 passed\n ");

endfunction