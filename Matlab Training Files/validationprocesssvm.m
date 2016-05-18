C=1:100:10000;
sigma=0.01:100:10000;
trainingacc=zeros(size(C,2),size(sigma,2));
validationacc=zeros(size(C,2),size(sigma,2));
for i=1:size(C,2)
    parfor j=1:size(sigma,2)
        
        [tracc,valacc]=svmtraining(C(i),sigma(j));
        trainingacc(i,j)=tracc;
        validationacc(i,j)=valacc;
    end
end