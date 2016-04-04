load('gestacquire.mat','GData2');
X=GData2;

Y(1,1:40)=1;
Y(2,41:80)=1;
Y(3,81:120)=1;

input_layer=size(X);
output_layer=size(Y);
hidden_layer=6;
net=patternnet(hidden_layer,'trainlm','mse');
  net = configure(net,X,Y);
  
  
  
  net.IW{1,1}=randInitializeWeights(hidden_layer,input_layer(1));
  net.LW{2,1}=randInitializeWeights(output_layer(1),hidden_layer);
  net.b{1,1}=randInitializeWeights(hidden_layer,1);
  net.b{2,1}=randInitializeWeights(output_layer(1),1);
    
    
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 100;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,X,Y,'UseParallel','yes');
    
    O=net(X,'UseParallel','yes');
    view(net)
    figure
plotconfusion(Y,O)
figure
plotperform(tr)