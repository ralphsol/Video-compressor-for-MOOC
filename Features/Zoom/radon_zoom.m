function [ radon_set ] = radon_zoom( V )

    radon_set = {};
    [n, m] = size(V);

    for i = 1:25:n
       for j = 1:25:m
            BW = pad_image(V, i, j);
            [R,xp] = radon(BW,[0 45]);
            %figure
            %plot(xp,R(:,1));
            %title('Radon Transform of a Square Function at 0 degrees')
            radon_set{end+1} = R(:,1);
       end
    end
end