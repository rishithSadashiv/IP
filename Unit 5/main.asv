% PSF demo
clc
close all

x=zeros(512,512);
x(256,256)=255;
figure,imshow(x)
h=[1 2 3 ;4 5 6 ;7 8 9 ];
y=conv2(x,h,'same');
% subplot(1,2,1),imshow(x)
% subplot(1,2,2),imshow(y)

figure,imshow((y))
impixelinfo

% Noise PDFs

clc
close all
clear all
x=50*ones(512,512);
x(60:440,60:440)=100;
x(120:380,120:380)=200;
%x=imread('test.jpg');
figure,imshow(uint8(x))
impixelinfo
%x=rgb2gray(x);
figure,imhist(uint8(x))
x=uint8(x);
J = IMNOISE(x,'gaussian',0,0.001);
%J=255*J;
figure,imshow(uint8(J))

figure,imhist(J)

% Noise estimation from smooth region


y1=J(150:350,150:300);

y2=J(200:300,200:300);

y3=J(250:260,250:260);

subplot(2,3,1), imshow(y1)
subplot(2,3,2), imshow(y2)
subplot(2,3,3), imshow(y3)
subplot(2,3,4), imhist(y1)
subplot(2,3,5), imhist(y2)
subplot(2,3,6), imhist(y3)

% Noise addition:Test Pattern

clc
close all

x=50*ones(512,512);
x(60:440,60:440)=100;
x(120:380,120:380)=200;
figure,imshow(uint8(x))
title('Test Image')
y = 0 + sqrt(100) * randn(512,512);
z=x+y;
figure,imshow(uint8(z))
title('Noisy Image:Gaussian')
figure,imhist(uint8(z))
y1= 25 * rand(512,512);
y1=y1-mean(mean(y1));
z1=x+y1;
figure,imshow(uint8(z1))
title('Noisy Image:Uniform')
figure,imhist(uint8(z1))
title('Histogram')
x=uint8(x);
J = IMNOISE(x,'salt & pepper',0.05);
figure,imshow(uint8(J))
figure,imhist(uint8(J))

%Noise addition : child Image
clc
close all

a=imread('child.jpg');
a=rgb2gray(a);
figure,imshow(a)
impixelinfo

[m n]=size(a);
J = IMNOISE(a,'salt & pepper',0.05);
figure,imshow((J))
figure,imhist(J)

y1= 50 * randn(m,n);
y1=y1-mean(mean(y1));
z1=double(a)+double(y1);
figure,imshow(uint8(z1))

a=a(200:300,225:250);
figure,imshow(uint8(a))
figure,imhist(uint8(a))

z2=z1(200:300,225:250);
figure,imshow(uint8(z2))
figure,imhist(uint8(z2))


% Blur

clc
close all

x=imread('child.jpg');
%x=rgb2gray(x);
figure,imshow(x)

h=FSPECIAL('gaussian',[15 15],1);
y=imfilter(x,h);
figure,imshow(y)
title('Defocus blur');

h=FSPECIAL('motion',12,0);
y=imfilter(x,h);
figure,imshow(y)
title('Motion blur')

% Blur estimation by observation
clc
close all

x=imread('house.png');
figure,imshow(x)

h=FSPECIAL('gaussian',[7 7],1);
y=imfilter(x,h);
figure,imshow(y)
impixelinfo



