function final=neuralprocessing();
  
    p1=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',1);
    
    t=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\output.xlsx');
    
%     NET=network(99);
net=patternnet(3,'traingd','mse');
    
    net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p1,t,'UseParallel','yes');
    
    a1=net(p1,'UseParallel','yes');
    
    
    
    
    p2=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',2);
    
   
    [net,tr]=train(net,p2,t,'UseParallel','yes');
    
    a2=net(p2,'UseParallel','yes');
    
    
    
    
    p3=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',3);
    
   
    [net,tr]=train(net,p3,t,'UseParallel','yes');
    
    a3=net(p3,'UseParallel','yes');
    
    
    
    p4=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',4);
    
    
    [net,tr]=train(net,p4,t,'UseParallel','yes');
    
    a4=net(p4,'UseParallel','yes');
    
    
    
    p5=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',5);
  
    [net,tr]=train(net,p5,t,'UseParallel','yes');
    
    a5=net(p5,'UseParallel','yes');
    
    
    
    p6=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',6);
    
   
    [net,tr]=train(net,p6,t,'UseParallel','yes');
    
    a6=net(p6,'UseParallel','yes');
    
    
      p7=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',7);
    
   
    [net,tr]=train(net,p6,t,'UseParallel','yes');
    
    a7=net(p7,'UseParallel','yes');
    
    
      p8=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',8);
     [net,tr]=train(net,p8,t,'UseParallel','yes');
    
    a8=net(p8,'UseParallel','yes');
    
    
    
     p9=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',9);
    
 [net,tr]=train(net,p9,t,'UseParallel','yes');
    
    a9=net(p9,'UseParallel','yes');
    
    
    p10=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',10);
    
  [net,tr]=train(net,p10,t,'UseParallel','yes');
    
    a10=net(p10,'UseParallel','yes');
    
    
    
    p11=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',11);
    
 [net,tr]=train(net,p11,t,'UseParallel','yes');
    
    a11=net(p11,'UseParallel','yes');
    
    
    
    p12=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',12);
    
  [net,tr]=train(net,p12,t,'UseParallel','yes');
    
    a12=net(p12,'UseParallel','yes');
    
    
    
    p13=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',13);
    
[net,tr]=train(net,p13,t,'UseParallel','yes');
    
    a13=net(p13,'UseParallel','yes');
    
    
    
    p14=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',14);
    
  [net,tr]=train(net,p14,t,'UseParallel','yes');
    
    a14=net(p14,'UseParallel','yes');
    
    
    
    p15=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',15);
 
    [net,tr]=train(net,p15,t,'UseParallel','yes');
    
    a15=net(p15,'UseParallel','yes');
    
    %Network
    
    
    p16=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Repository\datasethello.xls',16);
    
 [net,tr]=train(net,p16,t,'UseParallel','yes');
    
    a16=net(p16,'UseParallel','yes');
    
    final=zeros(48,99);
   for i=1:3
       final(i,:)=a1(i,:);
   end
   for i=4:6
       final(i,:)=a2(i-3,:);
   end
    for i=7:9
       final(i,:)=a3(i-6,:);
   end
for i=10:12
       final(i,:)=a4(i-9,:);
   end
   for i=13:15
       final(i,:)=a5(i-12,:);
   end
    for i=16:18
       final(i,:)=a6(i-15,:);
   end
    for i=19:21
       final(i,:)=a7(i-18,:);
   end
   for i=22:24
       final(i,:)=a8(i-21,:);
   end
    for i=25:27
       final(i,:)=a9(i-24,:);
    end
   for i=28:30
       final(i,:)=a10(i-27,:);
   end
   for i=31:33
       final(i,:)=a11(i-30,:);
   end
    for i=34:36
       final(i,:)=a12(i-33,:);
   end
for i=37:39
       final(i,:)=a13(i-36,:);
   end
   for i=40:42
       final(i,:)=a14(i-39,:);
   end
    for i=43:45
       final(i,:)=a15(i-42,:);
    end
   for i=46:48
       final(i,:)=a16(i-45,:);
   end
    
    
    