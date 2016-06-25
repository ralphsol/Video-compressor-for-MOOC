function [ out_set ] = frame_split( stroke_set )

    out_set = {};
    for i=1:size(stroke_set, 2)
        list = [];
        prev_time = stroke_set{i}(1, 3);
        for j=1:size(stroke_set{i}, 1)
            if stroke_set{i}(j, 3) - prev_time < 0.4
                list = [stroke_set{i}(j,:) ; list];
            else
                if size(list, 1) > 0
                    out_set{end+1} = list;
                end
                list = [stroke_set{i}(j,:);];
            end
            prev_time = stroke_set{i}(j, 3);
        end
        if size(list, 1) > 0
            out_set{end+1} = list;
        end
    end

end

