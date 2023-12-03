found=0;
for i=mid1:-1:1
    for j=mid2:-1:1
        if(edge(i,j)==1&&lab2(i,j)==1)
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
    for n=ebw:-1:1
        if(label(m,n)>0&&label(m,n)==label(ebh,ebw))
            final_m=m;
            final_n=n;
        end
    end
end
p=ebw;
for i=ebh+1:-1:final_m
    for j=p
        eyebrows(i,j,1)=20;
        eyebrows(i,j,2)=0;
        eyebrows(i,j,3)=0;
        m=final_m;
    end
end
for i=m
    for j=ebw:-1:final_n-12
        eyebrows(i,j,1)=20;
        eyebrows(i,j,2)=0;
        eyebrows(i,j,3)=0;
        n=final_n-12;
    end
end
for i=final_m:ebh+1
    for j=n
        eyebrows(i,j,1)=20;
       eyebrows(i,j,2)=0;
       eyebrows(i,j,3)=0;
       m=ebh+1;
    end
end
for i=m
    for j=n:ebw
        eyebrows(i,j,1)=20;
        eyebrows(i,j,2)=0;
        eyebrows(i,j,3)=0;
    end
end

       
       
       
       
       
       
       
       
        
        
        