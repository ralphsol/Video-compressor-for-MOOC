filename = 'C:\Users\Harshil\Desktop\SURA\gesture.mp4';
mov = VideoReader(filename);

numberOfFrames = mov.NumberOfFrames;
%disp(mov.NumberofFrames)

videoFrames = [];
%num = numberOfFrames;
num = 167;
for frame = 1:num
    thisFrame = read(mov, frame);
    thisFrame = rgb2gray(thisFrame);
    BW = edge(thisFrame);
    %figure, imshow(BW);
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
disp(x);
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

close all;