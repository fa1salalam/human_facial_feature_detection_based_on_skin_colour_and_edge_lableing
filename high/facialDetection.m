
% sizeofImage=size(binaryImage);
% disp(sizeofImage);
% height=sizeofImage(1);
% disp(height);
% width=sizeofImage(2);
% middle=width/2;
% middle=ceil(middle);
% disp(middle);
% for i=1:height
%     if(binaryImage(i,middle) == 1)
%          head_start=i;
%          break;
%     end
% end
% disp(head_start);
% for i=head_start:height
%     if(binaryImage(i,middle)~=1)
%         forehead_start=i;
%         min_x=forehead_start;
%         break; %; given
%     end
% end
% disp(min_x);
% for i=1:height
%     if(binaryImage(i,middle)~=1)
%         max_x=i;
%     end
% end
% disp(max_x);
% scan=min_x + ((height-min_x)/2)/2;
% scan=ceil(scan);
% disp(scan);
% for i=middle:width
%     if(binaryImage(scan,i)==1)
%         max_y=i;
%         break;
%     end
% end
% disp(max_y);
% for i=middle: -1:1
%     if(binaryImage(scan,i)==1)
%         min_y=i;
%         break;
%     end
% end
% disp(min_y);
% if(max_x>height)
%     max_x=height;
% end
% disp(max_x);
% for i=min_x:max_x
%     for j=min_y:max_y
%         face(i-min_x+1, j-min_y+1,1)=originalImage(i,j,1);
%         face(i-min_x+1, j-min_y+1,2)=originalImage(i,j,2);
%         face(i-min_x+1, j-min_y+1,3)=originalImage(i,j,3);
%     end
% end
%         

%[Filename Pathname]=uigetfile('.jpg');
%im = imread([Pathname Filename]);
%im=imresize(im, [ 60 60])
%[height, width] = size(im);
%figure, imshow(im),impixelinfo;
%binaryImage = imcomplement(im2bw(im));

%% NEW 3-9-2016 1:24 AM
 function face=facialDetection(binaryImage,im) %originalImage
sizeofImage=size(binaryImage);
%disp(sizeofImage);
height=sizeofImage(1);
%disp(height);
width=sizeofImage(2);
%disp(width);
width_middle=width/2;
width_middle=ceil(width_middle);
%figure,imshow(binaryImage),impixelinfo;
height_middle=height/2;
height_middle=ceil(height_middle);
%Img = insertShape(im, 'circle', [width_middle height_middle+550 10], 'LineWidth', 5);
%figure,imshow(Img),impixelinfo;
%disp(height_middle);
%disp(width_middle);

for i=height_middle+550:height
     for j =1:width
         if(binaryImage(i,j)==1)
            binaryImage(i,j)=0;
         end
    end
end

%figure, imshow(binaryImage),impixelinfo;

for i=1:height
    if(binaryImage(i,width_middle) == 1)
         head_start=i;
         break;
    end
end
%disp(head_start);
for i=head_start:height
    if(binaryImage(i,width_middle) == 0)
         forehead_start=i;
         break;
    end
end
%disp(forehead_start);
min_x = forehead_start;
for i=height:-1:1
    if(binaryImage(i,width_middle) == 1)
         head_end=i;
         break;
    end
end
%disp(head_end);
max_x = head_end;
for i=1:width
    if(binaryImage(height_middle,i) == 1)
         left_ear=i;
         break;
    end
end
%disp(left_ear);
min_y = left_ear;
for i=width:-1:1
    if(binaryImage(height_middle,i) == 1)
         right_ear=i;
         break;
    end
end
max_y = right_ear;
%disp(max_y);
%face= zeros();
disp(min_x);
disp(max_x);
disp(min_y);
disp(max_y);
%if(min_x==60)
    min_x=min_x+550;
    max_x=max_x-150;
    min_y=min_y+550;
    max_y=max_y-550;
%end
disp(min_x);
disp(max_x);
disp(min_y);
disp(max_y);
for i=min_x:max_x
    for j=min_y:max_y
        face(i-min_x+1, j-min_y+1,1)=im(i,j,1);
        face(i-min_x+1, j-min_y+1,2)=im(i,j,2);
        face(i-min_x+1, j-min_y+1,3)=im(i,j,3);
    end
end

%figure,imshow(face), impixelinfo;
%sizeofImage=size(binaryImage);
%[face_height, face_width] = size(face);
%fileID = fopen('face_coordinate.txt','w');
%nbytes = fprintf(fileID,'%5d %5d\n',face_height,face_width);
%fclose(fileID);




