for i=1:height
    for j=1:width
        eyebrows(i,j,1)=face(i,j,1);
           eyebrows(i,j,2)=face(i,j,2);
              eyebrows(i,j,3)=face(i,j,3);
    end
end
eb_binary=BinaryFaceImage(eyebrows);
eb_size=size(eb_binary);
eb_height=eb_size(1);
mid1=ceil((eb-haight/2)/2);
eb_width=eb_size(2);
mid2=ceil(eb_width/2);
lab2=medfilt2(eb_binary);
label=bwlabel(lab2,8);
found=0;
for i=mid1:-1:1
    for j=mid2:eb_width
        if(edge(i,j))==1&&lab2(i,j)==1)
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
    for n=ebw-5:eb_width
        if(label(m,n))>0&&label(m,n)==label(ebh,ebw))
            final_m=m;
            final_n=n;
        end
    end
end
p=ebw;
for i=ebh:-final_m-1
    for j=p
        eyebrows(i,j,1)=50;
        eyebrows(i,j,2)=0;
       eyebrows(i,j,3)=0;
       m=final_m-1;
    end
end
for i=m
    for j=ebw:final_n+12
        eyebrows(i,j,1)=50;
        eyebrows(i,j,2)=0;
        eyebrows(i,j,3)=0;
        n=final_n+12;
    end
end
for i=final_m-1:ebh+1
    for j=n
        eyebrows(i,j,1)=50;
        eyebrows(i,j,2)=0;
        eyebrows(i,j,3)=0;
        m=ebh+1;
    end
end
for i=m
    for j=n:-1:ebw
        eyebrows(i,j,1)=50;
        eyebrows(i,j,2)=0;
        eyebrows(i,j,3)=0;
    end
end
        
            