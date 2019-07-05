function [J, grad] = reg_cost(theta, X, y, lambda)
m=length(y);
J=0;
grad=zeros(size(theta));
hyp=sigmoid(X*theta);
J=(1/m)*(-y'*log(hyp)-(1-y')*log(1-hyp))-(lambda/(2*m))*(sum(theta.^2)-theta(1).^2);
temp = ones(size(theta));
temp(1) = 0;
grad = 1 / m * X' * (hyp - y) + lambda / m * (theta .* temp);
end