function bimage=BinaryFaceImage(image)

%grayImage=rgb2gray(image);
%figure,imshow(grayImage);
%bimage=im2bw(grayImage);
bimage=imcomplement(im2bw(image));
%
%k=medfilt2(bimage);
%figure,imshow(bimage);