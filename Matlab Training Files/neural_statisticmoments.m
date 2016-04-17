close all;
clear all;
load('neuralinput.mat','X');
Y=zeros(3,120);
Y(1,1:40)=1;
Y(2,41:80)=1;
Y(3,81:120)=1;



net=patternnet(50,'trainlm','mse');
 

net = configure(net,X,Y);
  
  net.IW{1,1}=randInitializeWeights(50,180);
  net.LW{2,1}=randInitializeWeights(3,50);
  net.b{1,1}=randInitializeWeights(50,1);
    net.b{2,1}=randInitializeWeights(3,1);
   
    tr.trainParam.show = 50;
tr.trainParam.lr = 0.05;
tr.trainParam.epochs = 100;
tr.trainParam.goal = 1e-5;
 tr.perParam.regularization=1;
 
    [net,tr]=train(net,X,Y);
     [trainInd,valInd,testInd] = dividerand(120,0.6,0.2,0.2);
    O=sim(net,X,'useParallel','yes');
    
    
   figure
plotperform(tr);
 view(net);
    figure
plotconfusion(Y, O, 'Overall');
