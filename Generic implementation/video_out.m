filename = 'C:\Users\Harshil\Desktop\SURA\Resources\activ_vid.mp4';
% filename = 'C:\Users\Harshil\Desktop\SURA\Resources\white_vid.mp4';
mov = VideoReader(filename);
num = mov.NumberOfFrames;

% img_count = 0;
% img_th = 10000;
intensity_th = 0;

% fr_in = imresize(imcrop(rgb2gray(read(mov, 1)), [130 5 595 470]), [800 800]);
fr_in = imresize(rgb2gray(read(mov, 1)), [800 800]);
imwrite(fr_in, 'C:\Users\Harshil\Desktop\SURA\Resources\Test - Hybrid\base.jpg');

res = [];
% for i = 1:250
for i = 1:num-1
    fr_in = imresize(rgb2gray(read(mov, i)), [800 800]);
    fr_fin = imresize(rgb2gray(read(mov, i+1)), [800 800]);
    % figure, imshow( imabsdiff(fr_in, fr_fin), [] );
    diff = imabsdiff(fr_in, fr_fin);
    % disp(size(find(diff), 1));
    progressIndication = sprintf('Processed diff[%d]',i);
    disp(progressIndication);
    if max(max(diff))==0
       continue;
    end
    
    % diff(diff < intensity_th) = 0;
    [row, col] = find(diff);
    val = [];
    for x = 1:size(row, 1)
        val = [val; fr_fin(row(x), col(x));];
    end
    res = [res; row, col, uint16(val), ones(size(row), 1)*i*33.3333;];
end

delete('/frames/*.jpg')
I = ones(800, 800)*255;
i = 1;
time = res(1, 4);
while i<=size(res, 1)
    while res(i, 4)==time
        I(res(i, 1), res(i, 2)) = res(i, 3);
        i = i + 1;
        if i > size(res, 1)
           break; 
        end
    end
    % figure, imshow(gray2rgb(I));
    filename = sprintf('frames/Frame-%d.jpg',time);
    imwrite(gray2rgb(uint8(I)), filename);
    if i<=size(res, 1)
       time = res(i, 4); 
    end
end


imageNames = dir(fullfile('frames','*.jpg'));
imageNames = {imageNames.name}';
imageNames = sort_nat(imageNames);

outputVideo = VideoWriter(fullfile('frames','lecture.avi'));
outputVideo.FrameRate = 10;
open(outputVideo)

for ii = 1:length(imageNames)
   img = imread(fullfile('frames',imageNames{ii}));
   writeVideo(outputVideo,img)
end

close(outputVideo)
