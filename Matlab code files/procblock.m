function r = procblock(varargin)
w=cell2mat(varargin);

 % Convert from cell to double.

y=ones(1024,1);
r=ones(1024,1);
k=1;
for i=1:32
    for j=1:32
        y=sub2ind([32 32],j,i);
        r(k)=w(y);
        k=k+1;
        
        
        
    end
end

