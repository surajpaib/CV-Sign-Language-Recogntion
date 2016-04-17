close all
clear all

load('gestacquire.mat','GData2');
X=GData2;

Y(1,1:40)=1;
Y(2,41:80)=1;
Y(3,81:120)=1;

input_layer=size(X);
output_layer=size(Y);
hidden_layer=5;

net=patternnet(hidden_layer,'traingdx','mse');
  net = configure(net,X,Y);
   [trainInd,valInd,testInd] = dividerand(120,0.6,0.2,0.2);
  
  
  
  net.IW{1,1}=randInitializeWeights(hidden_layer,input_layer(1));
  net.LW{2,1}=randInitializeWeights(output_layer(1),hidden_layer);
  net.b{1,1}=randInitializeWeights(hidden_layer,1);
  net.b{2,1}=randInitializeWeights(output_layer(1),1);
    
    
    tr.trainParam.show = 50;
tr.trainParam.lr = 0.05;
tr.trainParam.epochs = 100;
tr.trainParam.goal = 1e-5;
 tr.perParam.regularization=1;
    [net,tr]=train(net,X,Y);
   
    O=net(X,'UseParallel','yes');
 
    view(net);
    
    
   figure

plotconfusion(Y, O);

plotperform(tr)