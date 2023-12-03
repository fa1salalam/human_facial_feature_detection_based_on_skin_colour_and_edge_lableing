function eyes=detectEyes(face)
sizeofImage=size(face);
height=sizeofImage(1);
width=sizeofImage(2);
for i=1:height
    for j=1:width
        eyes(i,j,1)=face(i,j,1);
        eyes(i,j,2)=face(i,j,2);
        eyes(i,j,3)=face(i,j,3);
    end
end
eb_binary=BinaryFaceImage(eyes);
eb_size=size(eb_binary);
eb_height=eb_size(1);
mid_mid_height=ceil((eb_height/2)/2);
mid_height=ceil(eb_height/2);


%disp(mid_mid_height);
eb_width=eb_size(2);
mid_width=ceil(eb_width/2);
disp(mid_width);
lab2=medfilt2(eb_binary);
label=bwlabel(lab2,8);

%figure,imshow(label),impixelinfo;

for i=1:200
     for j =1:eb_width
         if(label(i,j)>=0)
            label(i,j)=0;
         end
    end
end

found = 0;
x =80;
% eyebrows = insertShape(eyebrows, 'circle', [x 200 10], 'LineWidth', 5);
% figure,imshow(eyebrows);
for i=1:mid_height
    if(label(i,x)>0)
       found=1;
       left_ebh=i;
       left_ebw=x;
       break;
    end
    if(found==1)
       break;
    end
end

%eyes = insertShape(eyes, 'circle', [left_ebw left_ebh+100 10], 'LineWidth', 5);
%figure,imshow(eyes);
eyes = insertShape(eyes, 'rectangle', [left_ebw+10 left_ebh+120 120 50], 'LineWidth', 10);
%figure,imshow(eyes);

found = 0;
x =mid_width+140;
for i=1:mid_height
    if(label(i,x)>0)
       found=1;
       right_ebh=i;
       right_ebw=x;
       break;
    end
    if(found==1)
       break;
    end
end
%eyes = insertShape(eyes, 'circle', [right_ebw right_ebh+80 10], 'LineWidth', 5);
%figure,imshow(eyes);
eyes = insertShape(eyes, 'rectangle', [right_ebw-30 right_ebh+90 120 50], 'LineWidth', 10);
%figure,imshow(eyes);

%figure,imshow(label),impixelinfo;

% y =50;
% for x=1:mid_mid_height
%     if(label(i,j)>0)
        



%left Eye Detection(mysided)

%eyes = insertShape(eyes, 'circle', [mid_width mid_mid_height 10], 'LineWidth', 5);
%figure,imshow(eyes),impixelinfo;
% found=0;
% i = mid_mid_height;
% for j = mid_width:-1:1
%         if(edge(i,j)==255 || lab2(i,j) ==1)
%             found=1;
%             left_eh=i;
%             left_ew=j;
%             break;
%         end
%         if(found==1)
%          break;
%        end
% end
% disp(found);
% x= left_ew-200;
% y = left_eh+5;
% width = 100;
% height=50;
% eyes = insertShape(eyes, 'rectangle', [x y width height], 'LineWidth', 10);
% 
% 
% %right Eye Detection(mysided)
% 
% 
% found=0;
% i = mid_mid_height;
% for j = mid_width:eb_width
%         if(edge(i,j)==255 || lab2(i,j) ==1)
%             found=1;
%             right_eh=i;
%             right_ew=j;
%             break;
%         end
%         if(found==1)
%          break;
%        end
% end
% %disp(found);
% %disp(right_ew);
% %eyes = insertShape(eyes, 'circle', [right_ew right_eh 10], 'LineWidth', 5);
% x= right_ew+130;
% y = right_eh;
% width = 100;
% height=50;
% eyes = insertShape(eyes, 'rectangle', [x y width height], 'LineWidth', 10);
% 
% %figure,imshow(eyes),impixelinfo;
