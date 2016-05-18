[K,meanvalue,stdvalue,varvalue]=matrixgen();


%%%

j=[1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10];
for i=1:30

subplot(10,3,i)
hold on;
plot(meanvalue(i),0,'-x',(K(i,1:27)/stdvalue(i)),0,'-ro',(K(i,28:46)/stdvalue(i)),0,'-go',(K(i,47:63)/stdvalue(i)),0,'-bo')
title(['Joint',num2str(j(i))]);
ylim([-0.2 0.2]);

end



