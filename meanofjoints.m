[m,s,v,k,sk]=statistics();

figure
xlabel('X coordinate','FontS1ze',12,'FontWeight','bold');
ylabel('Y coordinate','FontS1ze',12,'FontWeight','bold');
zlabel('Z coordinate','FontS1ze',12,'FontWeight','bold');

title('Variance,Skewness and Kurtosis in terms of Mean between 3D coordinates of each of the 10 joints for 3 gestures for  ','FontSize',12,'FontWeight','bold','Color','b');
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

X=zeros(1,3,1);   % '3' for over 3 frames
Y=zeros(1,3,1);
Z=zeros(1,3,1); 


%for J1
m11=zeros(1,3,1);
m21=zeros(1,3,1);
m31=zeros(1,3,1); 

m11(:,:,1)=[x1(1);x2(1);x3(1)];
m21(:,:,1)=[y1(1);y2(1);y3(1)];
m31(:,:,1)=[z1(1);z2(1);z3(1)];
v1 = ((X-m11)^2)+((Y-m21)^2)+((Z-m31)^2);
sk1 = ((X-m11)^3)+((Y-m21)^3)+((Z-m31)^3);
k1 = ((X-m11)^4)+((Y-m21)^4)+((Z-m31)^4);


%for J2

m12=zeros(1,3,1);
m22=zeros(1,3,1);
m32=zeros(1,3,1); 


m12(:,:,2)=[x1(2);x2(2);x3(2)];
m22(:,:,2)=[y1(2);y2(2);y3(2)];
m32(:,:,2)=[z1(2);z2(2);z3(2)];
v2 = ((X-m12)^2)+((Y-m22)^2)+((Z-m32)^2);
sk2 = ((X-m12)^3)+((Y-m22)^3)+((Z-m32)^3);
k2 = ((X-m12)^4)+((Y-m22)^4)+((Z-m32)^4);




%for J3

m13=zeros(1,3,1);
m23=zeros(1,3,1);
m33=zeros(1,3,1); 


m13(:,:,3)=[x1(3);x2(2);x3(3)];
m23(:,:,3)=[y1(3);y2(2);y3(3)];
m33(:,:,3)=[z1(3);z2(2);z3(3)];
v3 = ((X-m13)^2)+((Y-m23)^2)+((Z-m33)^2);
sk3 = ((X-m13)^3)+((Y-m23)^3)+((Z-m33)^3);
k3 = ((X-m13)^4)+((Y-m23)^4)+((Z-m33)^4);




%for J7

m17=zeros(1,3,1);
m27=zeros(1,3,1);
m37=zeros(1,3,1); 



m17(:,:,7)=[x1(7);x2(7);x3(7)];
m27(:,:,7)=[y1(7);y2(7);y3(7)];
m37(:,:,7)=[z1(7);z2(7);z3(7)];
v7 = ((X-m17)^2)+((Y-m27)^2)+((Z-m37)^2);
sk7 = ((X-m17)^3)+((Y-m27)^3)+((Z-m37)^3);
k7 = ((X-m17)^4)+((Y-m27)^4)+((Z-m37)^4);



%for J8

m18=zeros(1,3,1);
m28=zeros(1,3,1);
m38=zeros(1,3,1);



m18(:,:,8)=[x1(8);x2(8);x3(8)];
m28(:,:,8)=[y1(8);y2(8);y3(8)];
m38(:,:,8)=[z1(8);z2(8);z3(8)];
v8 = ((X-m18)^2)+((Y-m28)^2)+((Z-m38)^2);
sk8 = ((X-m18)^3)+((Y-m28)^3)+((Z-m38)^3);
k8 = ((X-m18)^4)+((Y-m28)^4)+((Z-m38)^4);



%plot
 hold on;
 
 plot3(v1,sk1,k1,'-rx','LineWidth',2,'DisplayName','Joint1');
text(v1,sk1,k1,'Joint 1');
plot3(v2,sk2,k2,'-gx','LineWidth',2,'DisplayName','Joint2');
text(v2,sk2,k2,'Joint 2');
plot3(v3,sk3,k3,'-bx','LineWidth',2,'DisplayName','Joint3');
text(v3,sk3,k3,'Joint 3');
plot3(v7,sk7,k7,'-kx','LineWidth',2,'DisplayName','Joint7');
text(v7,sk7,k7,'Joint 7');
plot3(v8,sk8,k8,'-.ro','LineWidth',2,'DisplayName','Joint8');
text(v8,sk8,k8,'Joint 8');

%surface plot
 % hold on;  

surf(v1,sk1,k1,L,gradient(L));
colorbar;
text(v1,sk1,k1,'Joint 1');
surf(v2,sk2,k2,L,gradient(L));
colorbar;
text(v2,sk2,k2,'Joint 2');
surf(v3,sk3,k3,L,gradient(L));
colorbar;
text(v3,sk3,k3,'Joint 3');
surf(v7,sk7,k7,L,gradient(L));
colorbar;
text(v7,sk7,k7,'Joint 7');
surf(v8,sk8,k8,L,gradient(L));
colorbar;
text(v9,sk9,k9,'Joint 8');



 


