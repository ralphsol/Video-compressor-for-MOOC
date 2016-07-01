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
    BW = imcrop(BW, [130 5 595 470]);

    videoFrames = cat(3,videoFrames,BW);
end

diff = [];
for i = 1:(num-1)
    %figure, imshow( imabsdiff((videoFrames(:, :, i)), (videoFrames(:, :, i+1))), [] );
    diff = cat(3, diff, ( imabsdiff((videoFrames(:, :, i)), (videoFrames(:, :, i+1))) ) );
    %diff = cat(3, diff, ( (videoFrames(:, :, i+1)) - (videoFrames(:, :, i))) );
end



[x, y, z] = size(diff);
%disp(x);
%disp(y);
%disp(z);

intensity_threshold = 0;
res_stroke = [];
res_erase = [];
for k = 1:z
    progressIndication = sprintf('Processed diff[%d]',k);
    disp(progressIndication);
    if max(max(diff(:, :, k)))==0
       continue;
    end
    for i = 1:x
       for j = 1:y
           if diff(i, j, k)>intensity_threshold
               res_stroke = cat(1, res_stroke, [i, j, double(k)/double(30)]);
           elseif  diff(i, j, k) < -intensity_threshold
               res_erase = cat(1, res_erase, [i, j, double(k)/double(30)]);
           end
       end           
   end
end
