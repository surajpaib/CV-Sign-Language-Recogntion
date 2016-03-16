function [K,meanvalue,stdvalue,varvalue]=matrixgen()
[m,s,v,G]=diststatistics();
dim=size(G);
j=1;
w=1;
K=zeros(30,63);

meanvalue=zeros(30);
stdvalue=zeros(30);
varvalue=zeros(30);
for i=1:dim(3)
for k=1:30
    K(k,i)=G(j,w,i);
    j=j+1;
    if j==11
        j=1;
        w=w+1;
    end
end
j=1;
w=1;
end

for k=1:30
    meanvalue(k)=m(j,w);
    stdvalue(k)=s(j,w);
    varvalue(k)=v(j,w);
    j=j+1;
    if j==11
        j=1;
        w=w+1;
    end
end

