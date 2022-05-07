%% Testing Script (Channel 1)

% Load network
load('net45.mat')

% Load channel 1
load('0190_channel1_input(1) (2).mat')
load('0190_channel1_output(1) (2).mat')

% Transpose the data 
channel1=channel1';

% Convert output to categorical
output1=categorical(channel1_output);

% Classify the test data 
YPred = classify(net,channel1)';
YPred_numerical=double(YPred);
YPred_numerical(YPred_numerical==1)=1;
YPred_numerical(YPred_numerical==2)=-1;

% Calculate the accuracy of the predictions
acc = sum(YPred == output1)./numel(output1)

% Time for x_axis
timepoint = 285.2/855605;
time = [timepoint:timepoint:timepoint*855605];

% Create Plot with Seizures highlighted
figure(1)
subplot(3,2,1)
plot(time, channel1, 'b')
hold on 
plot(time(channel1_output==1),channel1(channel1_output==1), '.r')
xlabel('Time (Mins)')
ylabel('Output')
title('Channel 1 Seizures')
legend('Signal', 'Seizure Events', 'Location','southwest')

subplot(3,2,2)
plot(time, channel1, 'b')
hold on 
plot(time(YPred=='1'),channel1(YPred=='1'), '.r')
xlabel('Time (Mins)')
ylabel('Output')
title('Channel 1 Prediction')
legend('Signal', 'Predicted Events', 'Location','southwest')

% Confusion matrix
figure
confusionchart(channel1_output,YPred_numerical)


%% Testing Script (Channel 3)

% Load channel 3
load('0190_channel3_input(1).mat')
load('0190_channel3_output(1).mat')

% Transpose the data 
channel3=channel3';

% Convert output to categorical
output3=categorical(channel3_output);
    
% Classify the test data 
YPred = classify(net,channel3)';
YPred_numerical=double(YPred);
YPred_numerical(YPred_numerical==1)=1;
YPred_numerical(YPred_numerical==2)=-1;

% Calculate the accuracy of the predictions
acc = sum(YPred == output3)./numel(output3);

% Time for x_axis
timepoint = 285.2/855605;
time = [timepoint:timepoint:timepoint*855605];

% Create Plot with Seizures highlighted
figure(1)
subplot(3,2,3)
plot(time, channel3, 'b')
hold on 
plot(time(channel3_output==1),channel3(channel3_output==1), '.r')
xlabel('Time (Mins)')
ylabel('Output')
title('Channel 3 Seizures')
legend('Signal', 'Seizure events','Location','southwest')

subplot(3,2,4)
plot(time, channel3, 'b')
hold on 
plot(time(YPred=='1'),channel3(YPred=='1'), '.r')
xlabel('Time (Mins)')
ylabel('Output')
title('Channel 3 Prediction')
legend('Signal', 'Predicted Events','Location','southwest')

% Confusion matrix
figure
confusionchart(channel3_output, YPred_numerical)

%% Testing Script (Channel 4)

% Load channel 4
load("0190_channel4_input(1) (1).mat")
load("0190_channel4_output(1).mat")

% Transpose the data 
channel4=channel4';

% Convert output to categorical
output4=categorical(channel4_output);

% Classify the test data 
YPred = classify(net,channel4)';
YPred_numerical=double(YPred);
YPred_numerical(YPred_numerical==1)=1;
YPred_numerical(YPred_numerical==2)=-1;

% Calculate the accuracy of the predictions
acc = sum(YPred == output4)./numel(output4)

% Time for x_axis
timepoint = 285.2/855605;
time = [timepoint:timepoint:timepoint*855605];

% Create Plot with Seizures highlighted
figure(1)
subplot(3,2,5)
plot(time, channel4, 'b')
hold on 
plot(time(channel4_output==1),channel4(channel4_output==1), '.r')
xlabel('Time (Mins)')
ylabel('Output')
title('Channel 4 Seizures')
legend('Signal', 'Seizure events', 'Location','southwest')

subplot(3,2,6)
plot(time, channel4, 'b')
hold on 
plot(time(YPred=='1'),channel4(YPred=='1'), '.r')
xlabel('Time (Mins)')
ylabel('Output')
title('Channel 4 Prediction')
legend('Signal', 'Predicted Events', 'Location','southwest')

% % Confusion matrix
figure
confusionchart(channel4_output,YPred_numerical)

% Calculate the number of points corresponding to seizures
Seizure_points=sum(channel4_output==1);
Corresponding_output=double(YPred_numerical(channel4_output==1));
Number_of_correctly_predicted_points=sum(Corresponding_output==-1);
Accuracy=Number_of_correctly_predicted_points/Seizure_points;

% Calculate the number of points corresponding to normal output 
Normal_points=sum(channel4_output==-1);
Corresponding_output=double(YPred_numerical(channel4_output==-1));
Number_of_correctly_predicted_points=sum(Corresponding_output==1);
Accuracy=Number_of_correctly_predicted_points/Normal_points;

