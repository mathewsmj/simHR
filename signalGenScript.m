clear all
clc

% Randomly select components for the signal from the templates
nOfFiles = length(dir('./Templates/VChannel/AWave/')) - 2;
randChannels = string([randIndex(nOfFiles) randIndex(nOfFiles) randIndex(nOfFiles) randIndex(nOfFiles)]);
AWaveStruct = xWaveStruct(strcat('./Templates/VChannel/AWave/AWave',randChannels(1),'.csv'));
VWaveStruct = xWaveStruct(strcat('./Templates/VChannel/VWave/VWave',randChannels(2),'.csv'));
TWaveStruct = xWaveStruct(strcat('./Templates/VChannel/TWave/TWave',randChannels(3),'.csv'));
BaselineStruct = xWaveStruct(strcat('./Templates/VChannel/Baseline/Baseline',randChannels(4),'.csv'));

AVDelaySinus = 120:10:200; 
VTDelaySinus = 360:10:420;

HR = 60;
% -1 for the delays asks the script to choose a random sinus delay
[simSignal, AVD,VTD,TAD] = simulateSignal(min(87, HR),AWaveStruct,VWaveStruct,TWaveStruct,BaselineStruct,-1,-1,-1);

%%
newHR = 20;
% Calculate change in HR in ms
change =  ceil(60e3./HR) - ceil(60e3./newHR);

% Calculate new delays in m
VTDchange = (-1)^(change>0)*ceil(sqrt(abs(change)));
newVTD = VTD + VTDchange;
newVTD = max(newVTD , abs(VTDelaySinus(1) - str2double(TWaveStruct.wavelength) - str2double(VWaveStruct.wavelength)));
newVTD = min(abs(VTDelaySinus(end) - str2double(TWaveStruct.wavelength) - str2double(VWaveStruct.wavelength)), newVTD);

changeRemainder = (-1)^(change>0)*(abs(change) - abs(newVTD-VTD));
newAVD = AVD + floor(changeRemainder/2);
newAVD = max(newAVD, AVDelaySinus(1));
newAVD = min(AVDelaySinus(end), newAVD);

newTAD = TAD + (-1)^(change>0)*(abs(changeRemainder) - abs(newAVD-AVD));


% Create new signal with same components with modified delays
[newSimSignal, AVD1,VTD1,TAD1] = simulateSignal(newHR,AWaveStruct,VWaveStruct,TWaveStruct,BaselineStruct,newAVD,newVTD,newTAD);

%% Ensure the HRs are as inputted
a = repmat(simSignal,4,1);
A = find(a==max(a));

b = repmat(newSimSignal,4,1);
B = find(b==max(b));

sprintf('HR: %2.0f, newHR: %2.0f',60e3./(A(2)-A(1)),60e3/(B(2)-B(1)))
%% Plot
% figure(1)
clf
plot([repmat(simSignal,4,1);repmat(newSimSignal,4,1)])


