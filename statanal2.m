function [G1,G2,G3]=statanal()

clear all;close all;
G1=zeros(10,3,40);
G2=zeros(10,3,40);
G3=zeros(10,3,40);


for i=1:12
G1(:,:,i)=xlsread(['Repository\Pritika\Gesture1\variant',num2str(i),'.xls'],'A3:C12');
end
for i=1:15
G1(:,:,i+12)=xlsread(['C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\Variants\Hello\variant',num2str(i),'.xls'],'A3:C12');
end

for i=1:12
G2(:,:,i)=xlsread(['Repository\Pritika\Gesture2\variant',num2str(i),'.xls'],'A3:C12');   
end
for i=1:7
G2(:,:,i+12)=xlsread(['C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\Variants\Welcome\variant',num2str(i),'.xls'],'A3:C12');
end

for i=1:12
    G3(:,:,i)=xlsread(['Repository\Pritika\Gesture3\variant',num2str(i),'.xls'],'A3:C12');  
end
for i=1:5
    G3(:,:,i+12)=xlsread(['C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\Variants\Good\variant',num2str(i),'.xls'],'A3:C12');
end