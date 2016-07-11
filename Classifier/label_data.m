filename = 'C:\Users\Harshil\Desktop\SURA\Resources\Test - Vishnu\vid2.mp4';
% filename = 'C:\Users\Harshil\Desktop\SURA\Resources\pointer_vid.mp4';
mov = VideoReader(filename);

numberOfFrames = mov.NumberOfFrames;
%disp(mov.NumberofFrames)

videoFrames = [];
%num = numberOfFrames;
%num = 167;
num = 24;

label = zeros(num-1, 1);
for i = 1:(num-1)
% for i = 1:10
%     fr_in = imcrop(bwmorph(edge(rgb2gray(read(mov, i))), 'close'), [130 5 595 470]);
%     fr_fin = imcrop(bwmorph(edge(rgb2gray(read(mov, i+1))), 'close'), [130 5 595 470]);
    fr_in = imcrop(read(mov, i), [130 5 595 470]);
    fr_fin = imcrop(read(mov, i+1), [130 5 595 470]);
%    figure, imshow( imresize(fr_in,[400 506]), [] );
%    figure, imshow( imresize(fr_fin,[400 506]), [] );
    I = imabsdiff(fr_in, fr_fin);
    if sqrt(mean(I(:).^2)) < 0.25
       label(i) = 0;
    else
        figure, imshow( imresize(imabsdiff(fr_in, fr_fin),[400 506]), [] );
        prompt = sprintf('%d > 0 - no activity; 1 - stroke; 2 - erase; 3 - image; 4 - pan; 5 - zoom; 6 - change; ', i);
        x = input(prompt);
        if x==6
            y = input('To be changed : ');
            z = input('New value : ');
            label(y) = z;
            x = input('Value for current frame : ');
            label(i) = x;
        else
            label(i) = x;
        end
    end
end
close all;
disp(label);
