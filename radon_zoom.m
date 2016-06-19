function [ radon_set ] = radon_zoom( V )

    radon_set = {};
    [n, m] = size(V);

    for i = 1:20:n
       for j = 1:20:m
            BW = pad_image(V, i, j);
            [R,xp] = radon(BW,[0 45]);
            radon_set{end+1} = R(:,1);
       end
    end
end