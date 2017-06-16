%% Extracting data from parent file 
% Extracts data from ./Templates/ParentFiles/parentFile1.txt
% All data have been manually extracted
%
clear all; 
%close all; 
fileNumber = 3;
parentFile = ['parentFile' num2str(fileNumber) '.txt'];
parentData= readAndParseParentFile(['./Templates/ParentFiles/' parentFile]);
currentDirLength = 30;%length(dir('./Templates/VChannel/AWave/'))-2;
startChannel = 17;
%% Extract Data from first 5 channels
for channel=startChannel:1:19
extractedChannel = 2*parentData{channel}.*5/2^16; %16bit ADC with a max of 5mV
%figure, plot(extractedChannel);
HR = ceil(60e3/97); %Heart Rate in ms - Calculated from V-V
EGMBound = 2400;
EGM = extractedChannel(1:EGMBound); %The first 660 samples are assumed to have a single beat
 %figure(1),subplot(5,4,channel),plot(EGM), title(num2str(channel)); 
 %figure(2), hold on, plot(EGM), hold off; 
VMax = max(EGM);

%% Extract A, V, T and baseline values
%TODO : MAKE A FUNCTION TO EXTRACT A, V, T AND BASELINE VALUES%
%Bounds are obtained manually from the plots
%All values are normalized to the VMax
BBounds = [1450,1524];
ABounds = [1524,1589];
Baseline = EGM(BBounds(1):BBounds(2))./VMax;
AWave = EGM(ABounds(1):ABounds(2))./VMax;%Extract the atrial signal
ALength = size(AWave,1);%Width of the atrial signal

VBounds = [1652,1764];
VWave = EGM(VBounds(1):VBounds(2))./VMax;%Extract the ventricular signal
VLength = size(VWave,1);%Width of the ventricular signal

TBounds = [1800,2038];
TWave = EGM(TBounds(1):TBounds(2))./VMax;%Extract the T Wave signal
TLength = size(TWave,1);%Width of the T wave

% figure, plot(Baseline);
% figure, plot(AWave);
% figure, plot(VWave);
% figure, plot(TWave);

%% Save Extracted data

saveFile('AWave', AWave, currentDirLength + channel - (startChannel-1), parentFile, num2str(HR), num2str(VMax), ALength);
saveFile('VWave', VWave, currentDirLength + channel - (startChannel-1) , parentFile, num2str(HR), num2str(VMax), VLength);
saveFile('TWave', TWave, currentDirLength + channel - (startChannel-1), parentFile, num2str(HR), num2str(VMax), TLength);
saveFile('Baseline', Baseline, currentDirLength + channel - (startChannel-1), parentFile, num2str(HR), num2str(VMax), 999);


%% Add Updated Data to file
fileInfoName = './Templates/ParentFiles/parentFilesInfo.csv';
if (exist(fileInfoName, 'file') == 2)
    fID = fopen(fileInfoName,'a');
    if fID~=-1
    fprintf(fID,'%s,%s\n',parentFile, join(string([channel BBounds ABounds VBounds TBounds HR]),','));
    end
    fclose(fID);
elseif (exist(fileInfoName, 'file') == 0)
    fID = fopen(fileInfoName,'w');
    if fID~=-1
    fprintf(fID, 'Filename,Channel,BaselineL,BaselineH,AWaveL,AWaveH,VWaveL,VWaveH,TWaveL,TWaveH,HR\n');
    fprintf(fID,'%s,%s\n', parentFile, join(string([channel BBounds ABounds VBounds TBounds HR]),','));
    end
    fclose(fID);
end
end
disp('Done!')
