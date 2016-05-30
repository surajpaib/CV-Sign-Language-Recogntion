function [J, grad] = costFunction(initial_theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(initial_theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%
teta=initial_theta.';
yt=transpose(y);
Xt=transpose(X);
login1=sigmoid(teta*Xt);
login2=1-sigmoid(teta*Xt);
J =(1/m)*((-yt*((log(login1)).'))+(-(1-yt)*((log(login2)).')));




for i=1:m
grad(1)=grad(1)+(1/m)*(sigmoid(teta*(X(i,:)).')-y(i))*X(i,1);

grad(2)=grad(2)+(1/m)*(sigmoid(teta*(X(i,:)).')-y(i))*X( i,2);

grad(3)=grad(3)+(1/m)*(sigmoid(teta*(X(i,:)).')-y(i))*X(i,3);

end


% =============================================================

end
