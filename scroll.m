sc_in = imread('C:\Users\Harshil\Desktop\SURA\Resources\scroll_init.png');
sc_in = double(rgb2gray(sc_in));
sc_fin = imread('C:\Users\Harshil\Desktop\SURA\Resources\scroll_fin.png');
sc_fin = double(rgb2gray(sc_fin));

%won't hold if overlaps
%imagesc(sc_in);
%imagesc(sc_fin);

cc = xcorr2(sc_fin,sc_in);
[max_cc, imax] = max(abs(cc(:)));
[ypeak, xpeak] = ind2sub(size(cc),imax(1));

figure
plot(cc(:))
title('Cross-Correlation')
hold on
plot(imax,max_cc,'or')
hold off
text(imax*1.05,max_cc,'Maximum')

corr_offset = [(ypeak-size(sc_in,1)) (xpeak-size(sc_in,2))];

disp(corr_offset);