function A = mapFeatures(X1,X2)
  degree=6;
  A = ones(size(X1(:,1)));
  for i = 1:degree
    for j = 0:i
        A(:, end+1) = (X1.^(i-j)).*(X2.^j);
    end
  end
end