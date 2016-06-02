filename = 'C:\Users\Harshil\Desktop\SURA\Resources\gesture.mp4';
mov = VideoReader(filename);

numberOfFrames = mov.NumberOfFrames;
%disp(mov.NumberofFrames)

videoFrames = [];
%num = numberOfFrames;
%num = 167;
num = 50;
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


% clear the exisiting data
fileID = fopen('output-test.txt','w');
fprintf(fileID,'');
fclose(fileID);

%0 -> 1 : <stroke>
%1 -> 1 : nothing
%1 -> 0 : </stroke>
bin_val = 0;
res = [];
for k = 1:z
    progressIndication = sprintf('Processed diff[%d]',k);
    disp(progressIndication);
    bin_prev = bin_val;
    bin_val = 0;
    for i = 1:x
       for j = 1:y
           if diff(i, j, k)>0
                bin_val = 1;
                if bin_prev==0
                    fileID = fopen('output-test.txt','at');
                    res = [i, j, double(k)/double(30)];
                    allOneString = sprintf('<stroke> \n\t%.0f %.0f %.3f ', res(1), res(2), res(3));
                    fprintf(fileID,'%s', allOneString);
                    fclose(fileID);
                    bin_prev = 1;
                else
                    fileID = fopen('output-test.txt','at');
                    res = [i, j, double(k)/double(30)];
                    allOneString = sprintf('%.0f %.0f %.3f ', res(1), res(2), res(3));
                    fprintf(fileID,'%s', allOneString);
                    fclose(fileID);
                end
           end
       end
    end
    if bin_val==1
        if k==z
            fileID = fopen('output-test.txt','at');
            fprintf(fileID,'\n</stroke> \n');
            fclose(fileID);            
        end
        disp(k);
    else
        if bin_prev==1
            fileID = fopen('output-test.txt','at');
            fprintf(fileID,'\n</stroke> \n');
            fclose(fileID);            
        end
        %fileID = fopen('output-test.txt','at');
        %fprintf(fileID,'\n');
        %fclose(fileID);        
    end
end

close all;