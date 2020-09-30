% Unitary MAtrix
clc
close all

A=dftmtx(4);
A=A/2;
A
B=conj(A)
C=B.'

A*C





% DFT

close all
clc
x=imread('child.jpg');
imshow(x)
x=rgb2gray(x);
figure,imshow(x)
y=fft2(x);
%figure,imshow(abs(y))
%y=fftshift(y);
z=zeros(347,490);
%z(150:170,220:250)=y(150:170,220:250);

%z1=fftshift(z1);
%z(1:50,1:50)=y(1:50,1:50);
%z(1:100,1:100)=y(1:100,1:100);
z(1:300,1:300)=y(1:300,1:300);
%z=y;
z1=ifft2(z);
figure,imshow(uint8(z1))


% DCT
close all
clc
x=imread('child.jpg');
imshow(x)
x=rgb2gray(x);
figure,imshow(x)
y=dct2(x);
figure,imshow(uint8(y))
%y2=10*log(1+abs(y));
figure,mesh(y)

z=zeros(347,490);
z(1:20,1:20)=y(1:20,1:20);
figure,imshow(uint8(z))
y1=idct2(z);
figure,imshow(uint8(y1));

z(1:50,1:50)=y(1:50,1:50);
figure,imshow(uint8(z))
y1=idct2(z);
figure,imshow(uint8(y1));

z(1:100,1:100)=y(1:100,1:100);
figure,imshow(uint8(z))
y1=idct2(z);
figure,imshow(uint8(y1));

z(1:150,1:250)=y(1:150,1:250);
figure,imshow(uint8(z))
y1=idct2(z);
figure,imshow(uint8(y1));


for i=1:347
    for j=1:490
        if y(i,j)< -1*10^-4
            y(i,j)=0;
        end
    end
end
y1=idct2(y);
figure,imshow(uint8(y1));
