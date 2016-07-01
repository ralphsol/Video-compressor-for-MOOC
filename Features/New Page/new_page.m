function [ res ] = new_page( I )

	new_page_threshold = 50;
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
    if sum < new_page_threshold
       res = 1; 
    end

end

