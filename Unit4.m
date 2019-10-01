%Averaging Filter
clc;clear all;close all;
a = imread('cat image.jpg');
I=rgb2gray(a);  
[x,y] = size(I);
figure(1), imshow(I);
for i = 2:x-1
    for j = 2:y-1
        sum = 0;
        for ii = i-1:i+1  
            for jj = j-1:j+1
                sum = sum + I(ii,jj);
            end
        end
        I2(i,j) = ceil(sum/9);
    end
end
figure(2),imshow(I2);

%Max/Min Filter
clc;clear all;close all;
Im = imread('Lena image.png');
figure(1),imshow(Im);
Im = im2double(Im);
[r c] = size(Im);
    for i=2:r-1
        for j=2:c-1
            M = Im(i-1:i+1,j-1:j+1);
            Min = min(M(:));
            Max = max(M(:));
            ImL(i,j) = Min;
            ImU(i,j) = Max;
        end
    end
figure(2),imshow(ImL);
figure(3),imshow(ImU);

%Wiener Filter
clc;clear all;close all;
I = imread('Lena image.png');
Im=rgb2gray(I); 
In=imnoise(Im,'gaussian',0,0.025); %noise Addition
figure(1),imshow(In);
[m n] = size(In);
J = wiener2(In,[5 5]);
figure(2),imshow(J);


%Mid_Point Filter
clc;clear all;close all;
I = imread('Lena image.png');
In=rgb2gray(I); 
Im=imnoise(In,'gaussian',0,0.025); %noise Addition
figure(1),imshow(Im);
Im = im2double(Im);
[r c] = size(Im);
    for i=2:r-1
        for j=2:c-1
            M = Im(i-1:i+1,j-1:j+1);
            Min = min(M(:));
            Max = max(M(:));
            Mid=(Max+Min)/2;
            ImOUT(i,j) = Mid;
        end
    end
figure(2),imshow(ImOUT);

%Unsharp masking
clc;clear all;close all;
a = imread('cat image.jpg');
I=rgb2gray(a);  
[x,y] = size(I);
figure(1), imshow(I);
for i = 2:x-1
    for j = 2:y-1
        sum = 0;
        for ii = i-1:i+1  
            for jj = j-1:j+1
                sum = sum + I(ii,jj);
            end
        end
        I2(i,j) = ceil(sum/9);
    end
end
I2=imresize(I2,[size(I)]);
figure(2),imshow(I2);
O=I-I2;
figure(3),imshow(O);
%High Boost Filtering
clc;clear all;close all;
A=input('Enter the value of A greater than 1')
Im=imread('cat image.jpg');
f=rgb2gray(Im); 
figure(1),imshow(f);
[r c] = size(f);
for x=2:r-1
    for y=2:c-1
        g(x,y)=f(x,y+1)+f(x,y-1)+f(x-1,y)+f(x+1,y)-4*f(x,y);
        %g(x,y)=-f(x,y+1)-f(x,y-1)-f(x-1,y)-f(x+1,y)+4*f(x,y);
        %g(x,y)=f(x-1,y-1)+f(x-1,y)+f(x-1,y+1)+f(x,y-1)-8*f(x,y)+f(x,y+1)+f(x+1,y-1)+f(x+1,y)+f(x+1,y+1);
       
    end;
end;
for x=2:r-1
    for y=2:c-1
        d(x,y)=(A-1)*f(x,y)+g(x,y);
    end
end
 figure(2),imshow(g);  
figure(3),imshow(d);

%Comparision between Sobel,Perwitt,Roberts operator for edge detection
clc;clear all;close all;
Im=imread('cat image.jpg');
X=rgb2gray(Im); 
figure; imshow(X);
BW1 = edge(X,'Sobel');
BW2 = edge(X,'Prewitt');
BW3 = edge(X,'Roberts');
figure; imshow(BW1);
figure; imshow(BW2);
figure; imshow(BW3);
    
    