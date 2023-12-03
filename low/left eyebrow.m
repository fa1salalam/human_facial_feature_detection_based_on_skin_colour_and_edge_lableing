for i=1:mid1
    for j=1:width
        l_eyebrow(i,j,1)=face(i,j,1);
        l_eyebrow(i,j,2)=face(i,j,2);
        l_eyebrow(i,j,3)=face(i,j,3);
    end
end
leb_binary=BinaryFaceImage(l_eyebrow);
leb_size=size(leb_binary);
leb_height=leb_size(1);
leb_width=leb_size(2);
mid2=ceil(leb_width/2);
lab2=medfilt2(leb_binary);
label=bwlabel(lab2,8);
found=0;
for i=leb_height:-1:1
    for j=mid2:leb_width
        if(edge(i,j)==1&&leb_binary(i,j)==1)
            found=1;
            ebh=i;
            ebw=j;
            break;
        end
    end
    if(found==1)
        break;
    end
end
for m=ebh:-1:1
    for n=ebw:leb_width
        if(label(m,n)>0&&label(m,n)==label(ebh,ebw))
            final_m=m;
            final_n=n;
        end
    end
end
x_start=final_m-2;
x_end=ebh+1;
y_start=ebw-8;
y_end=final_n+10;

for i=x_start:x_end
    for j=y_start:y_end
        leb(i-x_start+1,j-y_start+1,1)=l_eyebrow(i,j,1);
           leb(i-x_start+1,j-y_start+1,2)=l_eyebrow(i,j,2); 
           leb(i-x_start+1,j-y_start+1,3)=l_eyebrow(i,j,3);
             
    end
end
l_eyebrow=leb;
subplot('position'[0.8 0.40 02 02])
imshow(l_eyebrow);
title('Left Eyebrow');
function[r_eye,l_eye]=eyesDetection(face,edge)
sizeofImage=size(face);
height=sizeofImage(1);
mid1=ceil(height/2);
width=sizeofImage(2);
mid2=ceil(width/2);







