[Filename Pathname]=uigetfile('.jpg');
img=imread([Pathname Filename]);
imshow(img);
title('The original Image');
%imgg=rgb2gray(img);
%figure,imshow(imgg);
%b=medfilt2(img);
imggg=im2bw(imgg);
figure,imshow(imggg);