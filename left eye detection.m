found=0;
for i=mid1+2:eye_height
    for j=mid2:eye_width
        if(edge(i,j)==1&&eye_binary(i,j)==1)
            found=1;
            eyeh=i;
            eyew=j;
        end
    end
    if(found==1)
        break;
    end
end
for m=eyeh:eye_height
    for n=eyew:eye_width
        if(label(m,n)>0&&label(m,n)==label(eyeh,eyew))
            final_m=m;
            final_n=n;
        end
    end
end
p=final_n+5;
for i=final_m+2:-1:eyeh-1
    for j=p
        eye(i,j,1)=50;
        eye(i,j,2)=0;
        eye(i,j,3)=0;
    end
end
for j=eyeh-1
    for j=p:-1:eyew-30
        eye(i,j,1)=50;
        eye(i,j,2)=0;
        eye(i,j,3)=0;
    end
end
for i=eyeh-1:final_m+2
    for j=eyew-30
        eye(i,j,1)=50;
        eye(i,j,2)=0;
        eye(i,j,3)=0;
    end
end
for i=final_m+2
    for j=eyew-30:p
        eye(i,j,1)=50;
        eye(i,j,2)=0;
        eye(i,j,3)=0;
    end
end


    