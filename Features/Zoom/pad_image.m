function [ res ] = pad_image( V, i, j )

res = V;
[n, m] = size(V);

if i < (n-i)
    res = padarray(res, [(n-(2*i)) 0], 'pre');
else
    res = padarray(res, [((2*i)-n) 0], 'post');
end

if j < (m-j)
    res = padarray(res, [0 (m-(2*j))], 'pre');
else
    res = padarray(res, [0 ((2*j)-m)], 'post');
end

end
