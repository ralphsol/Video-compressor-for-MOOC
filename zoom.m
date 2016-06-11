onion   = rgb2gray(imread('onion.png'));
peppers = rgb2gray(imread('peppers.png'));
imshowpair(peppers,onion,'montage');

c = normxcorr2(onion,peppers);
figure, surf(c), shading flat;

[ypeak, xpeak] = find(c==max(c(:)));

yoffSet = ypeak-size(onion,1);
xoffSet = xpeak-size(onion,2);

hFig = figure;
hAx  = axes;
imshow(peppers,'Parent', hAx);
imrect(hAx, [xoffSet+1, yoffSet+1, size(onion,2), size(onion,1)]);