filename = 'C:\Users\Harshil\Desktop\SURA\Resources\activ_vid.mp4';
% filename = 'C:\Users\Harshil\Desktop\SURA\Resources\white_vid.mp4';
mov = VideoReader(filename);
num = mov.NumberOfFrames;

% img_count = 0;
% img_th = 10000;
intensity_th = 20;

% fr_in = imresize(imcrop(rgb2gray(read(mov, 1)), [130 5 595 470]), [800 800]);
fr_in = imresize(rgb2gray(read(mov, 1)), [800 800]);
imwrite(fr_in, 'C:\Users\Harshil\Desktop\SURA\Resources\Test - Hybrid\base.jpg');

res = [];
% for i = 1:50
for i = 1:num-1
    % fr_in = imresize(imcrop(rgb2gray(read(mov, i)), [130 5 595 470]), [800 800]);
    % fr_fin = imresize(imcrop(rgb2gray(read(mov, i+1)), [130 5 595 470]), [800 800]);
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
%     if size(find(diff), 1) > img_th
%         img_name = sprintf('Image-%d.jpg', img_count);
%         imwrite(fr_fin, strcat('C:\Users\Harshil\Desktop\SURA\Resources\Test - Hybrid\', img_name));
%         img_count = img_count + 1;
%     else
    diff(diff < intensity_th) = 0;
    [row, col] = find(diff);
    val = [];
    for x = 1:size(row, 1)
        val = [val; fr_fin(row(x), col(x));];
    end
    res = [res; row, col, uint16(val), ones(size(row), 1)*i*33.3333;];
%    end
end

fileID = fopen('C:\Users\Harshil\Desktop\SURA\Resources\Test - Hybrid\output.txt','w');
allOneString = sprintf('%.0f ', res(:, 1));
fprintf(fileID,'%s\n', allOneString);
allOneString = sprintf('%.0f ', res(:, 2));
fprintf(fileID,'%s\n', allOneString);
allOneString = sprintf('%.0f ', res(:, 3));
fprintf(fileID,'%s\n', allOneString);
allOneString = sprintf('%.0f ', res(:, 4));
fprintf(fileID,'%s\n', allOneString);
fclose(fileID);
