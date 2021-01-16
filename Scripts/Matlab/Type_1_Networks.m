%% Script for testing Type 1 networks
% 
% This script assumes these variables are defined:
%
% trainingDataSet
% desiredOutputForTheTrainingDataSet
%
% @author Alexander Ocheretyanyy, Charles University
% @year 2021

NUM_OF_NEURONS = 30;

net = feedforwardnet(NUM_OF_NEURONS, 'trainbfg'); % Training function: BFGS Quasi-Newton
net = configure(net, trainingDataSet, desiredOutputForTheTrainingDataSet);

net = train(net, trainingDataSet, desiredOutputForTheTrainingDataSet);