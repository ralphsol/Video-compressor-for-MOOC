sc_in = imread('C:\Users\Harshil\Desktop\SURA\Resources\scroll_init.png');
sc_in = double(rgb2gray(sc_in));
sc_fin = imread('C:\Users\Harshil\Desktop\SURA\Resources\scroll_fin.png');
sc_fin = double(rgb2gray(sc_fin));

%won't hold if overlaps
%imagesc(sc_in);
%hold on
%imagesc(sc_fin);

c = normxcorr2(sc_in,sc_fin);
figure, surf(c), shading flat;
[ypeak, xpeak] = find(c==max(c(:)));
yoffSet = ypeak-size(sc_in,1);
xoffSet = xpeak-size(sc_in,2);

corr_offset = [(yoffSet) (xoffSet)];

disp(corr_offset);