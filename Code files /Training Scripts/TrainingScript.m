
%% Training script 

% Load in data 
load('0190_channel2_input(1) (1).mat')
load('0190_channel2_output(1) (1).mat')
Seizure_points=sum(channel2_output==1);

channel2_section=channel2;
channel2_output_section=channel2_output;

% Convert Time for x_axis
timepoint = 285.2/855605;
time = [timepoint:timepoint:timepoint*855605];

% Create Plot with Seizures highlighted
plot(time, channel2_section, 'b')
hold on 
plot(time(channel2_output_section==1),channel2_section(channel2_output_section==1), 'r')
xlabel('Time (ms)')
ylabel('Signal')
title('Local field potential with seizure events')

% Define Model 
numFeatures=1;
numHiddenUnits=200;
numClasses=2;
layers = [...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits, 'OutputMode','sequence')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];
options =trainingOptions("adam",...
    "MaxEpochs",45,...
    "GradientThreshold", 2,...
    "Verbose",0,...
    "Plots",'training-progress')

% Train the network
net = trainNetwork(channel2',categorical(channel2_output)',layers,options);
save('net45','net')