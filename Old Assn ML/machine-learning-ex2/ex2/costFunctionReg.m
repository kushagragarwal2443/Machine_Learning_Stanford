function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


h=sigmoid(X*theta);
cost= y' * (log(h)) + ( 1-y )' * (log(1-h));
J= -1* cost;
J= J/m;
pen= (lambda/(2*m))*(sum(theta .^ 2) - theta(1)*theta(1));



J= J+ pen;

grad(1)=1/m *X(:,1)'* (h -y);

for iter= 2: size(X,2)

    temp= 1/m *X(:,iter)'* (h -y);
    fin= (lambda/m)*(theta(iter));
    grad(iter)=temp+fin;




% =============================================================

end
