function r = procblock(varargin)
w=cell2mat(varargin);

 % Convert from cell to double.

y=ones(256,1);
r=ones(256,1);
k=1;
for i=1:16
    for j=1:16
        y=sub2ind([16 16],j,i);
        r(k)=w(y);
        k=k+1;
        
        
        
    end
end

