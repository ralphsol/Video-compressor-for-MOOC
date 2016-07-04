filename = 'C:\Users\Harshil\Desktop\SURA\Resources\gesture.mp4';
mov = VideoReader(filename);

numberOfFrames = mov.NumberOfFrames;
%disp(mov.NumberofFrames)

videoFrames = [];
%num = numberOfFrames;
%num = 167;
num = 24;

label = zeros(num-1, 1);
for i = 1:(num-1)
%     fr_in = imcrop(bwmorph(edge(rgb2gray(read(mov, i))), 'close'), [130 5 595 470]);
%     fr_fin = imcrop(bwmorph(edge(rgb2gray(read(mov, i+1))), 'close'), [130 5 595 470]);
    fr_in = imcrop(read(mov, i), [130 5 595 470]);
    fr_fin = imcrop(read(mov, i+1), [130 5 595 470]);
    figure, imshow( imresize(imabsdiff(fr_in, fr_fin),[400 506]), [] );
    prompt = '0 - no activity ; 1 - stroke ; 2 - erase ; 3 - image ; 4 - pan ; 5 - zoom ; ';
    x = input(prompt);
    label(i) = x;
end
close all;
disp(label);