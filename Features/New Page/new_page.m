function [ res ] = new_page( I )
% the stroke sets will be reset after a new page
    res = 0;
    I = edge(rgb2gray(I));
    sum = 0;
    [x, y] = size(I);
    for i = 1:x
        for j = 1:y
            if I(i, j) > 10
                sum = sum + 1;
            end
        end
    end
    if sum < 50
        if size(find(diff), 1) < 20 % something already exists
           res = 1; 
        end
    end

end

