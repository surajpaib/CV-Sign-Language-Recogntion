for rept=1:11
   
    
I=imread(['C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\Pritika\Gesture1\variant',num2str(rept)],'png');

i=imresize(I,[256,256]);
imshow(i);

img=imresize(I,[256,256]);


fun = @(block_struct) procblock(block_struct.data);
B=blockproc(img,[32 32],fun,'UseParallel',true);
C=zeros(1024,1);
k=1;
count=1;
for j=1:8
     for i=1:8192
         C(k,1)=B(i,j);
         
         if (k>=1024)
             
          xlswrite('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\Suraj\Gesture1\datasethello.xls',C,count,'BO1:CU1024');   
          k=1;
          count=count+1;
         else
             k=k+1;
             
         end
     end
end



end





