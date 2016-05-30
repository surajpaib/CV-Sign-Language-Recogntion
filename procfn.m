function r = procfn(varargin)
w=cell2mat(varargin);

 % Convert from cell to double.


r=ones(4096,1);
k=1;
for i=1:64
    for j=1:64
        y=sub2ind([64 64],j,i);
        r(k)=w(y);
        
        
        k=k+1;
        
    
        
        
    end
end

