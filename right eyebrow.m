for i=1:mid1
    for j=1:mid2
        r_eyebrow(i,j,1)=face(i,j,1);
        r_eyebrow(i,j,2)=face(i,j,2);
        r_eyebrow(i,j,3)=face(i,j,3);
    end
end
reb_binary=BinaryFaceImage(r_eyebrow);
reb_size=size(reb_binary);
reb_height=reb_size(1);
reb_width=reb_size(2);
lab2=medfilt2(reb_binary);
label=bwlabel(lab2,8);
found=0;
for i=reb_height:-1:1
    for j=reb_width:-1:1
        if(edge(i,j)==1&&reb_binary(i,j)==1)
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
disp(ebh);
disp(ebw);        
for m=ebh:-1:1
    for n=ebw:-1:1
        if(label(m,n)>0&&label(m,n)==label(ebh,ebw))
            final_m=m;
            final_n=n;
        end
    end
end
x_start=final_m-2;
x_end=ebh;
y_start=final_n-10;
y_end=ebw+5;


for i=x_start:x_end
    for j=y_start:y_end
        reb(i-x_start+1,j-y_start+1,1)=r_eyebrow(i,j,1);
         reb(i-x_start+1,j-y_start+1,2)=r_eyebrow(i,j,2);
          reb(i-x_start+1,j-y_start+1,3)=r_eyebrow(i,j,3);   
            
    end
end
r_eyebrow=reb;
subplot('position',[0.8 .70 .2 .2]);
imshow(r_eyebrow);
title('Right Eyebrow');

            
            
            