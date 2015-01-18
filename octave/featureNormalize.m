%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FEATURENORMALIZE Normalizes the features in X

%   FEATURENORMALIZE(X) returns a normalized version of X where the mean value 
%   of each feature is 0 and the standard deviation is 1.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [X_norm, mu, sigma] = featureNormalize(X)
 
  X_norm = X;
  mu = zeros(1, size(X, 2));
  sigma = zeros(1, size(X, 2));

  % First, for each feature dimension, compute the mean of the feature and 
  % subtract it from the dataset, storing the mean value in mu. Next, compute 
  % the standard deviation of each feature and divide each feature by it's 
  % standard deviation, storing the standard deviation in sigma.

  for iter = 1: size(X, 2)
      mu(1, iter) = mean(X(:, iter));
      sigma(1, iter) = std(X(:, iter));

      X_norm(:, iter) = (X(:, iter) - mu(1, iter)) / sigma(1, iter);

  end

end
