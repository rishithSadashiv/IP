%MATLAB demo 1
x=imread('boat.png');
figure,imshow(x)
IMPIXELINFO

%MATLAB demo 2
x=imread('Picture6.jpg');
x=rgb2gray(x);
figure,imshow(x)
IMPIXELINFO

%MATLAB demo 3
x=imread('Picture2_8.jpg');
x=rgb2gray(x);
figure,imshow(uint8(x))
IMPIXELINFO

%MATLAB demo 3a
x=imread('Picture17.jpg');
x=rgb2gray(x);
figure,imshow(x)
IMPIXELINFO


%MATLAB demo 4
x=imread('child.jpg');
figure,imshow(uint8(x))
whos

x=rgb2gray(x);
figure,imshow(uint8(x))
whos

%MATLAB demo 5
close all
x=imread('child.jpg');
figure,imshow(x)
y=imresize(x,.5);
figure,imshow(y)
z=imresize(x,.25);
figure,imshow(z)

close all
figure,imshow(x)
y1=imresize(y,2,'bilinear');
figure,imshow(y1);
y2=imresize(z,4,'bilinear');
figure,imshow(y2);

%MATLAB demo 6
close all
x=imread('child.jpg');
x=rgb2gray(x);
figure,imshow((x));
y1=x./8;
figure,imshow(mat2gray(y1));
 y2=x./16;
figure,imshow(mat2gray(y2));
 y3=x./32;
figure,imshow(mat2gray(y3));
 y4=x./64;
figure,imshow(mat2gray(y4));

