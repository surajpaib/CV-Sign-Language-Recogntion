function [Theta1,Theta2,X,Y,Xval,Yval,Xtest,Ytest]=maintrain(lambda)

%% Design the Network Architecture
hidden_layers=5;
load('neuralinput.mat');
% r=randi([1 120],120,1);
% J=X(:,r);
% K=Y(:,r);
Xval=X(:,[26:35 66:75 106:115]);
Xtest=X(:,[36:40 76:80 116:120]);
X=X(:,[1:25 41:65 81:105]);
Yval=Y(:,[26:35 66:75 106:115]);
Ytest=Y(:,[36:40 76:80 116:120]);
Y=Y(:,[1:25 41:65 81:105]);
%% Extract parameters of the data
m=size(X,2);

output_layers=size(Y,1);
input_layers=size(X,1);
fprintf('The Neural Network Architecture is\n Input Neurons:%d \n Hidden Layer Neurons:%d\n Output Layer:%d\n\n',input_layers+1,hidden_layers+1,output_layers);


%% Initialize Randomized Theta values

theta1=randInitializeWeights(input_layers,hidden_layers);
theta2=randInitializeWeights(hidden_layers,output_layers);
initial_theta=[theta1(:);theta2(:)];
% lambda=0;
% [J,grad]=costFunction(initial_theta,X,Y,lambda,hidden_layers);
% 
% fprintf('\nThe cost function for non-regularized network is %f',J);
% pause;


options = optimset('MaxIter',300,'Display','iter');

costFunc = @(p) costFunction(p,X,Y,lambda,hidden_layers,m);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[theta,cost] = fmincg(costFunc,initial_theta, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(theta(1:hidden_layers * (input_layers + 1)), ...
                 hidden_layers, (input_layers + 1));

Theta2 = reshape(theta((1 + (hidden_layers * (input_layers + 1))):end), ...
                 output_layers, (hidden_layers + 1));

             
%% Theta1 and Theta2 are sent to Validation procedures.            


end
