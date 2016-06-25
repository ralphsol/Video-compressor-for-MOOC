function [ res ] = is_zoom( U, V )
    u_set = radon_zoom(U);
    v_set = radon_zoom(V);
    
    min = inf;
    res = 0;
    for i = 1:( max(size(u_set, 2), size(v_set, 2)) - abs(size(u_set, 2) - size(v_set, 2)) )
%        if isequal(u_set{i}, v_set{i})==1
%            res = 1;
%        end
%     end
%     disp(res);

        size_diff = size(u_set{i}, 1) - size(v_set{i}, 1);
        if size_diff > 0
            v_set{i} = padarray(v_set{i}, [size_diff 0], 'post');
        else
            u_set{i} = padarray(u_set{i}, [-size_diff 0], 'post');
        end
        if rms(u_set{i} - v_set{i}) < min
%           disp(i);
%           disp(j);
%           res = 1;
            min = rms(u_set{i} - v_set{i});
            res = min;
            disp(res);
        end
    end

end