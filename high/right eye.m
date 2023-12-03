for i=1:mid1
    for j=1:mid2
        r_eye(i,j,1)=face(i,j,1);
        r_eye(i,j,2)=face(i,j,2);
        r_eye(i,j,3)=face(i,j,3);
    end
end
reye_binary=BinaryFaceImage(r_eye);
reye_size=size(reye_binary);
reye_height=reye_size(1);
mid_hei=ceil(reye_height/2);
reye_width=reye_size(2);
lab2=medfilt2(reye_binary);
label=bwlabel(lab2,8);
found=0;
for i=mid_hei+2:reye_height
    for j=reye_width:-1:1
        if(edge(i,j)==1&&reye_binary(i,j)==1)
            found=1;
            eyeh=i;
            eyew=j;
            break;
        end
    end
    if(found==1)
        break;
    end
end
for m=eyeh:reye_height
    for n=eyew:-1:1
        if(label(m,n)>0&&label(m,n)==label(eyeh,eyew)
            final_m=m;
            final_n=n;
        end
    end
end
x_start=eyeh-2;
x_end=final_m+2;
y_start=final_n-5;
y_end=eyew+25;

for i=x_start:x_end
    for j=y_start:y_end
        reye(i-x_start+1,j-y_start+1,1)=r_eye(i,j,1);
          reye(i-x_start+1,j-y_start+1,2)=r_eye(i,j,2);
            reye(i-x_start+1,j-y_start+1,3)=r_eye(i,j,3);
            
    end
end
r_eye=reye;
subplot('position',[0.8 .70 .2 .2]);
imshow(r_eye);
title('Right Eye');

            
            
            
            
            
            
            
        