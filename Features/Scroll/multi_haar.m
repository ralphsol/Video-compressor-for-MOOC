sc_in = imread('C:\Users\Harshil\Desktop\SURA\Resources\scroll_init.png');
sc_in = double(rgb2gray(sc_in));
[CA_in] = dwt2(sc_in, 'haar');
[CA_in] = dwt2(CA_in, 'haar');
[CA_in] = dwt2(CA_in, 'haar');
[CA_in] = dwt2(CA_in, 'haar');
imshow(CA_in);

sc_fin = imread('C:\Users\Harshil\Desktop\SURA\Resources\scroll_fin.png');
sc_fin = double(rgb2gray(sc_fin));
[CA_fin] = dwt2(sc_fin, 'haar');
[CA_fin] = dwt2(CA_fin, 'haar');
[CA_fin] = dwt2(CA_fin, 'haar');
[CA_fin] = dwt2(CA_fin, 'haar');
figure, imshow(CA_fin);

c = normxcorr2(CA_in,CA_fin);
figure, surf(c), shading flat;
[ypeak, xpeak] = find(c==max(c(:)));
yoffSet = ypeak-size(CA_in,1);
xoffSet = xpeak-size(CA_in,2);

corr_offset = [(yoffSet) (xoffSet)];

disp(corr_offset);