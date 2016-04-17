function [J,grad]=costFunction(theta,X,Y,lambda,hidden_layers,m)


%% Code for calculating the cost function of the neural network


output_layers=size(Y,1);
input_layers=size(X,1);
el=hidden_layers * (input_layers + 1);
theta1 = reshape(theta(1:el), ...
                 hidden_layers, (input_layers + 1));


theta2 = reshape(theta((el+1):end),output_layers, (hidden_layers + 1));
Delta2=zeros(output_layers,hidden_layers+1);
Delta1=zeros(hidden_layers,input_layers+1);



J=0;
D1=zeros(size(theta1)).';
D2=zeros(size(theta2)).';
%% Looping over I training examples
for i=1:m

    
    
a1=[1;X(:,i)];

d=Y(:,i);


z2=theta1*a1;

a2=[1; sigmoid(z2)];


z3=theta2*a2;
a3=sigmoid(z3);

J=J-((d.')*log(a3)+(1-(d.'))*log(1-a3));

delta3=a3-d;
delta2=theta2.'*delta3.*sigmoidGradient([1;z2]);

%% Calculating summed Deltas
Delta2=Delta2+delta3*a2.';
Delta1=Delta1+delta2(2:end)*a1.';


end
J=(1/m)*J;


%% Averaging over m iterations
for i=1:hidden_layers
    for j=1:(input_layers)
  
        J=J+(lambda/2*m)*theta1(i,j+1).^2;
       
    
    end
end

for i=1:output_layers
    for j=1:(hidden_layers)
      
        J=J+(lambda/2*m)*theta2(i,j+1).^2;
  
    end
end
%% Code to evaluate the gradient values for the Neural Network
Delta2=Delta2.';
Delta1=Delta1.';
theta1=theta1.';
theta2=theta2.';
D1(1,:)=(1/m)*Delta1(1,:);
D1(2:end,:)=(1/m)*Delta1(2:end,:)+(lambda/m)*theta1(2:end,:);
D2(1,:)=(1/m)*Delta2(1,:);
D2(2:end,:)=(1/m)*Delta2(2:end,:)+(lambda/m)*theta2(2:end,:);
D1=D1.';
D2=D2.';
theta1=theta1.';
theta2=theta2.';
grad=[D1(:);D2(:)];


end