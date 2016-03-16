% [m,s,v]=statistics()

figure
xlabel('X coordinate','FontSize',12,'FontWeight','bold');
ylabel('Y coordinate','FontSize',12,'FontWeight','bold');
zlabel('Z coordinate','FontSize',12,'FontWeight','bold');

title('Difference in mean between 3D coordinates of each of the 10 joints for 3 gestures ','FontSize',12,'FontWeight','bold','Color','b');
x1=m(:,1,1);
y1=m(:,2,1);
z1=m(:,3,1);
x2=m(:,1,2);
y2=m(:,2,2);
z2=m(:,3,2);
x3=m(:,1,3);
y3=m(:,2,3);
z3=m(:,3,3);
view(3);

k1=zeros(1,3,10);
k2=zeros(1,3,10);
k3=zeros(1,3,10);
for i=1:10
k1(:,:,i)=[x1(i);x2(i);x3(i)];
k2(:,:,i)=[y1(i);y2(i);y3(i)];
k3(:,:,i)=[z1(i);z2(i);z3(i)];
end

hold on

plot3(k1(:,:,1),k2(:,:,1),k3(:,:,1),'-rx','LineWidth',2,'DisplayName','Joint1');

plot3(k1(:,:,2),k2(:,:,2),k3(:,:,2),'-gx','LineWidth',2,'DisplayName','Joint2');
plot3(k1(:,:,3),k2(:,:,3),k3(:,:,3),'-bx','LineWidth',2,'DisplayName','Joint3');
plot3(k1(:,:,4),k2(:,:,4),k3(:,:,4),'-cx','LineWidth',2,'DisplayName','Joint4');
plot3(k1(:,:,5),k2(:,:,5),k3(:,:,5),'-mx','LineWidth',2,'DisplayName','Joint5');
plot3(k1(:,:,6),k2(:,:,6),k3(:,:,6),'-yx','LineWidth',2,'DisplayName','Joint6');
plot3(k1(:,:,7),k2(:,:,7),k3(:,:,7),'-kx','LineWidth',2,'DisplayName','Joint7');
plot3(k1(:,:,8),k2(:,:,8),k3(:,:,8),'-.ro','LineWidth',2,'DisplayName','Joint8');
plot3(k1(:,:,9),k2(:,:,9),k3(:,:,9),'-.go','LineWidth',2,'DisplayName','Joint9');
plot3(k1(:,:,10),k2(:,:,10),k3(:,:,10),'-.bo','LineWidth',2,'DisplayName','Joint10');

   hold off;

%     plot3(x2,y2,z2,'-go');
%     plot3(x3,y3,z3,'-b+');
%     


 
    
    
