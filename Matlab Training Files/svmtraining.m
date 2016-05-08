function [tracc,valacc]=svmtraining(C,sigma)


load('gesturecoordinateio.mat');
X = mapminmax(X,0,1);
Xval=X(:,[36:40 76:80 116:120]);
X=X(:,[1:35 41:75 81:115]);

Yval=Y(:,[36:40 76:80 116:120]);

Y=Y(:,[1:35 41:75 81:115]);
Oval=zeros(3,15);
[~,yval]=max(Yval,[],1);
[~,y]=max(Y,[],1);
Y1=Y(1,:);
Y2=Y(2,:);
Y3=Y(3,:);
%% Setting up parameters for SVM Model

model1= svmTrain(X.', Y1.', C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
model2= svmTrain(X.', Y2.', C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
model3= svmTrain(X.', Y3.', C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
Oval1=svmPredict(model1,Xval.');
Oval2=svmPredict(model2,Xval.');
Oval3=svmPredict(model3,Xval.');
Oval(1,:)=Oval1.';
Oval(2,:)=Oval2.';
Oval(3,:)=Oval3.';
O1=svmPredict(model1,X.');
O2=svmPredict(model2,X.');
O3=svmPredict(model3,X.');
O(1,:)=O1.';
O(2,:)=O2.';
O(3,:)=O3.';
[~,o]=max(O,[],1);
[~,oval]=max(Oval,[],1);
valacc=mean(double(oval==yval));
tracc=mean(double(o==y));
end


