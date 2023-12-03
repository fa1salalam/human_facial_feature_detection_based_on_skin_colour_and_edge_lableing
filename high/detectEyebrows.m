function eyebrows=detectEyebrows(face,edge)
sizeofImage=size(face);
height=sizeofImage(1);
width=sizeofImage(2);



for i=1:height
    for j=1:width
        eyebrows(i,j,1)=face(i,j,1);
        eyebrows(i,j,2)=face(i,j,2);
        eyebrows(i,j,3)=face(i,j,3);
    end
end

%eyebrows = imresize(eyebrows,[400 400]);
eb_binary=BinaryFaceImage(eyebrows);
%eb_binary = imresize(eb_binary,[400 400]);
eb_size=size(eb_binary);

eb_height=eb_size(1);
mid_mid_height=ceil((eb_height/2)/2);
mid_height=ceil(eb_height/2);
%disp(mid_mid_height);
eb_width=eb_size(2);
mid_width=ceil(eb_width/2);
%disp(mid_width);
%disp(eb_width);
lab2=medfilt2(eb_binary);
%figure,imshow(lab2), impixelinfo;

label=bwlabel(lab2,8);
%figure,imshow(label), impixelinfo;
%figure,imshow(edge), impixelinfo;

%figure,imshow(label),impixelinfo;

for i=1:200
     for j =1:eb_width
         if(label(i,j)>0)
            label(i,j)=0;
         end
    end
end
%figure,imshow(label),impixelinfo;
found = 0;
x =55;
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
%eyebrows = insertShape(eyebrows, 'circle', [left_ebw left_ebh 10], 'LineWidth', 5);
%figure,imshow(eyebrows);
eyebrows = insertShape(eyebrows, 'rectangle', [left_ebw left_ebh+220 200 50], 'LineWidth', 10);
%figure,imshow(eyebrows);

found = 0;
x =mid_width+100;
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
%eyebrows = insertShape(eyebrows, 'circle', [right_ebw right_ebh 10], 'LineWidth', 5);
%figure,imshow(eyebrows);
eyebrows = insertShape(eyebrows, 'rectangle', [right_ebw right_ebh-20 200 50], 'LineWidth', 10);
%figure,imshow(eyebrows);




% 
% %left Eyebrow detection% (My Sided)
% found=0;
% for i = mid_mid_height:-1:1
%     for j = mid_width:-1:1
%         if(edge(i,j)==255 || lab2(i,j) ==1)
%             found=1;
%             left_ebh=i;
%             left_ebw=j;
%             break;
%         end
%     end
%         if(found==1)
%          break;
%        end
% end
% 
% eyebrows = insertShape(eyebrows, 'circle', [left_ebw left_ebh 10], 'LineWidth', 5);
% figure,imshow(eyebrows);
% %disp(found);
% %disp(left_ebh);
% %disp(left_ebw);
% 
% % for m=left_ebh:-1:1
% %     for n=left_ebw-5:-1:1
% %         if(label(m,n)>0 && label(m,n)==label(left_ebh,left_ebw))
% %             final_m=m;
% %             final_n=n;
% %         end
% %     end
% % end
% 
% %eyebrows = insertShape(eyebrows, 'circle', [left_ebw left_ebh 10], 'LineWidth', 5);
% x=left_ebw-250;
% y=left_ebh-50;
% width=250; %final_m;
% height=50; %final_n;
% %eyebrows = insertShape(eyebrows, 'circle', [x_start x_end 10], 'LineWidth', 5);
% %eyebrows = insertShape(eyebrows, 'circle', [y_start y_end 10], 'LineWidth', 5);
% 
% %disp(x_start);
% %disp(x_end);
% %disp(y_start);
% %disp(y_end);
% 
% %rectangle('Position',[x_start x_end y_start y_end], 'LineWidth',2, 'EdgeColor','b');
% %line([x_start,x_end],[y_start,y_end],'Color','r');
% eyebrows = insertShape(eyebrows, 'Rectangle', [x y width height], 'LineWidth', 10);
% %disp(final_m);
% %disp(final_n);
% 
% %Right Eyebrow detection% (My Sided)
% found=0;
% for i = mid_mid_height:-1:1
%     for j = mid_width+50:eb_width
%         if(edge(i,j)==255 && lab2(i,j) ==1)
%             found=1;
%             right_ebh=i;
%             right_ebw=j;
%             break;
%         end
%     end
%         if(found==1)
%          break;
%        end
% end
% disp(found);
% disp(right_ebh);
% disp(right_ebw);
% % for m=right_ebh:-1:1
% %     for n=right_ebw+50 :eb_width
% %         if(label(m,n)>0&&label(m,n)==label(right_ebh,right_ebw))
% %             right_final_m=m;
% %             right_final_n=n;
% %         end
% %     end
% % end
% 
% x=right_ebw;
% y=right_ebh-50;
% width= 250;%right_ebw+200;
% height=50;%right_ebh-70;
% %eyebrows = insertShape(eyebrows, 'circle', [0 0 10], 'LineWidth', 5);
% 
% %eyebrows = insertShape(eyebrows, 'circle', [x_start x_end 10], 'LineWidth', 5);
% eyebrows = insertShape(eyebrows, 'Rectangle', [x y width height], 'LineWidth', 10);
% 
% 
% 
% 
% % j=left_ebw;
% % for i=left_ebh:-1:final_m
% %         eyebrows(i,j,1)=110;
% %         eyebrows(i,j,2)=0;
% %        eyebrows(i,j,3)=0;
% %        m=final_m;
% % end
% % x=left_ebw-280;
% % i=m;
% % for j=left_ebw:-1:x %final_n+12
% %         eyebrows(i,j,1)=110;
% %         eyebrows(i,j,2)=0;
% %         eyebrows(i,j,3)=0;
% %         n=x;
% % end
% % j=n;
% % for i=final_m: left_ebh 
% %         eyebrows(i,j,1)=110;
% %         eyebrows(i,j,2)=0;
% %         eyebrows(i,j,3)=0;
% %         m=left_ebh;
% % end
% % % disp(m);
% % i=m;
% %     for j=n:left_ebw
% %         eyebrows(i,j,1)=110;
% %         eyebrows(i,j,2)=0;
% %         eyebrows(i,j,3)=0;
% %     end
% 
% %right Eyebrow Detection% (My Sided)
% 
% % found=0;
% % for i = mid_mid_height:-1:1
% %     for j = mid_width:eb_width
% %         if(edge(i,j)==255 && lab2(i,j) ==1)
% %             found=1;
% %             right_ebh=i;
% %             right_ebw=j;
% %             break;
% %         end
% %     end
% %         if(found==1)
% %          break;
% %        end
% % end
% % disp(found);
% % disp(right_ebh);
% % disp(right_ebw);
% % for m=right_ebh:-1:1
% %     for n=right_ebw:eb_width
% %         if(label(m,n)>0&&label(m,n)==label(right_ebh,right_ebw))
% %             right_final_m=m;
% %             right_final_n=n;
% %         end
% %     end
% % end
% % for i=right_ebh:right_final_m
% %     for j=right_ebw:right_final_n
% %         eyebrows(i,j,1)=110;
% %         eyebrows(i,j,2)=0;
% %         eyebrows(i,j,3)=0;
% %     end
% % end
%         
% % p=ebw;
% %disp(right_final_m);
% %disp(right_final_n);
% % i=right_final_m;
% % for j=right_ebw:right_final_n
% %         eyebrows(i,j,1)=110;
% %         eyebrows(i,j,2)=0;
% %         eyebrows(i,j,3)=0;
% %         m=right_final_n;
% % end
% % x=right_ebw+280;
% % i=m;
% % for j=right_ebw:x
% %         eyebrows(i,j,1)=110;
% %         eyebrows(i,j,2)=0;
% %         eyebrows(i,j,3)=0;
% %         n=x;
% % end
% % %disp(n);
% % for i=final_m:ebh+1
% %     for j=n
% %         eyebrows(i,j,1)=60;
% %        eyebrows(i,j,2)=0;
% %        eyebrows(i,j,3)=0;
% %        m=ebh+1;
% %     end
% % end
% % %disp(m);
% % for i=m
% %     for j=n:ebw
% %         eyebrows(i,j,1)=60;
% %         eyebrows(i,j,2)=0;
% %         eyebrows(i,j,3)=0;
% %     end
% % end
% 
% 
%  %figure,imshow(eyebrows), impixelinfo;
% 
%  
%         
%             
%             
% 
% % for i=mid1:-1:1
% %     for j=mid2:eb_width
% %         if(edge(i,j)==255 && lab2(i,j) ==1)
% %             found=1;
% %             ebh=i;
% %             ebw=j;
% %             break;
% %         end
% %     end
% %     if(found==1)
% %         break;
% %     end
% % end
% % %disp(ebh);
% % %disp(ebw);
% % for m=ebh:-1:1
% %     for n=ebw-5:eb_width
% %         if(label(m,n)>0 && label(m,n)==label(ebh,ebw))
% %             final_m=m;
% %             final_n=n;
% %         end
% %     end
% % end
% % p=ebw;
% % %disp(p);
% % %disp(ebh);
% % %disp(final_m);
% % for i=ebh+1:-1:final_m-1
% %     for j=p
% %         eyebrows(i,j,1)=60;
% %         eyebrows(i,j,2)=0;
% %        eyebrows(i,j,3)=0;
% %        m=final_m;
% %     end
% % end
% % %disp(m);
% % for i=m
% %     for j=ebw:final_n+12
% %         eyebrows(i,j,1)=60;
% %         eyebrows(i,j,2)=0;
% %         eyebrows(i,j,3)=0;
% %         n=final_n+12;
% %     end
% % end
% % %disp(n);
% % for i=final_m-1: ebh+1
% %     for j=n
% %         eyebrows(i,j,1)=60;
% %         eyebrows(i,j,2)=0;
% %         eyebrows(i,j,3)=0;
% %         m=ebh+1;
% %     end
% % end
% % %disp(m);
% % for i=m
% %     for j=n:-1:ebw
% %         eyebrows(i,j,1)=60;
% %         eyebrows(i,j,2)=0;
% %         eyebrows(i,j,3)=0;
% %     end
% % end
% 
% 
% 
% %right Eyebrow Detection%
% 
% % found=0;
% % for i=mid1:-1:1
% %     for j=mid2:-1:1
% %         if(edge(i,j)==255&&lab2(i,j)==1)
% %             found=1;
% %             ebh=i;
% %             ebw=j;
% %             break;
% %         end
% %     end
% %     if(found==1)
% %         break;
% %     end
% % end
% % for m=ebh:-1:1
% %     for n=ebw:-1:1
% %         if(label(m,n)>0&&label(m,n)==label(ebh,ebw))
% %             final_m=m;
% %             final_n=n;
% %         end
% %     end
% % end
% % p=ebw;
% % %disp(final_m);
% % %disp(final_n);
% % for i=ebh+1:-1:final_m
% %     for j=p
% %         eyebrows(i,j,1)=60;
% %         eyebrows(i,j,2)=0;
% %         eyebrows(i,j,3)=0;
% %         m=final_m;
% %     end
% % end
% % %disp(m);
% % for i=m
% %     for j=ebw:-1:final_n+12
% %         eyebrows(i,j,1)=60;
% %         eyebrows(i,j,2)=0;
% %         eyebrows(i,j,3)=0;
% %         n=final_n-12;
% %     end
% % end
% % %disp(n);
% % for i=final_m:ebh+1
% %     for j=n
% %         eyebrows(i,j,1)=60;
% %        eyebrows(i,j,2)=0;
% %        eyebrows(i,j,3)=0;
% %        m=ebh+1;
% %     end
% % end
% % %disp(m);
% % for i=m
% %     for j=n:ebw
% %         eyebrows(i,j,1)=60;
% %         eyebrows(i,j,2)=0;
% %         eyebrows(i,j,3)=0;
% %     end
% % end
% figure,imshow(eyebrows);
% %         
%   