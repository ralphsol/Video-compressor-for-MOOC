filename = 'C:\Users\Harshil\Desktop\SURA\Resources\gesture.mp4';
mov = VideoReader(filename);

numberOfFrames = mov.NumberOfFrames;
%disp(mov.NumberofFrames)

videoFrames = [];
%num = numberOfFrames;

intensity_threshold = 0;
res_stroke = [];
res_erase = [];
for i = 1:167
    fr_in = imcrop(bwmorph(edge(rgb2gray(read(mov, i))), 'close'), [130 5 595 470]);
    fr_fin = imcrop(bwmorph(edge(rgb2gray(read(mov, i+1))), 'close'), [130 5 595 470]);
    %figure, imshow( imabsdiff(fr_in, fr_fin), [] );
    diff = imabsdiff(fr_in, fr_fin);
    [x, y] = size(diff);
    progressIndication = sprintf('Processed diff[%d]',i);
    disp(progressIndication);
    if max(max(diff))==0
       continue;
    end
    [row, col] = find(diff > intensity_threshold);
    res_stroke = [res_stroke; row, col, ones(size(row), 1)*double(i)/double(30);];
    [row, col] = find(diff < intensity_threshold);
    res_erase = [res_erase; row, col, ones(size(row), 1)*double(i)/double(30);];
end

fileID = fopen('output.txt','w');
allOneString = sprintf('%.0f ', res_stroke(:, 1));
fprintf(fileID,'%s\n', allOneString);
allOneString = sprintf('%.0f ', res_stroke(:, 2));
fprintf(fileID,'%s\n', allOneString);
allOneString = sprintf('%.3f ', res_stroke(:, 3));
fprintf(fileID,'%s\n', allOneString);
fclose(fileID);

%res(:, 3) = [];
stroke_set = stroke_diff(res_stroke);
disp(stroke_set);

% clear the exisiting data
fileID = fopen('output-set.txt','w');
fprintf(fileID,'');
fclose(fileID);

for i=1:size(stroke_set, 2)
    fileID = fopen('output-set.txt','at');
    fprintf(fileID,'<stroke> \n\t');
    fclose(fileID);

    % storing according to closeness
    %data = [2,2 ; 2,3 ; 1,2 ; 1,3 ; 2,1 ; 1,1 ; 3,2 ; 3,3 ; 3 ,1];
%     data = stroke_set{i};
%     dist = pdist2(data,data);
%     N = size(data,1);
%     result = NaN(1,N);
%     %result(1) = 1; % first point is first row in data matrix
%     
%     data = far_point(data);
%     result(1) = 1; % farthest point in data matrix
% 
%     for ii=2:N
%         dist(:,result(ii-1)) = Inf;
%         [~, closest_idx] = min(dist(result(ii-1),:));
%         result(ii) = closest_idx;
%     end
%     sorted_data = data(result, :);

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
close all;

% for i=1:size(stroke_set, 2)
%    stroke_set{i} = sortrows(stroke_set{i}, [3 1 2]);
% end
