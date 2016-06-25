out_list = one_per_frame(res); % res from test_conv.m
disp(size(out_list));
stroke_set = stroke_diff(out_list);
disp(stroke_set);
out_set = frame_split(stroke_set);
disp(out_set);
stroke_set = out_set;


% clear the exisiting data
fileID = fopen('output-set.txt','w');
fprintf(fileID,'');
fclose(fileID);
for i=1:size(stroke_set, 2)
    fileID = fopen('output-set.txt','at');
    fprintf(fileID,'<stroke> \n\t');
    fclose(fileID);
    stroke_set{i} = sortrows(stroke_set{i}, [3 1 2]);
   for j=1:size(stroke_set{i}, 1)
%    for j=1:size(sorted_data, 1)
        fileID = fopen('output-set.txt','at');
        tmp = [stroke_set{i}(j,1), stroke_set{i}(j,2), stroke_set{i}(j,3)];
%        tmp = [stroke_set{i}(j,1), stroke_set{i}(j,2), double(1)/double(30)];
%        tmp = [sorted_data(j,1), sorted_data(j,2), double(1)/double(30)];
        allOneString = sprintf('%.0f %.0f %.3f ', tmp(1), tmp(2), tmp(3));
        fprintf(fileID,'%s', allOneString);
        fclose(fileID);
    end
    fileID = fopen('output-set.txt','at');
    fprintf(fileID,'\n</stroke> \n');
    fclose(fileID);
end


image = [];
for i=1:480
   tmp_list = []; 
   for j=1:854
       tmp_list = [0, tmp_list];
   end
   image = [image; tmp_list];
end

for i=1:size(stroke_set, 2)
   for j=1:size(stroke_set{i}, 1)
      image(stroke_set{i}(j, 1), stroke_set{i}(j, 2)) = 255;
   end
end

imshow(image);


% [D,IDX] = bwdist(~BW);
% imshow(D);

%locmax = imregionalmax(D);
%locmax = D > imdilate(D, [0 0 0; 0 0 0; 0 0 1]);   % figure the parameters
% locmax = bwmorph(D, 'thin', inf);   % figure the parameters
% figure, imshow(locmax);
