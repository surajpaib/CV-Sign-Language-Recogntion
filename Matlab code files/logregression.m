[K,meanvalue,stdvalue,varvalue]=matrixgen();

%%%Log regression model 1
X=K;
Y1=zeros(63);
Y1(1:46)=ones();
% Y2=[ones(27),zeros(36)];
% Y3=[zeros(27),ones(36)];

figure
initial_theta=zeros(30);
plotData(X, Y1);
% plotData(X, Y2);
% plotData(X, Y3);

[cost, grad] = costFunction(initial_theta, X.', Y1);
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X.', Y1)), initial_theta, options);

% Print theta to screen
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

% Plot Boundary
plotDecisionBoundary(theta, X.', Y1);
