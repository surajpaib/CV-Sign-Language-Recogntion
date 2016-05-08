load('errorvectors.mat');


l=size(trainingerror);


hold on
plot(1:l,trainingerror,'Color','r');
plot(1:l,valerror,'Color','g');
title('Training and Validation Error');
ylabel('Error Percentage');
xlabel('Iterations');
hold off
