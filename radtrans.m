%I = imread('C:\Users\Harshil\Desktop\SURA\dr-no-poster.jpg');
I = imread('C:\Users\Harshil\Desktop\SURA\test.png');
I = rgb2gray(I);
BW = edge(I);
%imshow(I)
%figure, imshow(BW)

theta = 0:180;
[R,xp] = radon(BW,theta);
imshow(R,[],'Xdata',theta,'Ydata',xp,...
            'InitialMagnification','fit')
xlabel('\theta (degrees)')
ylabel('x''')
colormap(hot), colorbar
axis normal
iptsetpref('ImshowAxesVisible','off')