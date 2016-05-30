final=neuralprocessing()

x=final;
t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');

net=patternnet([4 4],'trainlm','mse');
    
  
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 500;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,x,t);
    
    y=net(x);

