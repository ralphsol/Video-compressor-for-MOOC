stroke_set = {[0 0; -1 0; 0 -1; -1 -1], [1 1;], [9 9; 7 7]};
%stroke_set = {};
B = [2 2; 1 2; 1 1; 2 1];

while size(B, 1) > 0
   if size(stroke_set, 2) == 0
       stroke_set{end+1} = B(1, :);
       B(1, :) = [];
       continue;
   end
    
   min_dist = 10000;
   for k=1:size(stroke_set, 2)
       [M, I, J] = closeness(stroke_set{k}, B);
       %disp([M I J]);
       if M < min_dist
           min_dist = M;
           closest = k;
           min_index = J;
       end
   end
   
   if min_dist > 10
       stroke_set{end+1} = B(1, :);
       B(1, :) = [];
   else
       stroke_set{closest} = [stroke_set{closest}; B(min_index, :)];
       B(min_index, :) = [];
   end
   %disp(B);
end

for k=1:size(stroke_set, 2)
    disp(stroke_set{k});
end