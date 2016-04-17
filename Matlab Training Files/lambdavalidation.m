tic
close all;
clear all;
lambda=0:10e-6:10e-3;
n=size(lambda,2);
validationerror=zeros(n);
trainingerror=zeros(n);
testerror=zeros(n);


for i=1:n
    

[Theta1,Theta2,X,Y,Xval,Yval,Xtest,Ytest]=maintrain(lambda(i));

pred = predict(Theta1, Theta2, X);
[~,y]=max(Y,[],1);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
predval = predict(Theta1, Theta2, Xval);
[~,yval]=max(Yval,[],1);
fprintf('\nValidation Set Accuracy: %f\n', mean(double(predval == yval)) * 100);
predtest = predict(Theta1, Theta2, Xtest);
[~,ytest]=max(Ytest,[],1);
fprintf('\nTest Set Accuracy: %f\n', mean(double(predtest == ytest)) * 100);
trainingerror(i)=(1-mean(double(pred == y)));
validationerror(i)=(1-mean(double(predval == yval)));
testerror(i)=(1-mean(double(predtest == ytest)));

end
figure
hold on
toc
elapsedtime=toc
plot(lambda,trainingerror(:,1),'Color','b');

plot(lambda,validationerror(:,1),'Color','r');
plot(lambda,testerror(:,1),'Color','g');
title('Training and Validation error plotted against lambda');
xlabel('lambda');
ylabel('Error percentage');

hold off


[~,index]=min(validationerror(:,1));
fprintf('\n\nThe Lambda value for which validation error is minimum and Model Selection is most effective is %2f and the validation error is %f\n',lambda(index),validationerror(index));



