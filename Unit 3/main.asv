% Power law transformations

close all
clc
x=imread('Picture39.jpg');
imshow(x)
x=rgb2gray(x);
x=double(x);
y=x.^(0.6);

figure,imshow(mat2gray(y))

y=x.^(0.4);

figure,imshow(mat2gray(y))

y=x.^(0.3);

figure,imshow(mat2gray(y))

% Bit Plane slicing example
clc
clear all
close all

x=imread('D:\Penguins.jpg');
figure,imshow(x)

y=rgb2gray(x);

figure,imshow(y)
for i=1:768
    for j=1:1024
        t=bitget(y(i,j),8);
        if t==1
            z(i,j)=128;
        else z(i,j)=0;
        end
        t1=bitget(y(i,j),7);
        if t1==1
            z1(i,j)=64;
        else z1(i,j)=0;
        end
        t2=bitget(y(i,j),6);
        if t2==1
            z2(i,j)=32;
        else z2(i,j)=0;
        
        
        
        end
        t3=bitget(y(i,j),5);
        if t3==1
            z3(i,j)=16;
        else z3(i,j)=0;
        
        
        
        end
        t4=bitget(y(i,j),4);
        if t4==1
            z4(i,j)=8;
        else z4(i,j)=0;
        
        
        
        end
         t5=bitget(y(i,j),3);
        if t5==1
            z5(i,j)=4;
        else z5(i,j)=0;
        
        
        
        end
       t6=bitget(y(i,j),2);
        if t6==1
            z6(i,j)=2;
        else z6(i,j)=0;
        
        
        
        end 
        t7=bitget(y(i,j),1);
        if t7==1
            z7(i,j)=1;
        else z7(i,j)=0;
        
        
        
        end 
    end
end
    figure,imshow((z))
     figure,imshow((z1))
     figure,imshow(z2)
      figure,imshow(z3)
          figure,imshow(z4)
          figure,imshow(z5)
          figure,imshow(z6)
     
     figure,imshow(mat2gray(z+z1+z2+z3+z4+z5+z6+z7))
     zt=z+z1+z2+z3;
     figure,imshow(mat2gray(double(y)-zt))
% y1=bitget(y,1);
% figure,imshow(logical(y1))
% 
% y2=bitget(y,2);
% figure,imshow(logical(y2))
% 
% y3=bitget(y,3);
% figure,imshow(logical(y3))
% 
% y4=bitget(y,4);
% figure,imshow(logical(y4))
% 
% y5=bitget(y,5);
% figure,imshow(logical(y5))
% 
% y6=bitget(y,6);
% figure,imshow(logical(y6))
% 
% y7=bitget(y,7);
% figure,imshow(logical(y7))
% 
% y8=bitget(y,8);
% figure,imshow(logical(y8))
% 
% y89=y1+y2+y3+y4+y5+y6+y7+y8;
% figure,imshow(uint8(y89))

% Histogram plot
close all
clc
x=imread('Picture39.jpg');
x=rgb2gray(x);
figure,imshow(x)
figure,imhist(x)

x=imread('Picture39a.jpg');
x=rgb2gray(x);
figure,imshow(x)
figure,imhist(x)

x=imread('Picture39b.jpg');
x=rgb2gray(x);
figure,imshow(x)
figure,imhist(x)

x=imread('Picture39c.jpg');
x=rgb2gray(x);
figure,imshow(x)
figure,imhist(x)

% Histogram Equalization
close all
clc
x=imread('Picture39.jpg');
x=rgb2gray(x);
y=histeq(x);
subplot(2,2,1),imshow(x)
subplot(2,2,2),imshow(y)
subplot(2,2,3),imhist(x)
subplot(2,2,4),imhist(y)

x=imread('Picture39a.jpg');
x=rgb2gray(x);
y=histeq(x);
figure;
subplot(2,2,1),imshow(x)
subplot(2,2,2),imshow(y)
subplot(2,2,3),imhist(x)
subplot(2,2,4),imhist(y)

x=imread('Picture39b.jpg');
x=rgb2gray(x);
y=histeq(x);
figure;
subplot(2,2,1),imshow(x)
subplot(2,2,2),imshow(y)
subplot(2,2,3),imhist(x)
subplot(2,2,4),imhist(y)

x=imread('Picture39c.jpg');
x=rgb2gray(x);
y=histeq(x);
figure;
subplot(2,2,1),imshow(x)
subplot(2,2,2),imshow(y)
subplot(2,2,3),imhist(x)
subplot(2,2,4),imhist(y)

% Spatial filtering : Average filter
close all
clc
x=imread('child.jpg');
x=rgb2gray(x);
h= fspecial('average',[3 3]);
figure,imshow(x);
y=conv2(x,h,'same');
figure,imshow(uint8(y));

h= fspecial('average',[5 5]);
y=conv2(x,h,'same');
figure,imshow(uint8(y));

h= fspecial('average',[7 7]);
y=conv2(x,h,'same');
figure,imshow(uint8(y));

% Spatial filtering : Gaussian filter
close all
clc
x=imread('child.jpg');
x=rgb2gray(x);
h= fspecial('gaussian',[3 3]);
figure,imshow(x);
y=conv2(x,h,'same');
figure,imshow(uint8(y));

h= fspecial('gaussian',[5 5]);
y=conv2(x,h,'same');
figure,imshow(uint8(y));

h= fspecial('gaussian',[7 7]);
y=conv2(x,h,'same');
figure,imshow(uint8(y));

% Denoising
close all
clc
x=imread('child.jpg');
x=rgb2gray(x);
h= fspecial('average',[3 3]);
figure,imshow(x);
x=imnoise(x,'gaussian',0,0.001);
figure,imshow(x);
y=conv2(x,h,'same');
figure,imshow(uint8(y));

%Low pass Filtering 
close all
clc
x=zeros(500,500);
x(:,1:250)=255;
figure,imshow(x);
h=1/9*ones(3,3);
y=conv2(x,h,'same');
figure,imshow(uint8(y))
y(200,245:255)
h1=1/16*[1 2 1;2 4 2;1 2 1];
y1=conv2(x,h1,'same');
figure,imshow(uint8(y1))
y1(200,245:255)

% with noise

close all
clc
x=zeros(500,500);

x(:,1:250)=255;

figure,imshow(x);
x=imnoise(x,'gaussian',0,0.001);
figure,imshow((x));
round(255*x(200,245:255))
h=1/9*ones(3,3);
y=conv2(x,h,'same');
figure,imshow((y))
%x1(200,245:255)
round(255*y(200,245:255))
h1=1/16*[1 2 1;2 4 2;1 2 1];
y1=conv2(x,h1,'same');
figure,imshow((y1))
round(255*y1(200,245:255))

% LPF example
clc
close all
x=[10 10 11 12 12 12 13 14 15;13 15 18 19 20 22 16 13 19;10 10 255 12 12 12 13 14 15;13 15 18 19 20 22 16 13 19;10 10 11 12 12 0 13 14 15;13 15 18 19 20 22 16 13 19;10 10 11 12 12 12 13 14 15;13 15 18 19 20 22 16 13 19]
y=medfilt2(x)

% Median filter
clc
close all

x=imread('child.jpg');
x=rgb2gray(x);
figure,imshow(x)
title('original Image')
figure,imhist(x);
title('Histogram of original Image')
y=imnoise(x,'salt & pepper', 0.05);
figure,imshow(y)
title('Image with salt and pepper noise')
figure,imhist(y)
title('Histogram of noisy Image')
y1=medfilt2(y);
h=1/9*ones(3,3);
y2=conv2(y,h,'same');
figure,imshow(y1);
title(' 3x3 median filter applied')
figure,imshow(uint8(y2));
title(' 3x3 average filter applied')
y2=medfilt2(y,[5 5]);
figure,imshow((y2));
title(' 5x5 median filter applied')
y=medfilt2(y);
figure,imshow(y);
y=medfilt2(y);
figure,imshow(y);

% Sharpening filters

close all
clc
x=imread('cat.jpg');
x=rgb2gray(x);

figure,imshow(x);
h=[0 -1 0;-1 4 -1;0 -1 0];
y=conv2(x,h,'same');
figure,imshow(uint8(y));

h=[-1 -1 -1;-1 8 -1;-1 -1 -1];
y=conv2(x,h,'same');
figure,imshow(uint8(y));

%edge crispening
close all
clc
x=imread('cat.jpg');
x=rgb2gray(x);

figure,imshow(x);
h=[0 -1 0;-1 5 -1;0 -1 0];
y=conv2(x,h,'same');
figure,imshow(uint8(y));

h=[-1 -1 -1;-1 9 -1;-1 -1 -1];
y=conv2(x,h,'same');
figure,imshow(uint8(y));

%Unsharp masking

close all
clc
A=1.8;
x=imread('cat.jpg');
x=rgb2gray(x);

figure,imshow(x);
h=[0 -1 0;-1 A+4 -1;0 -1 0];
y=conv2(x,h,'same');
figure,imshow(uint8(y));

h=[-1 -1 -1;-1 A+8 -1;-1 -1 -1];
y=conv2(x,h,'same');
figure,imshow(uint8(y));


% Labeling of connected components 768x1024     

clc
close all
clear all

x=imread('D:\Penguins.jpg');
%x=imread('child.jpg');
figure,imshow(x)

y=rgb2gray(x);
[m n]=size(y);
figure,imshow(y)
impixelinfo
y=im2bw(y);
figure,imshow(y)
impixelinfo
yz=bwlabel(y,8);
figure,imshow(yz)
impixelinfo
x1=zeros(m,n);
x2(:,:,1)=x1;
x2(:,:,2)=x1;
x2(:,:,3)=x1;
%figure,imshow(x2)
for i=1:m
    for j=1:n
   
        if yz(i,j)== 0
            x2(i,j,1)=255;
            x2(i,j,2)=0;
            x2(i,j,3)=0;
        elseif yz(i,j)== 1
            x2(i,j,1)=0;
            x2(i,j,2)=255;
            x2(i,j,3)=0;
        elseif yz(i,j)== 2
            x2(i,j,1)=0;
            x2(i,j,2)=0;
            x2(i,j,3)=255;
        end
    end
end

   figure,imshow(x2) 

        

