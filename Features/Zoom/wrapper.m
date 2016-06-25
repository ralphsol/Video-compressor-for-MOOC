U = imread('C:\Users\Harshil\Desktop\SURA\Resources\zoom_init.png');
U = double(rgb2gray(U));
[CA_in] = dwt2(U, 'haar');
[CA_in] = dwt2(CA_in, 'haar');
[CA_in] = dwt2(CA_in, 'haar');
[CA_in] = dwt2(CA_in, 'haar');
imshow(CA_in);

V = imread('C:\Users\Harshil\Desktop\SURA\Resources\zoom_fin.png');
V = double(rgb2gray(V));
[CA_fin] = dwt2(V, 'haar');
[CA_fin] = dwt2(CA_fin, 'haar');
[CA_fin] = dwt2(CA_fin, 'haar');
[CA_fin] = dwt2(CA_fin, 'haar');
figure, imshow(CA_fin);

is_zoom(CA_in, CA_fin);
