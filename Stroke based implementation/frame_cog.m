function [ out_set ] = frame_cog( stroke_set )

    out_set = {};
    for i = 1:size(stroke_set, 2)
       val = stroke_set{i}(1, 3);
       list = [];
       out_set{end+1} = [];
       for j = 1:size(stroke_set{i}, 1)
           if stroke_set{i}(j, 3)~= val
              val = stroke_set{i}(j, 3);
              list = [list; list;];
              out_set{end} = [mean(list); out_set{end};];
              list = [stroke_set{i}(j, :);];
           else
              list = [stroke_set{i}(j, :); list;];
           end
       end
       if size(list, 1) > 0
           list = [list; list;];
           out_set{end} = [mean(list); out_set{end};];
       end
    end

    for i = 1:size(out_set, 2)
        out_set{i} = int64(out_set{i});
    end
end

% A = {[0 1 1; 2 3 1; 1 3 1; 4 2 1; 1 1 2;]}
% A = {[0 1 1; 2 3 1; 1 3 1; 4 2 1;]} : works