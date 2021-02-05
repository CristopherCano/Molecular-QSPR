% to use this algorithm, the data should contain the compound class for
% each data point in the first column. Thus, the data should be in a cell
% array variable. This was done importing a csv file, and selecting the 
% variable type opction in the import wizard as "cell array"

Fgroups=table2cell(df_cetano(:,'Class'));  % this is to read the column of compound class from the data
k=10; %number of k-fold cross-validations
cv=cvpartition(Fgroups,'KFold',k);  %this function cvpartition makes the division into 10 randomly chosen sets considering the various compound classes
perfresults=zeros(8,k); %this is to initialize the matrix where performance (R, MSE, MAPE) are saved for all k-fold
x=Input'; % this is to read the inputs, note that the data was read from csv file as a "cell array" variable
t=Target'; % this is to read the targets

for i = 1:cv.NumTestSets  % for fold=1 to k donde cv.NumTestSets=k 
    
    testindex=zeros(cv.TestSize(i),1); %intialize a matrix to save the index values for test set
    trainindex=zeros(cv.TrainSize(i),1); %intialize a matrix to save the index values for train set
    ntest=1; % counter for number of samples in test set
    ntrain=1; % counter for number of samples in train set
    trainIdx = cv.training(i); % cv.training(i) this gives a vector of 0s and 1s for each fold=i, where 1 indicates the index is in the trainig set
    testIdx = cv.test(i); %cv.test(i) this gives a vector of 0s and 1s for each fold=i, where 1 indicates the index is in the test set
    
    for j=1:cv.N % for each data point, cv.N = number of data points or samples
       if testIdx(j) == 1 % loop para obtener los indices que estan en el test set
           testindex(ntest)=j;
           ntest=ntest+1; 
       else % si no estan en el test set, estan en el training set
           trainindex(ntrain)=j;
           ntrain=ntrain+1;
       end
    end
    
% Choose a Training Function
    trainFcn = 'trainbr';  % Bayesian Regularization backpropagation.

% Create a Fitting Network
    hiddenLayerSize = 9;
    net = fitnet(hiddenLayerSize,trainFcn);

% Choose Input and Output Pre/Post-Processing Functions
% For a list of all processing functions type: help nnprocess
    net.input.processFcns = {'removeconstantrows','mapminmax'};
    net.output.processFcns = {'removeconstantrows','mapminmax'};

    net.divideFcn = 'divideind';  % Divide data according to index
    net.divideMode = 'sample';  % Divide up every sample
    net.divideParam.trainInd = trainindex;
    %net.divideParam.valInd = 221:257;
    net.divideParam.testInd = testindex;

% Choose a Performance Function
% For a list of all performance functions type: help nnperformance
    net.performFcn = 'mse';  % Mean Squared Error

% Choose Plot Functions
% For a list of all plot functions type: help nnplot
    %net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    %'plotregression', 'plotfit'};

% Train the Network
    [net,tr] = train(net,x,t);

% Test the Network
    y = net(x);
    e = gsubtract(t,y);
    performance = perform(net,t,y);

% Recalculate Training, Validation and Test Performance
    trainTargets = t .* tr.trainMask{1};
    valTargets = t .* tr.valMask{1};
    testTargets = t .* tr.testMask{1};
    trainPerformance = perform(net,trainTargets,y)
    valPerformance = perform(net,valTargets,y)
    testPerformance = perform(net,testTargets,y)
   
 % get the predicted output and target for trainin and test sets
    trOut=y(tr.trainInd);
    tstOut=y(tr.testInd);
    trTarget=trainTargets(tr.trainInd);
    tstTarget=testTargets(tr.testInd);
 % calculate correlation and mape
    rtest=corrcoef(tstTarget,tstOut);
    rtrain=corrcoef(trTarget,trOut);
    rall=corrcoef(t,y);
    mapetest=mean(abs(e(tr.testInd)./tstTarget));
    mape=mean(abs(e./t));

% fill the perfresults matrix for fold i
    perfresults(:,i)=[rtrain(1,2); rtest(1,2); rall(1,2); sqrt(trainPerformance); sqrt(testPerformance); sqrt(performance); mapetest; mape];
    %weights=getwb(net);

    %pred=y';
    

end