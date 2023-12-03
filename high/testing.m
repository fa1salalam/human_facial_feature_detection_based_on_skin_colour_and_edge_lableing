[Filename Pathname]=uigetfile('.jpg');
im = imread([Pathname Filename]);
%im=imresize(im, [ 60 60])
%[height, width] = size(im);
figure, imshow(im),impixelinfo;
binaryImage = imcomplement(im2bw(im));
sizeofImage=size(binaryImage);
disp(sizeofImage);
height=sizeofImage(1);
disp(height);
width=sizeofImage(2);
disp(width);
width_middle=width/2;
width_middle=ceil(width_middle);

height_middle=height/2;
height_middle=ceil(height_middle);
disp(height_middle);
disp(width_middle);
figure, imshow(binaryImage),impixelinfo;
for i=1:height
    if(binaryImage(i,width_middle) == 1)
         head_start=i;
         break;
    end
end
disp(head_start);
for i=head_start:height
    if(binaryImage(i,width_middle) == 0)
         forehead_start=i;
         break;
    end
end
disp(forehead_start);
min_x = forehead_start;
for i=height:-1:1
    if(binaryImage(i,width_middle) == 1)
         head_end=i;
         break;
    end
end
disp(head_end);
max_x = head_end;
for i=1:width
    if(binaryImage(height_middle,i) == 1)
         left_ear=i;
         break;
    end
end
disp(left_ear);
min_y = left_ear;
for i=width:-1:1
    if(binaryImage(height_middle,i) == 1)
         right_ear=i;
         break;
    end
end
max_y = right_ear;
disp(max_y);
%face= zeros();
for i=min_x:max_x
    for j=min_y:max_y
        face(i-min_x+1, j-min_y+1,1)=im(i,j,1);
        face(i-min_x+1, j-min_y+1,2)=im(i,j,2);
        face(i-min_x+1, j-min_y+1,3)=im(i,j,3);
    end
end
figure,imshow(face), impixelinfo;
%face =imresize(face, [ 160 160])
%face = uint8(face);
RGB = face;
YCBCR = rgb2ycbcr(RGB);
%YCBCR = im2double(YCBCR);
figure,imshow(YCBCR), impixelinfo;


