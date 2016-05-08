
load('neuralinput.mat','X');

%% Setting the value of output vectors
Y=zeros(3,120);
Y(1,1:40)=1;
Y(2,41:80)=1;
Y(3,81:120)=1;


%% Set y as a vector to hold the class each sample belongs to
[~,y]=max(Y,[],1);
hidden_layerspecs=[1 5];
lambda=0;
%% Extracting Hidden Layer Specifications

hidden_layers=hidden_layerspecs(1);

for i=1:hidden_layers
    hidden_units(i)=hidden_layerspecs(i+1);
end


%% Training the Network
net=patternnet(hidden_units,'trainlm','mse');
net=configure(net,X,Y);
net.trainParam.max_fail=500;
net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-5;
net.performParam.regularization=lambda; 


%% Establishing the network architecture

  net.IW{1,1}=randInitializeWeights1(hidden_units(1),180);
   net.b{1}=randInitializeWeights1(hidden_units(1),1);
   
for i=1:hidden_layers
if (i==hidden_layers)
  net.LW{i+1,i}=randInitializeWeights1(3,hidden_units(i));
  net.b{i+1}=randInitializeWeights1(3,1);


else
      net.LW{i+1,i}=randInitializeWeights1(hidden_units(i+1),hidden_units(i));
  net.b{i+1}=randInitializeWeights1(hidden_units(i+1),1);
end
end
   

 
    [net,tr]=train(net,X,Y,'useGPU','only');
    tr
     [trainInd,valInd,testInd] = dividerand(120,0.7,0.15,0.15);
    O=sim(net,X,'useGPU','only');
    
%% Post processing and calculating the training, validation and testing error
    [~,o]=max(O,[],1);
    
    y_train=y(trainInd);
    y_val=y(valInd);
    y_test=y(testInd);
    o_train=o(trainInd);
    o_val=o(valInd);
    o_test=o(testInd);
    

    
    
    
    
    
  

