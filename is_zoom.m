function [ res ] = is_zoom( U, V )
    res = 0;
    u_set = radon_zoom(U);
    v_set = radon_zoom(V);
    
    for i = 1:size(u_set, 2);
        for j = 1:size(v_set, 2);
            if isequal(u_set{i}, v_set{j})==1
                disp(i);
                disp(j);
                res = 1;
            end
        end
    end
    
end