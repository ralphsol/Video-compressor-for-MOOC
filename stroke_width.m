%im = im2bw(imread('C:\Users\Harshil\Desktop\SURA\Resources\test_width.jpg'));
im = im2bw(imread('C:\Users\Harshil\Desktop\SURA\Resources\scroll_fin.png'));

[D,IDX] = bwdist(im);
%imshow(D);

locmax = imregionalmax(D);
%locmax = D > imdilate(D, [0 0 0; 0 0 0; 0 0 1]);   % figure the parameters
%locmax = bwmorph(D, 'thin', inf);   % figure the parameters
%figure, imshow(locmax);

thick_sum = 0;
sum = 0;
[x, y] = size(locmax);
for i = 1:x
   for j = 1:y
      if locmax(i, j) > 0
        thick_sum = thick_sum + D(i, j);
        sum = sum + 1;
      end
   end
end
width = 2.0 * thick_sum / sum;
disp(width);