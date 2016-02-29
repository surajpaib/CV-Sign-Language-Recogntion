I=imread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\Deepthi\Gesture1\variant10.png');

i=imresize(I,[256,256]);
imshow(i);

img=imresize(I,[256,256]);


fun = @(block_struct) procblock(block_struct.data);
B=blockproc(img,[16 16],fun,'UseParallel',true);
C=zeros(256,1);
k=1;
count=1;
for j=1:16
     for i=1:4096
         C(k,1)=B(i,j);
         
         if (k>=1024)
             
          xlswrite('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\Deepthi\Gesture1\dataset1.xls',C,count,'J1:J1024');   
          k=1;
          count=count+1;
         else
             k=k+1;
             
         end
     end
end
imshow(C);







