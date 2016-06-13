function [M, I, J] = closeness(A, B)

D = pdist2(A, B, 'euclidean');
[M, I] = min(D);
[M, J] = min(min(D));
I = I(J);

end