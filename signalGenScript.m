clear all
clc

nOfFiles = length(dir('./Templates/VChannel/AWave/')) - 2;
randChannels = string([randIndex(nOfFiles) randIndex(nOfFiles) randIndex(nOfFiles) randIndex(nOfFiles)]);
AWaveStruct = xWaveStruct(strcat('./Templates/VChannel/AWave/AWave',randChannels(1),'.csv'));
VWaveStruct = xWaveStruct(strcat('./Templates/VChannel/VWave/VWave',randChannels(2),'.csv'));
TWaveStruct = xWaveStruct(strcat('./Templates/VChannel/TWave/TWave',randChannels(3),'.csv'));
BaselineStruct = xWaveStruct(strcat('./Templates/VChannel/Baseline/Baseline',randChannels(4),'.csv'));

HR = 87;
[simulatedSignal, AVD,VTD,TAD] = simulateSignal(min(87, HR),AWaveStruct,VWaveStruct,TWaveStruct,BaselineStruct,-1,-1,-1);
plot(a);

%%
newHR = 320;
change = newHR - HR;
VTDchange = (-1)^(change>0)*ceil(sqrt(abs(change)));
changeRemainder = (-1)^(change>0)*(abs(change) - abs(VTD_Change));

newVTD = VTD + VTD_Change;
newTAD = TAD + ceil(changeRemainder/2);
newAVD = AVD + floor(changeRemainder/2);
[newSignal, AVD1,VTD1,TAD1] = simulateSignal(newHR,AWaveStruct,VWaveStruct,TWaveStruct,BaselineStruct,newAVD,newVTD,newTAD);

%%
figure
plot([repmat(a,4,1); repmat(a1,4,1)])

