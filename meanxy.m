function res = meanxy(I, J)

[x1, y1] = size(I);
[x2, y2] = size(J);

x1_sum = 0;
y1_sum = 0;
for i = 1:x1
    for j = 1:y1
        x1_sum = x1_sum + i;
        y1_sum = y1_sum + i;
    end    
end

x2_sum = 0;
y2_sum = 0;
for i = 1:x2
    for j = 1:y2
        x2_sum = x2_sum + i;
        y2_sum = y2_sum + i;
    end
end

res = 0;
if abs((double(x1_sum)/double(x1)) - (double(x2_sum)/double(x2))) > double(1)
   res = 1; 
end
if abs((double(y1_sum)/double(y1)) - (double(y2_sum)/double(y2))) > double(1)
   res = 1; 
end