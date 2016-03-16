

function [m,s,v,G]=diststatistics()

meanlist=zeros(10,3);
varlist=zeros(10,3);
stdlist=zeros(10,3);
clear all; close all;
[G1,G2,G3]=statanal();
G=zeros(10,3,63);
for i=1:63
if i<=27    
G(:,:,i)=G1(:,:,i);

else if i<=46
    G(:,:,i)=G2(:,:,(i-27));

else
    G(:,:,i)=G3(:,:,(i-46));
      end
end
end
    
% meanlist=zeros(10,3);
% stdlist=zeros(10,3);
% varlist=zeros(10,3);
for i=1:10
meanlist(i,1,1)=mean(G(i,1,:));
meanlist(i,2,1)=mean(G(i,2,:));
meanlist(i,3,1)=mean(G(i,3,:));
end
% for i=1:10
% meanlist(i,1,2)=mean(G2(i,1,:));
% meanlist(i,2,2)=mean(G2(i,2,:));
% meanlist(i,3,2)=mean(G2(i,3,:));
% end
% 
% for i=1:10
% meanlist(i,1,3)=mean(G3(i,1,:));
% meanlist(i,2,3)=mean(G3(i,2,:));
% meanlist(i,3,3)=mean(G3(i,3,:));
% end
%%%%variance
for i=1:10
varlist(i,1,1)=var(G(i,1,:));
varlist(i,2,1)=var(G(i,2,:));
varlist(i,3.,1)=var(G(i,3,:));
end
% for i=1:10
% varlist(i,1,2)=var(G2(i,1,:));
% varlist(i,2,2)=var(G2(i,2,:));
% varlist(i,3,2)=var(G2(i,3,:));
% end
% 
% for i=1:10
% varlist(i,1,3)=var(G3(i,1,:));
% varlist(i,2,3)=var(G3(i,2,:));
% varlist(i,3,3)=var(G3(i,3,:));
% end
% %%%%std deviation
for i=1:10
stdlist(i,1,1)=std(G1(i,1,:));
stdlist(i,2,1)=std(G1(i,2,:));
stdlist(i,3,1)=std(G1(i,3,:));
end
% for i=1:10
% stdlist(i,1,2)=std(G2(i,1,:));
% stdlist(i,2,2)=std(G2(i,2,:));
% stdlist(i,3,2)=std(G2(i,3,:));
% end
% 
% for i=1:10
% stdlist(i,1,3)=std(G3(i,1,:));
% stdlist(i,2,3)=std(G3(i,2,:));
% stdlist(i,3,3)=std(G3(i,3,:));
% end


m=meanlist;
s=stdlist;
v=varlist;
