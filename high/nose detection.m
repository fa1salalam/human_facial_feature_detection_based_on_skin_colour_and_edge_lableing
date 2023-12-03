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
nose_height=nose_size(1)
mid1=ceil(nose_height/2);
nose_width=nose_size(2);
mid2=ceil(nose_width/2);
lab=medfilt2(nose_binary);
lbel=bwlabel(lab,8);

found=0;
for i=mid1:-1:1
    for j=1:nose_width
        if(edge(i,j)==1&&nose_binary(i,j)==1&&label(i,j)>0)
            found=1;
            noseh=i;
            nosew=j;
            break;
        end
    end
    if(found==1)
        break;
    end
end
for i=noseh+2
    for j=nosew+5:-1:nosew-25
        nose(i,j,1)=110;
        nose(i,j,2)=0;
        nose(i,j,3)=0;
        m=j;
    end
end
for i=noseh+2:-noseh-20
    for j=m
         nose(i,j,1)=110;
        nose(i,j,2)=0;
        nose(i,j,3)=0;
        n=i;
    end
end
for i=n
    for j=nosew-25:nosew+5
        nose(i,j,1)=110;
        nose(i,j,2)=0;
        nose(i,j,3)=0;
        m=j;
    end
end
for i=noseh-20:noseh+2
    for j=m
         nose(i,j,1)=110;
        nose(i,j,2)=0;
        nose(i,j,3)=0;
        
    end
end

        
        
        
        
        
        
        
        
        
        
        
        
            