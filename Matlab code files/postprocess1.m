I=imread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\Deepthi\Gesture1\variant1.png');
<<<<<<< HEAD
i=imresize(I,[256,256]);
imshow(i);
eleghlehgli
=======
img=imresize(I,[256,256]);


fun = @(block_struct) procblock(block_struct.data);
B=blockproc(img,[16 16],fun,'UseParallel',true);

k=1;
for j=1:16
     for i=1:4096
         C(k,j)=B(i,j);
         
         if (k>256)
             
            k=1;
         else
             k=k+1;
             
         end
     end
end
imshow(C);







>>>>>>> refs/remotes/origin/deepthi
