% Script for breast tumor classifier's testing
%
% @author Alexander Ocheretyanyy, Charles University
% @year 2021

% Data retrieval
outputForTheTestDataSet = net(testDataSet);
outputForTheWholeDataSet = net(fullDataSet);

testSetMonoOutput = outputForTheTestDataSet(1, :);
fullSetMonoOutput = outputForTheWholeDataSet(1, :);

% Rounding
for k = 1 : size(testSetMonoOutput, 2)
    if testSetMonoOutput(1, k) >= 0.5
        testSetMonoOutput(1, k) = 1;
    else
        testSetMonoOutput(1, k) = 0;
    end
end

for k = 1 : size(fullSetMonoOutput, 2)
    if fullSetMonoOutput(1, k) >= 0.5
        fullSetMonoOutput(1, k) = 1;
    else
        fullSetMonoOutput(1, k) = 0;
    end
end

%% Plot confusion matrix for the test data set
plotconfusion(desiredOutputForTheTestDataSet, testSetMonoOutput);

%% Plot confusion matrix for the whole data set
plotconfusion(desiredOutputForTheWholeDataSet, fullSetMonoOutput);
