function [ res ] = far_point( data )

    D = pdist2(data, data);
    out = sum(D, 2);
    [M index] = max(out);
    pair = data(index, :);
    data(index, :) = [];
    data = [pair; data];
    res = data;

end
