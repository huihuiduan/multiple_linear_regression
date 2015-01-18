%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta

%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [theta, J_history] = gradientDescentMulti(X, y, theta, 
                                                    alpha, num_iters)
  % Initialize some useful values
  n = length(y); % number of training examples
  J_history = zeros(num_iters, 1);

  for iter = 1 : num_iters
      theta = theta - alpha * X' *(X * theta - y) / n;

      % Save the cost J in every iteration    
      J_history(iter) = computeCostMulti(X, y, theta);
  end

end
