function res = gesture(I, J)

I = rgb2gray(I);
J = rgb2gray(J);

[x1, y1] = size(I);
[x2, y2] = size(J);

diff = [];
for i = 1:min(x1, x2)
    for j = 1:min(y1, y2)
        diff(size(diff,2)+1) = I(i, j) - J(i, j);
    end    
end

res = rms(diff);