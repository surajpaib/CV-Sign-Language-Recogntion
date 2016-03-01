

rep=1;
for rept=1:11
   
sheet=['CK','CL','CM','CN','CO','CP','CQ','CR','CS','CT','CU'];

I=imread(['C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\Deepthi\Gesture3\variant',num2str(rept)],'png');


img=imresize(I,[256,256]);
figure
imshow(img)


fun = @(block_struct) procfn(block_struct.data);
D=blockproc(img,[64 64],fun,'UseParallel',true);
C=zeros(4096,1);
k=1;
count=1;
for j=1:4
     for i=1:16384
         
         
         C(k,1)=D(i,j);
         
         if (k==4096)
             
        xlswrite('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',C,count,[sheet(rep),sheet(rep+1),'1']);   
        k=1;
          count=count+1;
         else
             k=k+1;
             
         end
     end
end


rep=rep+2;
end





