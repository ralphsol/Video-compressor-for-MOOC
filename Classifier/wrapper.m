% activity values
fid = fopen('C:\Users\Harshil\Desktop\SURA\Resources\Labelled-data\data4.txt','rt');
tmp = textscan(fid, '%d', 'Delimiter', '\n');
activity = tmp{1};
fclose(fid);

% features list
file = 'C:\Users\Harshil\Desktop\SURA\Resources\Labelled-data\vid4.mp4';
mov = VideoReader(file);
feat_list = [];
% for i = 1:20
for i = 1:mov.NumberOfFrames-1
    list = [];
    diff = read(mov, i+1) - read(mov, i);

    progressIndication = sprintf('Processed diff[%d]',i);
    disp(progressIndication);

    I = rgb2gray(diff);
    I(I<0) = 0;
    rms_add = sqrt(mean(I(:).^2));
    list = [list, rms_add;];

    I = rgb2gray(diff);
    I = -I;
    I(I<0) = 0;
    rms_sub = sqrt(mean(I(:).^2));
    list = [list, rms_sub;];

    I = rgb2gray(diff);
    list = [list, mean(mean(I));];

%     I = double(rgb2gray(read(mov, i)));
%     J = double(rgb2gray(read(mov, i+1)));
%     c = normxcorr2(I, J);
%     [ypeak, xpeak] = find(c==max(c(:)));
%     list = [list, ypeak, xpeak;];
    
%     I = rgb2gray(diff);
%     C = corner(I);
%     list = [list, size(C, 1);];

    feat_list = [feat_list; list;];
end

nbGau = train_sc(feat_list, activity(1:20), 'NBC');
R = test_sc(nbGau, feat_list, 'QDA', activity(1:20));
disp(1 - R.ACC);
% CC = train_sc(feat_list, activity(1:20), 'NBC');
% 10-fold cross-validation naive bayes
[R, CC] = xval(feat_list, activity(1:20), 'NBC', 10);
disp(R.ERR);
