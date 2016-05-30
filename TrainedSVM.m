GData=xlsread('C:\Users\Suraj\OneDrive\Documents\8th Sem\Live Demo Test Data\test1.xls',1,'A3:C12');
X=GData(:);

load('TrainedSVMmodel.mat');
Y1=svmPredict(model1,X.');
Y2=svmPredict(model2,X.');
Y3=svmPredict(model3,X.');
Y(1,:)=Y1.';
Y(2,:)=Y2.';
Y(3,:)=Y3.';
[~,y]=max(Y,[],1);
if (Y1<=2.5)&&(Y3<=0)
    y=2;
end

