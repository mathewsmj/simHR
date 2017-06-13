%% Extracting data from parent file 
% Extracts data from ./Templates/ParentFiles/parentFile1.txt
% All data have been manually extracted
%
clear all; 
%close all; 
fileNumber = 1;
parentFile = ['parentFile' num2str(fileNumber) '.txt'];
parentData= readAndParseParentFile(['./Templates/ParentFiles/' parentFile]);

%% Extract Data from first 5 channels
for channel=1:1:4
extractedChannel = parentData{channel}.*5/2^16; %16bit ADC with a max of 5mV
%figure, plot(extractedChannel);
HR = 585; %Heart Rate - Calculated from V-V
EGMBound = 660;
EGM = extractedChannel(1:EGMBound); %The first 660 samples are assumed to have a single beat
figure,plot(EGM);
VMax = max(EGM);

%% Extract A, V, T and baseline values
%TODO : MAKE A FUNCTION TO EXTRACT A, V, T AND BASELINE VALUES%
%Bounds are obtained manually from the plots
%All values are normalized to the VMax
ABounds = [134, 175];
BBounds = [1,134];
Baseline = EGM(BBounds(1):BBounds(2))./VMax;
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

saveFile('AWave', AWave, fileNumber+channel-1, parentFile, num2str(HR), num2str(VMax), ALength);
saveFile('VWave', VWave, fileNumber+channel-1, parentFile, num2str(HR), num2str(VMax), VLength);
saveFile('TWave', TWave, fileNumber+channel-1, parentFile, num2str(HR), num2str(VMax), TLength);
saveFile('Baseline', Baseline, fileNumber+channel-1, parentFile, num2str(HR), num2str(VMax), 999);


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
    fprintf(fID, 'Filename,Channel,BaselineL,BaselineH,AWaveL,AWaveH,VWaveL,VWaveH,TWaveL,TwaveH,HR\n');
    fprintf(fID,'%s,%s\n', parentFile, join(string([channel BBounds ABounds VBounds TBounds HR]),','));
    end
    fclose(fID);
end
end


