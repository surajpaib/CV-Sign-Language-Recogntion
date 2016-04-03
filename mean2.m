load('gestacquire.mat',Gdata1);  %Gdata1 is the variable which contains 15x120

X = Gdata1(15,120);
for i=1:120  
M = mean(Gdata1(:,i));
end;

for i=1:120   %  Mean of joints over 120 samples
MeanJoint = (X(15,i) - M(i));
end;
MJ = MeanJoint(15,120);

for i=1:120   %  Variance over 120 samples
Variance = (X(15,i) - M(i))^2;
end;
Var = Variance(15,120);

for i=1:120   %  Kurtosis over 120 samples
Kurtosis = (X(15,i) - M(i))^3;
end;
Kur = Kurtosis(15,120);

for i=1:120   % Skewness  over 120 samples
Skewness = (X(15,i) - M(i))^4;
end;
Skew = Skewness(15,120);

FinalInputToNeural = vertcat(MJ,Var,Kur,Skew);   %15x4 giving a 60 leading to a 60x120 matrix of concatenated inputs




