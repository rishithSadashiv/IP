% Fourier series

close all 
clc

t=0:.01:2*pi;
%t=t*10^(-3);
i=1:2:101;
x=0;
for k=1:10
    
    x=x+(4/(pi*i(k)))*sin(i(k)*t);
%x=(4/pi)*(sin(t)+(1/3)*sin(3*t)+(1/5)*sin(5*t)+(1/7)*sin(7*t))+(1/9)*sin(9*t);
%figure,plot((4/(pi*i(k)))*sin(i(k)*t))
end

figure,plot(x)


% Centering of FT
close all
clc
x=zeros(512,512);
%x(200:300,200:300)=255;
%x(250:260,250:260)=255;
x(250:260,220:270)=255;


figure,imshow(x)
y=fft2(x);
y=fftshift(y);
z=mat2gray(abs(y));
figure,imshow(1*log(1+z))
figure,mesh(z)

% Fourier transform of sines
clc
close all
clear all

x=imread('stp2.gif');
%x=imread('stp1.gif');
%x=imread('son3.gif');


for i=1:256
for    j=1:256
    if x(i,j)==2
        x(i,j)=255;
    end
end
end
figure,imshow(x)
y=fft2(x);
y=fftshift(y);

y1=abs(y);
figure,mesh(y1)
%y1=10*log(1+y1);
figure,imshow(mat2gray(y1))

% Fourier transform of Text
clc
close all
clear all

%x=imread('stp2.gif');
%x=imread('stp1.gif');
x=imread('son3.gif');


for i=1:512
for    j=1:512
    if x(i,j)==1
        x(i,j)=255;
    end
end
end
figure,imshow(x)
y=fft2(x);
y=fftshift(y);

y1=abs(y);
%figure,mesh(y1)
y1=10*log(1+y1);
figure,imshow(mat2gray(y1))
x=imread('son4.gif');

for i=1:512
for    j=1:512
    if x(i,j)==1
        x(i,j)=255;
    end
end
end
figure,imshow(x)
y=fft2(x);
y=fftshift(y);

y1=abs(y);
%figure,mesh(y1)
y1=10*log(1+y1);
figure,imshow(mat2gray(y1))

% Phase dominance
clc
close all
clear all

x=imread('cameraman.jpg');
figure,imshow(x)
x1=fft2(x);

%y=imread('tracy.tif');
y=imread('lena.png');
%y=imread('boat.png');
figure,imshow(y)
y1=fft2(y);

z=abs(x1).*exp(j.*angle(y1));
z1=ifft2(z);
figure,imshow(uint8(z1));
title('Magnitude of cameraman with phase of Lena');
z=abs(y1).*exp(j.*angle(x1));
z1=ifft2(z);
figure,imshow(uint8(z1));
title('Magnitude of Lena with phase of cameraman');


% Low pass filter

% clc
% close all
% clear all
% 
% x=imread('Alphabet.png');
% x=rgb2gray(x);
% figure,imshow(x)
% x1=fft2(x);
% x1=fftshift(x1);
% figure,imshow(uint8(x1))
% x2=zeros(318,319);
% %x2(155:164,155:164)=x1(155:164,155:164);
% x2(125:194,125:194)=x1(125:194,125:194);
% %x2=fftshift(x2);
% figure,imshow(uint8(x2))
% x3=ifft2(x2);
% %x3=fftshift(abs(x3))
% figure,imshow(uint8(x3));
% 
% Notch filter
clc
close all
clear all

x=imread('cameraman.jpg');
figure,imshow(x)
x1=fft2(x);
x1(1,1)=0;
x2=ifft2(x1);
figure,imshow(uint8(x2))
title('DC value=0')
x1(1,1)=1.5559e+007;
x2=ifft2(x1);
figure,imshow(uint8(x2))
title('DC value=50%')

% FT of delta function
clc
close all
clear all
x=zeros(512,512);
x(256,256)=255;
figure,imshow(x)
y=fft2(x);
figure,imshow(uint8(abs(y)))

% Properties of FT : Separability
clc
close all

x=imread('cameraman.jpg');
figure,imshow(x)
x1=fft2(x);
x1=fftshift(x1);
x2=10*log(1+abs(x1));
figure,imshow(uint8(x2))
title('Direct FFT computation')


for i=1:512
    
xr(:,i)=fft(x(:,i));
end
for i=1:512
    xr(i,:)=fft(xr(i,:));
end
xr=fftshift(xr);
x2=10*log(1+abs(xr));
figure,imshow(uint8(x2))
title('Using Separability')

% Properties of FT : IDFT using DFT
clc
close all

x=imread('cameraman.jpg');
figure,imshow(x)
x1=fft2(x);

x2=fft2(conj(x1));
x3=conj(x2)/(512*512);
figure,imshow(uint8(x3))




% Color Image Processing
clc
close all

x(1:512,1:512,1)=0;
x(1:512,1:512,2)=0;
x(1:512,1:512,3)=0;
x(1:170,257:512,1)=255;
x(1:170,257:512,2)=255;
x(1:170,257:512,3)=255;

x(171:340,1:170,1)=255;
x(171:340,1:170,2)=0;
x(171:340,1:170,3)=0;

x(171:340,171:340,1)=0;
x(171:340,171:340,2)=255;
x(171:340,171:340,3)=0;

x(171:340,341:512,1)=0;
x(171:340,341:512,2)=0;
x(171:340,341:512,3)=255;

x(341:512,1:170,1)=255;
x(341:512,1:170,2)=255;
x(341:512,1:170,3)=0;

x(341:512,171:340,1)=0;
x(341:512,171:340,2)=255;
x(341:512,171:340,3)=255;

x(341:512,341:512,1)=255;
x(341:512,341:512,2)=0;
x(341:512,341:512,3)=255;

figure,imshow(x)
title('B,W,R,G,B,Y,C,M')

x1=255-x;
figure,imshow(x1)
clc
close all

y=imread('child.jpg');
%y=imread('color.png');
figure,imshow(y)
impixelinfo
y1=y;
y1(:,:,3)=0;
figure,imshow(y1)
title('B=0')

y1=y;
y1(:,:,2)=0;
figure,imshow(y1)
title('G=0')

y1=y;
y1(:,:,1)=0;
figure,imshow(y1)
title('R=0')


y=imread('child.jpg');
%y=imread('boat.png');
figure,imshow(y)
x=y(:,:,1)/3+y(:,:,2)/3+y(:,:,3)/3;
%x1=x./3;
figure,imshow(uint8(x))
