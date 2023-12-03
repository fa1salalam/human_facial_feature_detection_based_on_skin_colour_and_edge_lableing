for i=1:height
    for j=1:width
        eye(i,j,1)=face(i,j,1);
        eye(i,j,2)=face(i,j,2);
        eye(i,j,3)=face(i,j,3);
    end
end
eye_binary=BinaryFaceImage(eye);
eye_size=size(eye-binary);
eye_height=eye_size(1);
mid1=ceil((eye_height/2)/2);
eye_width=eye_size(2);
mid2=ceil(eye_width/2);
lab=medfilt2(eye_binary);
label=bwlabel(lab,8);
found=0;
for i=mid1+2:eye_height
    for j=mid2:-1:1
        if(edge(i,j)==1&&eye_binary(i,j)==1)
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
for m=eyeh:eye_height
    for n=eyew:-1:1
        if(label(m,n)>0&&label(m,n)==label(eyeh,eyew))
            final_m=m;
            final_n=n;
        end
    end
end
p=final_n-5;
for i=final_m+2:-1:eyeh-2
    for j=p
  eye(i,j,1)=50;
        eye(i,j,2)=0;
        eye(i,j,3)=0;
        m=i;
    end
    
    end       

    for i=m
        for j=p:eyew+25
        eye(i,j,1)=50;
        eye(i,j,2)=0;
        eye(i,j,3)=0;
        n=j;
        end
    end
    for i=m:final_m+2
        for j=n
        eye(i,j,1)=50;
        eye(i,j,2)=0;
        eye(i,j,3)=0;   
       m=i;
        end
    end
    for i=final_m+2
        for j=m:-1:p
            eye(i,j,1)=50;
        eye(i,j,2)=0;
        eye(i,j,3)=0;
        end
    end
    
            
            
        