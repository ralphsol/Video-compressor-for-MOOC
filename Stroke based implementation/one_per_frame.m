function [ out_list ] = one_per_frame( B )

    time_set = {[]};
    val = B(1, 3);
    for i = 1:size(B, 1)
       if B(i, 3)~=val
          val = B(i, 3);
          time_set{end+1} = [B(i, :);];
       else
          time_set{end} = [time_set{end}; B(i, :)];
       end
    end
    
    list = [];
    for i = 1:size(time_set, 2)
        tmp_diff = stroke_diff(time_set{i}); % is a list
        max_val = 0;
        tmp_list = [];
        for j = 1:size(tmp_diff, 2)
            if size(tmp_diff{j}, 1) > max_val
                tmp_list = tmp_diff{j};
            end
        end
        list = [list; tmp_list;];
    end
    
    out_list = list;
    
end