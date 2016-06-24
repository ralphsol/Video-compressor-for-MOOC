filename = 'C:\Users\Harshil\Desktop\SURA\Resources\gesture.mp4';
mov = VideoReader(filename);

numberOfFrames = mov.NumberOfFrames;
%disp(mov.NumberofFrames)

videoFrames = [];
%num = numberOfFrames;
num = 167;
%num = 24;
for frame = 1:num
    thisFrame = read(mov, frame);
    thisFrame = rgb2gray(thisFrame);
    BW = edge(thisFrame);
    %figure, imshow(BW);

    BW = bwmorph(BW, 'close');

    videoFrames = cat(3,videoFrames,BW);
end

diff = [];
for i = 1:(num-1)
    %figure, imshow( imabsdiff((videoFrames(:, :, i)), (videoFrames(:, :, i+1))), [] );
    diff = cat(3, diff, ( imabsdiff((videoFrames(:, :, i)), (videoFrames(:, :, i+1))) ) );
end



[x, y, z] = size(diff);
%disp(x);
%disp(y);
%disp(z);

res = [];
for k = 1:z
    progressIndication = sprintf('Processed diff[%d]',k);
    disp(progressIndication);
    for i = 1:x
       for j = 1:y
           if diff(i, j, k)>0
               res = cat(1, res, [i, j, double(k)/double(30)]);
           end
       end           
   end
end
[x, y, z] = size(res);
%disp(x);
%disp(y);
%disp(z);
%disp(res(:, 3));
%disp(res);

fileID = fopen('output.txt','w');
allOneString = sprintf('%.0f ', res(:, 1));
fprintf(fileID,'%s\n', allOneString);
allOneString = sprintf('%.0f ', res(:, 2));
fprintf(fileID,'%s\n', allOneString);
allOneString = sprintf('%.3f ', res(:, 3));
fprintf(fileID,'%s\n', allOneString);
fclose(fileID);

res(:, 3) = [];
stroke_set = stroke_diff(res);
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
    data = stroke_set{i};
    dist = pdist2(data,data);
    N = size(data,1);
    result = NaN(1,N);
    %result(1) = 1; % first point is first row in data matrix
    
    data = far_point(data);
    result(1) = 1; % farthest point in data matrix

    for ii=2:N
        dist(:,result(ii-1)) = Inf;
        [~, closest_idx] = min(dist(result(ii-1),:));
        result(ii) = closest_idx;
    end
    sorted_data = data(result, :);

%   for j=1:size(stroke_set{i}, 1)
    for j=1:size(sorted_data, 1)
        fileID = fopen('output-set.txt','at');
%       tmp = [stroke_set{i}(j,1), stroke_set{i}(j,2), double(1)/double(30)];
        tmp = [sorted_data(j,1), sorted_data(j,2), double(1)/double(30)];
        allOneString = sprintf('%.0f %.0f %.3f ', tmp(1), tmp(2), tmp(3));
        fprintf(fileID,'%s', allOneString);
        fclose(fileID);
    end
    
    fileID = fopen('output-set.txt','at');
    fprintf(fileID,'\n</stroke> \n');
    fclose(fileID);
end
close all;