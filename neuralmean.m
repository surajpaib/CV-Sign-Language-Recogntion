%#function network traind

    p1=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',1);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p1,t,'UseParallel','yes');
    
    a1=net(p1,'UseParallel','yes');
    
    
    p2=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',2);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p2,t,'UseParallel','yes');
    
    a2=net(p2,'UseParallel','yes');
    
    
    p3=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',3);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p3,t,'UseParallel','yes');
    
    a3=net(p3,'UseParallel','yes');
    
    p4=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',4);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p,t,'UseParallel','yes');
    
    a4=net(p4,'UseParallel','yes');
    
    p5=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',5);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p5,t,'UseParallel','yes');
    
    a5=net(p5,'UseParallel','yes');
    
    p6=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',6);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p6,t,'UseParallel','yes');
    
    a6=net(p6,'UseParallel','yes');
    
      p7=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',7);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p6,t,'UseParallel','yes');
    
    a7=net(p7,'UseParallel','yes');
    
      p8=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',8);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p8,t,'UseParallel','yes');
    
    a8=net(p8,'UseParallel','yes');
    
     p9=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',9);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p9,t,'UseParallel','yes');
    
    a9=net(p9,'UseParallel','yes');
    
    p10=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',10);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p10,t,'UseParallel','yes');
    
    a10=net(p10,'UseParallel','yes');
    
    p11=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',11);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p11,t,'UseParallel','yes');
    
    a11=net(p11,'UseParallel','yes');
    
    p12=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',12);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p12,t,'UseParallel','yes');
    
    a12=net(p12,'UseParallel','yes');
    
    p13=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',13);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p13,t,'UseParallel','yes');
    
    a13=net(p13,'UseParallel','yes');
    
    p14=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',14);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p14,t,'UseParallel','yes');
    
    a14=net(p14,'UseParallel','yes');
    
    p15=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',15);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p15,t,'UseParallel','yes');
    
    a15=net(p15,'UseParallel','yes');
    
    
    p16=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',16);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    net.trainFcn = 'traingdm';
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p16,t,'UseParallel','yes');
    
    a16=net(p16,'UseParallel','yes');
    

    
    
    