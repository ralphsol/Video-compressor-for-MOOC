% % rms additions
% I = rgb2gray(imread('C:\Users\Harshil\Desktop\SURA\Resources\dr-no-poster.jpg'));
% I(I<0) = 0;
% disp(sqrt(mean(I(:).^2)));

% % rms subtractions
% I = rgb2gray(imread('C:\Users\Harshil\Desktop\SURA\Resources\dr-no-poster.jpg'));
% I = -I;
% I(I<0) = 0;
% disp(sqrt(mean(I(:).^2)));

% % mean
% I = rgb2gray(imread('C:\Users\Harshil\Desktop\SURA\Resources\dr-no-poster.jpg'));
% disp(mean(mean(I)));

% % 2-D cross correlation
% I = double(rgb2gray(imread('C:\Users\Harshil\Desktop\SURA\Resources\dr-no-poster.jpg')));
% % disp(xcorr2(I));
% [CA_in] = dwt2(I, 'haar');
% [CA_in] = dwt2(CA_in, 'haar');
% [CA_in] = dwt2(CA_in, 'haar');
% [CA_in] = dwt2(CA_in, 'haar');
% [CA_in] = dwt2(CA_in, 'haar');
% [CA_in] = dwt2(CA_in, 'haar');
% [CA_in] = dwt2(CA_in, 'haar');
% [CA_in] = dwt2(CA_in, 'haar');
% disp(xcorr2(CA_in));

% % Number of corner points
% I = rgb2gray(imread('C:\Users\Harshil\Desktop\SURA\Resources\dr-no-poster.jpg'));
% C = corner(I);
% % disp(size(C, 1));
% [features, valid_points] = extractFeatures(I, C);
% disp(features);

% % HOG features - existence
% I = imread('C:\Users\Harshil\Desktop\SURA\Resources\dr-no-poster.jpg');
% % disp(xcorr2(I));
% [CA_in] = dwt2(I, 'haar');
% [CA_in] = dwt2(CA_in, 'haar');
% [CA_in] = dwt2(CA_in, 'haar');
% [CA_in] = dwt2(CA_in, 'haar');
% [CA_in] = dwt2(CA_in, 'haar');
% [CA_in] = dwt2(CA_in, 'haar');
% [CA_in] = dwt2(CA_in, 'haar');
% [CA_in] = dwt2(CA_in, 'haar');
% disp(extractHOGFeatures(CA_in));

% % SURF features
% I = rgb2gray(imread('C:\Users\Harshil\Desktop\SURA\Resources\dr-no-poster.jpg'));
% points = detectSURFFeatures(I);
% [features, valid_points] = extractFeatures(I, points);
% disp(features);

% % MSER features
% I = rgb2gray(imread('C:\Users\Harshil\Desktop\SURA\Resources\dr-no-poster.jpg'));
% regions = detectMSERFeatures(I);
% [features, valid_points] = extractFeatures(I,regions,'Upright',true);
% disp(features);

% % Color histogram
% I = imread('C:\Users\Harshil\Desktop\SURA\Resources\dr-no-poster.jpg');
% image = I;
% %Split into RGB Channels
% Red = image(:,:,1);
% Green = image(:,:,2);
% Blue = image(:,:,3);
% %Get histValues for each channel
% [yRed, x] = imhist(Red);
% [yGreen, x] = imhist(Green);
% [yBlue, x] = imhist(Blue);
% %Plot them together in one plot
% plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');

% % Color quantization
% I = imread('C:\Users\Harshil\Desktop\SURA\Resources\dr-no-poster.jpg');
% thresh = multithresh(I,2);
% seg_I = imquantize(I,thresh);

% % LBP features - existence
% I = rgb2gray(imread('C:\Users\Harshil\Desktop\SURA\Resources\dr-no-poster.jpg'));
% features = extractLBPFeatures(I);

% % BRISK features - existence
% I = rgb2gray(imread('C:\Users\Harshil\Desktop\SURA\Resources\dr-no-poster.jpg'));
% features = detectBRISKFeatures(I);
