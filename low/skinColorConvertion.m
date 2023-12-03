function skinImage=skinColorConvertion(originalImage)
r=originalImage(:,:,1);
g=originalImage(:,:,2);
b=originalImage(:,:,3);
sizeofImage=size(originalImage);
%disp(sizeofImage);
for m=1:sizeofImage(1)
    for n=1:sizeofImage(2)
        y(m,n)=0.257*r(m,n) + 0.504*g(m,n) + 0.098*b(m,n) + 16;
        Cb(m,n)=0.148*r(m,n) - 0.291*g(m,n) + 0.439*b(m,n) + 128;
        Cr(m,n)=0.439*r(m,n) - 0.368*g(m,n) + 0.071*b(m,n) + 128;
    end
end
for m=1:sizeofImage(1)
 for n=1:sizeofImage(2)   
     if(((140<Cr(m,n))&(Cr(m,n)<170))&((105<Cb(m,n))&(Cb(m,n)<150)))
         skinImage(m,n,1)=0;
         skinImage(m,n,2)=0;
         skinImage(m,n,3)=0;
     else
         skinImage(m,n,1)=255;
         skinImage(m,n,2)=255;
         skinImage(m,n,3)=255;
     end
 end
end
%figure,imshow(skinImage);

    