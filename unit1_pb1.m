%1,2 Read an image, display on figure window with a title
a=imread('hela.png');
imshow(a);
title('Hela');
impixelinfo;

%3 Replace a selected portion of the image and observe
b=rgb2gray(a);
for i=360:570
   for j= 460:860
      b(i,j) = 0;
   end
end
figure(2);
imshow(b);

%4 Use image differencing to observe the changes
c=rgb2gray(a);
d=imsubtract(c,b);
figure(3);
imshow(d);

%5 Display multiple images in the  same figure
figure(4);
subplot(2,2,1),imshow(a),title('RGB image');
subplot(2,2,2),imshow(b),title('Image with selected portion replaced');
subplot(2,2,3),imshow(c),title('Gray shade image');
subplot(2,2,4),imshow(d),title('Difference image');

%6 Demonstrate the effect of varying spatial and gray level resolution
%spatial resolution
      figure(5); imshow(imresize(c,0.1)), title('resized image');
      figure(6); imshow(c), title('original image');
%gray level
      figure(7); imshow(c),title('original');
      figure(8); imshow(c/8),title('resolution reduced');
      %or 
      thresh = multithresh(c,7);
      % Reduce the number of levels using the maximum value in each interval
      % to replace the values in I
      valuesMax = [thresh max(c(:))];
      [quant8_I, index] = imquantize(c, thresh, valuesMax);
      % Display the 8-level image
      figure, imshow(quant8_I,[])
      title('Image with 8-levels, using maximum value of the interval');
      % Use the minimum interval value instead of maximum interval value to
      % replace the values in I
      valuesMin = [min(c(:)) thresh];
      quant8_I_min = valuesMin(index);
      % Display the new image
      figure, imshow(quant8_I_min,[])
      title('Image with 8-levels, using minimum value of the interval');

%7 Resize an Image using different interpolation techniques and observe
figure(9); imshow(imresize(c,0.5)),title('nearest neighbourhood');
figure(10); imshow(imresize(c,0.5,'bilinear')),title('nearest neighbourhood');
figure(11); imshow(imresize(c,0.5,'bicubic')),title('bicubic interpolation');

%8 Rotate an image and show
figure(9); imshow(imrotate(c,45)),title('nearest neighbourhood');
figure(10); imshow(imrotate(c,-45,'bilinear')),title('nearest neighbourhood');
figure(11); imshow(imrotate(c,45,'bicubic')),title('bicubic interpolation');

%9 Find the distance (Euclidean, D4 and D8)between two points (360,460) and
%(570,860)
%Euclidian
    d1=sqrt(((360-570)^2)+((460-860)^2));
% D4 or city block
    d2=abs(360-570)+ abs(460-860);
% D8 distance
    d3=max(abs(360-570),abs(460-860));
    
    
%unit2: image transforms
%1.	Find the FFT of an image and display.
subplot(1,2,1),imshow(c),title('image');
subplot(1,2,2),imshow(fft2(c)),title('2D FFT');

%2.	Demonstrate phase dominance.
f1=fftn(c);
mag1=abs(f1);
s=log(1+fftshift(f1));
phase1=angle(f1);
%imshow(phase1);

r1=ifftshift(ifftn(mag1));
r2=ifftn(exp(1i*phase1));
figure,imshow(c);
figure,imshow(s,[]);
figure,imshow(uint8(r1));
figure,imshow(r2,[]);

%3.	Apply various filters in frequency domain and demonstrate
h=fspecial('gaussian');
Y=imfilter(b,h);
imshow(Y);


%4.	Apply Discrete Cosine Transform on images.
I = imread('cameraman.tif');
imshow(dct(I));


%5.	Apply KL Transform on images.

%6.	Demonstrate the use of Band pass and band reject filters.



%unit 3 Image enhancement and Color Image Processing
%1 apply the following transformations
%(i)	Negative 
    h1=255-c;
    imshow(h1);
% (ii) Log 
    f=imread('hela.png');
g=rgb2gray(f);
c=input('Enter the constant value, c = ');
[M,N]=size(g);
        for x = 1:M
            for y = 1:N
                m=double(g(x,y));
                z(x,y)=c.*log10(1+m); 
            end
        end
imshow(f), figure, imshow(z);

%(iii)Power law
RGB=imread('hela.png');
I=rgb2gray(RGB);
I=im2double(I);
[m,n] = size(I);
    c = 2;
    g=0.5
    for p = 1 : m
    for q = 1 : n
        I3(p, q) = c * I(p, q).^0.5;  
    end
    end
figure, imshow(I3);title('Power-law transformation');xlabel('Gamma=0.5')

%(iv) Contrast stretching 
I = imread('pout.tif');
figure;
imshow(I);
J = imadjust(I,stretchlim(I),[]);
figure;
imshow(J);

%(v) Bit-plane slicing
A=b;
B=bitget(A,1); figure, imshow(logical(B));title('Bit plane 1');
B=bitget(A,2); figure, imshow(logical(B));title('Bit plane 2');
B=bitget(A,3); figure, imshow(logical(B));title('Bit plane 3');
B=bitget(A,4); figure, imshow(logical(B));title('Bit plane 4');
B=bitget(A,5); figure, imshow(logical(B));title('Bit plane 5');
B=bitget(A,6); figure, imshow(logical(B));title('Bit plane 6');
B=bitget(A,7); figure, imshow(logical(B));title('Bit plane 7');
B=bitget(A,8); figure, imshow(logical(B));title('Bit plane 8');

%2	Plot histogram of an Image
I = imread('rice.png');
imshow(I);
figure;
imhist(I);

%3	Convert the image to binary choosing a suitable threshold from Histogram
[m,n]=size(I);
z=zeros(m,n);
for i=1:m
    for j=1:n
        if(I(i,j)>=125)
            z(i,j)=0;
        else
            z(i,j)=255;
        end
    end
end
figure;imshow(z);

%4	Perform histogram equalization and matching
I = imread('pout.tif');
figure
subplot(1,2,1),imshow(I);
subplot(1,2,2),imhist(I);
J = histeq(I);
figure;
subplot(1,2,1),imshow(J);
subplot(1,2,2),imhist(J,64);
%matching
J = imhistmatch(I,b);
subplot(3,2,1),imshow(I);
subplot(3,2,2),imhist(I);
subplot(3,2,3),imshow(b);
subplot(3,2,4),imhist(b);
subplot(3,2,5),imshow(J);
subplot(3,2,6),imhist(J);

%5	Generate a noisy image and display
J1 = imnoise(a,'gaussian');
J2 = imnoise(a,'salt & pepper');
J3 = imnoise(a,'speckle');
subplot(1,3,1),imshow(J1),title('gaussian noise');
subplot(1,3,2),imshow(J2);title('salt & pepper');
subplot(1,3,3),imshow(J3);title('speckle');

%6	Apply various Low pass filters on the image in spatial and frequency domain.


%7	Apply various High pass filters on the image in spatial and frequency domain.


%8	Demonstrate the use of median filter.
I = imread('eight.tif');
figure, imshow(I);
J = imnoise(I,'salt & pepper',0.02);
K = medfilt2(J);
imshowpair(J,K,'montage');

%9	Generate a set of noisy Images and use averaging to reduce noise
J1 = imnoise(I,'gaussian');
J2 = imnoise(I,'salt & pepper');
J3 = imnoise(I,'speckle');
K1average = filter2(fspecial('average',3),J1)/255;
K2average = filter2(fspecial('average',3),J2)/255;
K3average = filter2(fspecial('average',3),J3)/255;
figure
subplot(1,3,1),imshow(K1average),title('gaussian noise');
subplot(1,3,2),imshow(K2average);title('salt & pepper');
subplot(1,3,3),imshow(K3average);title('speckle');

%10	Apply various HPF on an image.


%11	Perform edge crispening.
imshow(K2average),title('Original Image');
b1 = imsharpen(K2average);
figure, imshow(b1),title('Sharpened Image');

%unit4 Image restoration
%1	Apply average filter and Weighted average filter on an image and compare the results. 
avg = filter2(fspecial('average',5),b)/255;
imshow(avg);
figure,imshow(b);
%average filter
Noi_img = imnoise(b,'salt & pepper', 0.02);
f=1/9*[1,1,1;1,1,1;1,1,1];
de_noi=filter2(f,Noi_img);
figure;
subplot(1,3,1);imshow(b);title('Original image')
subplot(1,3,2);imshow(Noi_img);title('Noisy image')
subplot(1,3,3);imshow(uint8(de_noi));title('Denoised image')
%weighted average
Noi_img = imnoise(b,'salt & pepper', 0.02);
f=1/20*[1,2,1;2,4,2;1,2,1];
de_noi=filter2(f,Noi_img);
figure;
subplot(1,3,1);imshow(b);title('Original image')
subplot(1,3,2);imshow(Noi_img);title('Noisy image')
subplot(1,3,3);imshow(uint8(de_noi));title('Denoised image')

%2	Perform Min and Max filtering.
se = strel('line',11,90);
BW2 = imdilate(b,se);   %min filter
imshow(b), title('Original');
figure, imshow(BW2), title('Dilated');

se = strel('line',11,90);
erodedBW = imerode(b,se);   %max filter
imshow(b), title('Original');
figure, imshow(erodedBW), title('eroded');

%3	Compare the results of Adaptive median filter with median filter.


%4	Perform adaptive local noise filtering.
J5 = imnoise(b,'gaussian',0,0.025);
imshow(J5(200:400,1:600));
title('Portion of the Image with Added Gaussian Noise');
K = wiener2(J5,[5 5]);
figure
imshow(K(200:400,1:600));
title('Portion of the Image with Noise Removed by Wiener Filter');

%5	Apply Mid point filter and alpha trimmed filter on images and demonstrate.



%6	Apply Contraharmonic mean filter, Geometric mean filter on images.


%7	Perform Unsharp masking.
B = imsharpen(avg);
figure, subplot(1,2,1),imshow(avg),title('original');
subplot(1,2,2),imshow(B),title('sharpened');

%8	Perform High boost frequency filtering.

%9	Perform filtering using Sobel, Prewitt, Roberts operator and compare the results.
