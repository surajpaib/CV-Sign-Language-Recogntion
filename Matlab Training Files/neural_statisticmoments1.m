function [y,yval,o,oval,tr]=neural_statisticmoments1(hidden_layerspecs,lambda,learnrate)
load('gesturecoordinateio.mat');

%% Setting the value of output vectors


Xval=X(:,[36:40 76:80 116:120]);
X=X(:,[1:35 41:75 81:115]);

Yval=Y(:,[36:40 76:80 116:120]);
Y=Y(:,[1:35 41:75 81:115]);
%% Set y as a vector to hold the class each sample belongs to
[~,y]=max(Y,[],1);
[~,yval]=max(Yval,[],1);


%% Extracting Hidden Layer Specifications

hidden_layers=hidden_layerspecs(1);

for i=1:hidden_layers
    hidden_units(i)=hidden_layerspecs(i+1);
end


%% Training the Network
net=patternnet(hidden_units,'traingdx','mse');
net=configure(net,X,Y);
net.trainParam.max_fail=500;
net.trainParam.show = 50;
net.trainParam.lr = learnrate;
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-5;
net.performParam.regularization=lambda; 


%% Establishing the network architecture

  net.IW{1,1}=randInitializeWeights1(hidden_units(1),30);
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
   

 
    [net,tr]=train(net,X,Y,'useGPU','yes');
   
     [trainInd,valInd] = dividerand(120,0.8,0.2);
    O=sim(net,X,'useGPU','yes');
    
%% Post processing and calculating the training, validation and testing error
    [~,o]=max(O,[],1);
   
    Oval=sim(net,Xval,'useGPU','yes');
     [~,oval]=max(Oval,[],1);
   
    
    
    end
    
    