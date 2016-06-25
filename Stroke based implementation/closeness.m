function [M, I, J] = closeness(A, B)

D = pdist2(A, B, 'euclidean');

col_size = size(D, 2);
D = [D; inf*ones(1, col_size);];

[M, I] = min(D);
[M, J] = min(min(D));
I = I(J);

end