function K=
[m,s,v,G]=diststatistics();
dim=size(G);
j=1;
w=1;
K=zeros(30,63);
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

