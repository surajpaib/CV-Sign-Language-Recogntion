



GData=zeros(10,3,120);
%%% For Gesture 1
for i=1:12
GData(:,:,i)=xlsread(['Repository\Deepthi\Gesture1\variant',num2str(i),'.xls'],1,'A3:C12');
end
for i=1:12
GData(:,:,i+12)=xlsread(['Repository\Pritika\Gesture1\variant',num2str(i),'.xls'],1,'A3:C12');
end
for i=1:12
GData(:,:,i+24)=xlsread(['Repository\Suraj\Gesture1\variant',num2str(i),'.xls'],1,'A3:C12');
end
for i=1:4
GData(:,:,i+36)=xlsread(['Repository\Variants\Hello\variant',num2str(i),'.xls'],1,'A3:C12');
end
%% For Gesture 2
for i=1:12
GData(:,:,i+40)=xlsread(['Repository\Deepthi\Gesture2\variant',num2str(i),'.xls'],1,'A3:C12');
end
for i=1:12
GData(:,:,i+52)=xlsread(['Repository\Pritika\Gesture2\variant',num2str(i),'.xls'],1,'A3:C12');
end
for i=1:12
GData(:,:,i+64)=xlsread(['Repository\Suraj\Gesture2\variant',num2str(i),'.xls'],1,'A3:C12');
end
for i=1:4
GData(:,:,i+76)=xlsread(['Repository\Variants\Welcome\variant',num2str(i),'.xls'],1,'A3:C12');
end


%% For Gesture 3
for i=1:12
GData(:,:,i+80)=xlsread(['Repository\Deepthi\Gesture3\variant',num2str(i),'.xls'],1,'A3:C12');
end
for i=1:12
GData(:,:,i+92)=xlsread(['Repository\Pritika\Gesture3\variant',num2str(i),'.xls'],1,'A3:C12');
end
for i=1:12
GData(:,:,i+104)=xlsread(['Repository\Suraj\Gesture3\variant',num2str(i),'.xls'],1,'A3:C12');
end
for i=1:4
GData(:,:,i+116)=xlsread(['Repository\Variants\Good\variant',num2str(i),'.xls'],1,'A3:C12');
end


%% Load datasets into a .mat file
GData2=zeros(30,120); %%% 30 input points
GData1=zeros(15,120);  %%%% 15 input points( 5 joints x 3 coordinates each)
GData11=GData([1 2 3 7 8],:,:);
for i=1:120
    GData2(:,i)=reshape(GData(:,:,i),30,1);

end
for i=1:120
    GData1(:,i)=reshape(GData11(:,:,i),15,1);

end



save('gestacquire.mat');




