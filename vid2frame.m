filename = 'C:\Users\Harshil\Desktop\SURA\small-lect.mp4';
mov = VideoReader(filename);

% Output folder
outputFolder = fullfile(cd, 'frames');
if ~exist(outputFolder, 'dir')
   mkdir(outputFolder);
end

%getting no of frames

numberOfFrames = mov.NumberOfFrames;
disp(mov.NumberofFrames)
numberOfFramesWritten = 0;

videoFrames = [];

for frame = 1000 :1020
   thisFrame = read(mov, frame);
   videoFrames = cat(4,videoFrames,thisFrame);
   outputBaseFileName = sprintf('%3.3d.bmp', frame);
   outputFullFileName = fullfile(outputFolder, outputBaseFileName);
   imwrite(thisFrame, outputFullFileName, 'bmp');
   progressIndication = sprintf('Wrote frame %4d of %d.', frame,numberOfFrames);
   disp(progressIndication);
   numberOfFramesWritten = numberOfFramesWritten + 1;
end

progressIndication = sprintf('Wrote %d frames to folder "%s"',numberOfFramesWritten,outputFolder);
disp(progressIndication);
figure, imshow( imabsdiff((videoFrames(:, :, :, 1)), (videoFrames(:, :, :, 20))), [] );
%disp( isequal((videoFrames(:, :, :, 1)), (videoFrames(:, :, :, 20))) );