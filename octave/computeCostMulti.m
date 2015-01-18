%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables

%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function J = computeCostMulti(X, y, theta)
	% Initialize some useful values
	m = length(y); % number of training examples

	% You need to return the following variables correctly
	J = 0;

	% Compute the cost of a particular choice of theta

	J = (X * theta - y)' * (X * theta - y) / (2 * m);

end
