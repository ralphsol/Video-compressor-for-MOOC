function [ stroke_set ] = stroke_diff( B )

    stroke_set = {};
    %out_set = {};
    %B = [2 2; 1 2; 1 1; 2 1];
    
%     val = B(1, 3);          % initialise val
    while size(B, 1) > 0
%        if B(1, 3)~= val     % update to final set and re-organise the set ( add to only one stroke in each frame )
% 
%            max_increment = 0;
%            index_increment = 1;
%            for j=1:size(stroke_set, 2)
%                if j > size(out_set, 2)
%                    if size(stroke_set{j}, 1) > max_increment;
%                       max_increment = size(stroke_set{j}, 1);
%                       index_increment = j;
%                    end
%                else
%                    if size(stroke_set{j}, 1) - size(out_set{j}, 1) > max_increment;
%                       max_increment = size(stroke_set{j}, 1) - size(out_set{j}, 1);
%                       index_increment = j;
%                    end
%                end
%            end
%            
%            if index_increment > size(out_set, 2)
%                out_set{end+1} = stroke_set{j};
%            else
%                out_set{index_increment} = stroke_set{index_increment};
%            end
%            stroke_set = out_set;
%            disp(stroke_set);
%            val = B(1, 3);
%        end
       
       
       if size(stroke_set, 2) == 0
           stroke_set{end+1} = B(1, :);
           B(1, :) = [];
           continue;
       end

       min_dist = inf;
       for k=1:size(stroke_set, 2)
           tmp_strokes = stroke_set{k}(:,1:2);
           tmp_B = B(:,1:2);
           [M, I, J] = closeness(tmp_strokes, tmp_B);
           %disp([M I J]);
           if M < min_dist
               min_dist = M;
               closest = k;
               min_index = J; %J final
           end
       end

       %disp(min_index);
       %disp(B);
       %disp(stroke_set{1});

       if min_dist > 5
           stroke_set{end+1} = B(1, :);
           B(1, :) = [];
       else
           stroke_set{closest} = [stroke_set{closest}; B(min_index, :)];
           B(min_index, :) = [];
       end
    end

%     for k=1:size(stroke_set, 2)
%         disp(stroke_set{k});
%     end

%    stroke_set = out_set;
end