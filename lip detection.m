function lip=detectLips(face,edge)
sizeofImage=size(face);
height=sizeofImage(1);
width=sizeofImage(2);

for i=1:height
    for j=1:width
        lip(i,j,1)=face(i,j,1);
        lip(i,j,2)=face(i,j,2);
        lip(i,j,3)=face(i,j,3);
    end
end
lip_bin=BinaryFaceImage(lip);
lip_size=size(lip_bin);
lip_height=lip_size(1);
mid_hei=ceil(lip_height/2);
lip_width=lip_size(2);
mid_wid=ceil(lip_width/2);
lab2=medfilt2(lip_bin);
label=bwlabel(lab2,8);
found=0;
for i=mid_hei-1:lip_height
    for j=1:mid_wid
        if(edge(i,j)==1 && lip_bin(i,j)==1)
            found=1;
            liph=i;
            lipw=j;
        end
    end
    if(found==1)
        break;
    end
end
for m=liph:lip_height
    for n=lipw:-1:1
        if(label(m,n)>0 && label(m,n)==label(liph,lipw))
            final_m=m;
            final_n=n;
        end
    end
end
p=final_n-10; 

for i=final_m+5:-1:liph-5
    for j=p
        lip(i,j,1)=150;
        lip(i,j,2)=0;
        lip(i,j,3)=0;
        m=i;
    end
end
for i=m
    for j=p:lipw+35
        lip(i,j,1)=150;
        lip(i,j,2)=0;
        lip(i,j,3)=0;
        n=j;
    end
end
for i=liph-5:final_m+5
    for j=n
        lip(i,j,1)=150;
        lip(i,j,2)=0;
        lip(i,j,3)=0;
        m=i;
    end
end
for i=m
    for j=lipw+35:-1:p
        lip(i,j,1)=150;
        lip(i,j,2)=0;
        lip(i,j,3)=0;
    
    end
end
  
    
    
    
    
    
    
    
    
    

        
    
    
    