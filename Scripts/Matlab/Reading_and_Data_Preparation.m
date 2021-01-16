% Script for reading of input data for breast tumor classifier's builders
%
% @author Alexander Ocheretyanyy, Charles University
% @year 2021

% Read and prepare data
fullDataSet = dlmread('wdbc.data', ',');
fullDataSet(:, 1) = []; % Remove ID's
desiredOutputForTheWholeDataSet = fullDataSet(:, 1);
fullDataSet(:, 1) = []; % Pure measurements

% Transpose so as to have columns as the input arguments
fullDataSet = fullDataSet';
desiredOutputForTheWholeDataSet = desiredOutputForTheWholeDataSet';

% Get test data set
inputSize = size(fullDataSet, 2);
twentyPercent = ceil(inputSize * 0.2);

perm = randperm(inputSize);
fullDataSet = fullDataSet(:, perm);
desiredOutputForTheWholeDataSet = desiredOutputForTheWholeDataSet(:, perm);

trainingDataSet = fullDataSet(:, 1:(inputSize - twentyPercent));
desiredOutputForTheTrainingDataSet = desiredOutputForTheWholeDataSet(:, 1:(inputSize - twentyPercent));

testDataSet = fullDataSet(:, ((inputSize - twentyPercent) + 1):inputSize);
desiredOutputForTheTestDataSet = desiredOutputForTheWholeDataSet(:, ((inputSize - twentyPercent) + 1):inputSize);

% Expand output to two binary digits
tmp = 1 - desiredOutputForTheTrainingDataSet;
binaryDesiredOutputForTheTrainingDataSet = [desiredOutputForTheTrainingDataSet; tmp];

tmp = 1 - desiredOutputForTheTestDataSet;
binaryDesiredOutputForTheTestDataSet = [desiredOutputForTheTestDataSet; tmp];