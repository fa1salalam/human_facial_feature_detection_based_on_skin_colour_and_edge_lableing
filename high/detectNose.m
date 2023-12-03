function nose=detectNose(face,edge)
sizeofImage=size(face);
height=sizeofImage(1);
width=sizeofImage(2);
for i=1:height
    for j=1:width
        nose(i,j,1)=face(i,j,1);
        nose(i,j,2)=face(i,j,2);
        nose(i,j,3)=face(i,j,3);
    end
end
nose_binary=BinaryFaceImage(nose);
nose_size=size(nose_binary);
nose_height=nose_size(1);
mid_height=ceil(nose_height/2);
mid_mid_height=ceil((nose_height/2)/2);
nose_width=nose_size(2);
mid_width=ceil(nose_width/2);
lab=medfilt2(nose_binary);
label=bwlabel(lab,8);
%disp(mid_height);
disp(mid_width);
%nose = insertShape(nose, 'circle', [272 608 10], 'LineWidth', 5);
%figure,imshow(nose), impixelinfo;
%figure,imshow(label),impixelinfo;

for i=1:500
     for j =1:nose_width
         if(label(i,j)>0)
            label(i,j)=0;
         end
    end
end
%figure,imshow(label),impixelinfo;
%figure,imshow(nose),impixelinfo;
for i=1:nose_height
     for j =1:200
         if(label(i,j)>0)
            label(i,j)=0;
         end
    end
end
%figure,imshow(label),impixelinfo;
%figure,imshow(nose),impixelinfo;
found=0;
% for i = mid_mid_height: mid_height
%     for j =1:mid_width
%         if(label(i,j)>0)
%             found = 1;
%             noseh = i;
%             nosew = j; 
%         end
%         if(found==1)
%             break;
%         end
%     end
% end
%nose = insertShape(nose, 'circle', [mid_width mid_height 10], 'LineWidth', 10);
%figure,imshow(nose),impixelinfo;
j=mid_width;
for i = mid_mid_height:height
    if(label(i,j)>0)
            found = 1;
            noseh = i;
            nosew = j; 
        end
        if(found==1)
            break;
        end
end
disp(noseh);
disp(nosew);
if(noseh==657)
    noseh=noseh-160;
    nosew=nosew-20;
end
            
nose = insertShape(nose, 'rectangle', [nosew-130 noseh+230 250 80], 'LineWidth', 10);
%nose = insertShape(nose, 'circle', [nosew noseh 10], 'LineWidth', 10);
%figure,imshow(nose),impixelinfo;


% %Rectangle containing the region
% Sdata=regionprops(label,'BoundingBox');
%  
% %Crop all the Coins 
% for i=1:total
%     Img=imcrop(nose,Sdata(i).BoundingBox);
%     Name=strcat('Object Number:',num2str(i));
%     figure,imshow(Img); title(Name);
% end





























%figure,imshow(nose);
% found=0;
% i = mid_height-20;
%     for j=mid_width:nose_width
%         if(edge(i,j)==255 || nose_binary(i,j)==1 && label(i,j)>0)
%             found=1;
%             noseh=i;
%             nosew=j;
%             break;
%         end
%     if(found==1)
%         break;
%     end
%     end
%  x = nosew-100;
%  y = noseh-70;
%  width = 180;
%  height = 50;
%  
% nose = insertShape(nose, 'rectangle', [x y width height], 'LineWidth', 10);
% % 
% % disp(noseh);
% % disp(nosew);
% % 
% % for i=noseh+5
% %     for j=nosew+55:-1:nosew-15
% %         nose(i,j,1)=110;
% %         nose(i,j,2)=0;
% %         nose(i,j,3)=0;
% %         m=j;
% %     end
% % end
% % disp(m);
% % for i=noseh+5:-1:noseh-25
% %     for j=m
% %          nose(i,j,1)=110;
% %         nose(i,j,2)=0;
% %         nose(i,j,3)=0;
% %         n=i;
% %     end
% % end
% % disp(n);
% % for i=n
% %     for j=nosew-15:nosew+55
% %         nose(i,j,1)=110;
% %         nose(i,j,2)=0;
% %         nose(i,j,3)=0;
% %         m=j;
% %     end
% % end
% % disp(m);
% % for i=noseh-25:noseh+5
% %     for j=m
% %          nose(i,j,1)=110;
% %         nose(i,j,2)=0;
% %         nose(i,j,3)=0;  
% %     end
% % end     