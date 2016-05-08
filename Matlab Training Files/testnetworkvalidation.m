

hidden_layerspecs=[1 10];
[y_train,y_val,o_train,o_val,tr]=neural_statisticmoments1(hidden_layerspecs,0.0000001,learnrate);

trainingaccuracy=mean(y_train==o_train)*100;
valaccuracy=mean(y_val==o_val)*100;

