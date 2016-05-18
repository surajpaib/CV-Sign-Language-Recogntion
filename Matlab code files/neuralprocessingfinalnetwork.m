final=neuralprocessing()

x=final;
t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');

net=patternnet([4 4],'trainscg','crossentropy');
    net.layers{1}.transferFcn = 'radbas';
    net.layers{2}.transferFcn = 'tansig';
  
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,x,t,'UseParallel','yes');
    
    y=net(x,'UseParallel','yes');
    view(net)
    figure
plotconfusion(t,y)
figure
plotperform(tr)

