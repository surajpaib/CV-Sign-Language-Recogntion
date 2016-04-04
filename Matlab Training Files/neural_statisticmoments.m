load('neuralinput.mat');
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