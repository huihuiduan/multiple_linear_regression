%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PREDICTTESTING Predict the out of testing data

%   PREDICTTESTING(X) returns the output of a testing data.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [predict] = predictTesting(testing, mu, sigma, theta)
 
  testing_norm = testing;

  for iter = 1 : size(testing, 2)
    testing_norm(:, iter) = (testing(:, iter) - mu(1, iter)) / sigma(1, iter);
  end 

  testing = [ones(size(testing, 1), 1) testing_norm];

  predict = testing * theta; 

end
