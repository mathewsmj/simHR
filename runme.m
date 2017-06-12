%% Extracting data from parent file 
% Extracts data from ./Templates/ParentFiles/parentFile1.txt
% All data have been manually extracted
%
clear all; 
close all; 
fileNumber = 1;
parentFile = ['parentFile' num2str(fileNumber) '.txt'];
parentData= readAndParseParentFile(['./Templates/ParentFiles/' parentFile]);
extractedChannel = parentData{1}.*5/2^16; %16bit ADC with a max of 5mV
figure, plot(extractedChannel);
HR = 585; %Heart Rate - Calculated from V-V
EGMBound = 660;
EGM = extractedChannel(1:EGMBound); %The first 660 samples are assumed to have a single beat
%figure,plot(EGM);
VMax = max(EGM);

%% Extract A, V, T and baseline values
%TODO : MAKE A FUNCTION TO EXTRACT A, V, T AND BASELINE VALUES%
%Bounds are obtained manually from the plots
%All values are normalized to the VMax
ABounds = [134, 175];
Baseline = EGM(1:ABounds(1))./VMax;
AWave = EGM(ABounds(1):ABounds(2))./VMax;%Extract the atrial signal
ALength = size(AWave,1);%Width of the atrial signal

VBounds = [251, 331];
VWave = EGM(VBounds(1):VBounds(2))./VMax;%Extract the ventricular signal
VLength = size(VWave,1);%Width of the ventricular signal

TBounds = [443, 621];
TWave = EGM(TBounds(1):TBounds(2))./VMax;%Extract the T Wave signal
TLength = size(TWave,1);%Width of the T wave

% figure, plot(Baseline);
% figure, plot(AWave);
% figure, plot(VWave);
% figure, plot(TWave);

%% Save Extracted data

saveFile('AWave', AWave, fileNumber, parentFile, num2str(HR), num2str(VMax), ALength);
saveFile('VWave', VWave, fileNumber, parentFile, num2str(HR), num2str(VMax), VLength);
saveFile('TWave', TWave, fileNumber, parentFile, num2str(HR), num2str(VMax), TLength);
saveFile('Baseline', Baseline, fileNumber, parentFile, num2str(HR), num2str(VMax), 999);




