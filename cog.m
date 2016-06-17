function [cog_x, cog_y] = cog(I)
[x, y] = size(I);

x_sum = 0;
y_sum = 0;
sum = 0;
for i = 1:x
    for j = 1:y
        if I(i, j) > 0
            x_sum = x_sum + i;
            y_sum = y_sum + j;
            sum = sum + 1;
        end
    end
end

cog_x = x_sum/sum;
cog_y = y_sum/sum;
end