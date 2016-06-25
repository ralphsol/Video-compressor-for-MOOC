function [ res_set ] = sort_time( stroke_set )

    set_by_size = {};
    while size(stroke_set, 2) > 0
       max_size = 0;
       index = 1;
       for i = 1:size(stroke_set, 2)
          if size(stroke_set{i}, 1) > max_size
             max_size =  size(stroke_set{i}, 1);
             index = i;
          end
       end
       set_by_size{end+1} = stroke_set{index};
       stroke_set(index) = [];
    end
        
    out_set = {};
    list = [0 0;];
    for i=1:size(set_by_size, 2)
        overlaps = 0;
        for j=1:size(list, 1)
           if (set_by_size{i}(1, 3) >= list(j, 2))||(set_by_size{i}(end, 3) <= list(j, 1)) % then can be added
               continue;
           else
               overlaps = 1;
           end
        end
        if overlaps==0
           out_set{end+1} = set_by_size{i};
           list = [list; set_by_size{i}(1, 3) set_by_size{i}(end, 3);];
        end
    end

    [I J] = sortrows(list(2:end,:), 1);
    res_set = {};
    for i=1:size(out_set, 2)
       res_set{end+1} = out_set{J(i)}; 
    end
    
    for i=1:size(res_set, 2)
       disp([res_set{i}(1, 3) res_set{i}(end, 3)]); 
    end
    
end

