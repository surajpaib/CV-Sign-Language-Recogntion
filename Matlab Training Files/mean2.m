load('gestacquire.mat','GData1');  %GData1 is the variable which contains 15x120
M=zeros(15,1);
X = GData1;

%% M is a 15X1 vector with mean over 120 samples in this case.

M=zeros(45,1);
for i=1:15   
M(i)=mean(GData1(i,1:40));
M(i+15)=mean(GData1(i,41:80));
M(i+30)=mean(GData1(i,81:120));
end;

%% Deviation from mean is taken as a measure (1st order central moment)
Mean=zeros(45,120);
for i=1:15   
Mean(i,:)=(X(i,:) - M(i));
Mean(i+15,:)=(X(i,:) - M(i+15));
Mean(i+30,:)=(X(i,:) - M(i+30));
end;






%% Now Considering the input data which is GData1 (2nd power central moment)
V=zeros(45,120);
for i=1:15   
V(i,:)=(X(i,:) - M(i)).^2;
V(i+15,:)=(X(i,:) - M(i+15)).^2;
V(i+30,:)=(X(i,:) - M(i+30)).^2;
end;

%% For Skewness, (3rd power central moment)
S=zeros(45,120);
for i=1:15   
S(i,:)=(X(i,:) - M(i)).^3;
S(i+15,:)=(X(i,:) - M(i+15)).^3;
S(i+30,:)=(X(i,:) - M(i+30)).^3;
end;

%% For Kurtosis, ( 4th power central moment)

K=zeros(45,120);
for i=1:15   
K(i,:)=(X(i,:) - M(i)).^4;
K(i+15,:)=(X(i,:) - M(i+15)).^4;
K(i+30,:)=(X(i,:) - M(i+30)).^4;
end;

%%  45x4 giving a 60 leading to a 180x120 matrix of concatenated inputs
Neuralinput = vertcat(Mean,V,S,K);  
X = mapminmax(Neuralinput,0,1);
% Normalizing between -1 to +1
Y(1,1:40)=1;
Y(2,41:80)=1;
Y(3,81:120)=1;
save('neuralinput.mat');



