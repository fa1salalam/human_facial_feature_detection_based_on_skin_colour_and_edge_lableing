for i=1:mid1
    for j=mid2:width
        l_eye(i,j,1)=face(i,j,1);
        l_eye(i,j,2)=face(i,j,2);
        l_eye(i,j,3)=face(i,j,3);
    end
end
leye_binary=BinaryFaceImage(l_eye);
leye_size=size(leye_binary);
leye_height=leye_size(1);
mid_hei=ceil(leye_height/2);
leye_width=leye_size(2);
lab2=medfilt2(leye_binary);
label=bwlabel(lab2,8);

found=0;
for i=mid_hei+2:leye_height
    for j=mid2:leye_width
        if(edge(i,j)==1&&leye_binary(i,j)==1)
            found=1;
            eyeh=i;
            eyew=j;
            
        end
    end
    if(found==1)
        break;
    end
end
for m=eyeh:leye_height
    for n=eyew:leye_width
        if(label(m,n)>0&&label(m,n)==label(eyeh,eyew))
            final_m=m;
            final_n=n;
        end
    end
end
x_start=eyeh-2;
x_end=final_m+2;
y_start=eyew-30;
y_end=final_n+5;

for i=x_start:x_end
    for j=y_start:y_end
        leye(i-x_start+1,j-y_start+1,1)=l_eye(i,j,1);
          leye(i-x_start+1,j-y_start+1,2)=l_eye(i,j,2);
           leye(i-x_start+1,j-y_start+1,3)=l_eye(i,j,3);
            
    end
end
l_eye=leye;
subplot('position',[0.8 .70 .2 .2]);
imshow(l_eye);
title('Left Eye');

            
            
            
            
            
            
            
        