function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

theta_first_element_zero = theta;
theta_first_element_zero(1) = 0;

J = sum(-y' .* log(sigmoid(theta' * X')) - (1 - y') .* log(1 - sigmoid((theta' * X')))) / m + lambda * sum(theta_first_element_zero .^ 2) / (2 * m);
grad = ((sigmoid(theta' * X') - y') * X)' / m + lambda / m * theta_first_element_zero;

grad = grad(:);

end