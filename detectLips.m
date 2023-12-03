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
%disp(mid_hei);
lip_width=lip_size(2);
mid_wid=ceil(lip_width/2);
%disp(mid_wid);
lab2=medfilt2(lip_bin);
label=bwlabel(lab2,8);
label_wCase=label;

%lip = insertShape(lip, 'circle', [mid_wid mid_hei 10], 'LineWidth', 5);
%figure,imshow(lip),impixelinfo;
for i = lip_height:-1:800
    for j = 1:lip_width
         if(label(i,j)>0)
            label(i,j)=0;
         end
    end
end
%figure,imshow(label),impixelinfo;
%figure,imshow(lip),impixelinfo;
liph=0;
lipw=0;
found=0;
j=mid_wid;
for i=lip_height:-1:mid_hei
    if(label(i,j)>0)
            found=1;
            liph=i;
            lipw=j;
    end
        if(found==1)
            break;
        end
end
%figure,imshow(label_wCase),impixelinfo;
j=mid_wid;
if(liph==0&&lipw==0)
    %liph=1070;
    %lipw=300;
    for i=mid_hei:lip_height
        if(label_wCase(i,j)>0)
            found=1;
            liph=i;
            lipw=j;
        end
        if(found==1)
            liph=liph+250;
            lipw=lipw-80;
            break;
        end
    end
    
end
%disp(lipw);
%disp(liph);
%lip = insertShape(lip, 'circle', [lipw liph 10], 'LineWidth', 5);
%figure,imshow(lip),impixelinfo;
lip = insertShape(lip, 'rectangle', [ lipw-50 liph-80 230 70], 'LineWidth', 10);
%figure,imshow(lip),impixelinfo;


