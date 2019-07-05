function p = predict(theta, X)
m = size(X, 1); 
p = zeros(m, 1);
h=sigmoid(X*theta);
for i=1:m
  if h(i)<.5
    p(i)=0;
   else
    p(i)=1;
   end
 end
end