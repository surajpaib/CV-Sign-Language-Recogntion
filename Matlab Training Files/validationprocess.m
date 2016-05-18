
lambda=0:0.0001:0.001;
learnrate=0.1;
n=size(lambda,2);

trainingaccuracy=zeros(2,11,10,5);
valaccuracy=zeros(2,11,10,5);
spmd
for l=1:2  %% Number of hidden Layers

%% For one hidden layer 

if (l==1)
    
for l1=1:10
l2=0;

for i=1:n
hidden_layerspecs=[l l1 l2];
[y_train,y_val,o_train,o_val,tr]=neural_statisticmoments1(hidden_layerspecs,lambda(i),learnrate);

trainingaccuracy(l,i,l1,1)=mean(y_train==o_train)*100;
valaccuracy(l,i,l1,1)=mean(y_val==o_val)*100;

end
end

end
end
%% For two hidden layers
if (l==2)

for l1=1:10
for l2=1:5
for i=1:n
    
hidden_layerspecs=[l l1 l2];
[y_train,y_val,o_train,o_val]=neural_statisticmoments1(hidden_layerspecs,lambda(i),learnrate);

trainingaccuracy(l,i,l1,l2)=mean(y_train==o_train)*100;
valaccuracy(l,i,l1,l2)=mean(y_val==o_val)*100;


end
end
end
end






end


save('accuracy.mat');




