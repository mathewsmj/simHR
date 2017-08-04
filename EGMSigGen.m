function varargout = EGMSigGen(varargin)
% EGMSIGGEN MATLAB code for EGMSigGen.fig
%      EGMSIGGEN, by itself, creates a new EGMSIGGEN or raises the existing
%      singleton*.
%
%      H = EGMSIGGEN returns the handle to a new EGMSIGGEN or the handle to
%      the existing singleton*.
%
%      EGMSIGGEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EGMSIGGEN.M with the given input arguments.
%
%      EGMSIGGEN('Property','Value',...) creates a new EGMSIGGEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EGMSigGen_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EGMSigGen_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EGMSigGen

% Last Modified by GUIDE v2.5 19-Jun-2017 11:29:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EGMSigGen_OpeningFcn, ...
                   'gui_OutputFcn',  @EGMSigGen_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before EGMSigGen is made visible.
function EGMSigGen_OpeningFcn(hObject, eventdata, handles, varargin)
global generatedBeat generatedSignal AWaveStruct VWaveStruct TWaveStruct BaselineStruct ...
    oldHeartRate generateBtnCallCount
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EGMSigGen (see VARARGIN)

% Choose default command line output for EGMSigGen
handles.output = hObject;
handles.instrStack.String = {};
handles.instrStack.String{1} = 'Waiting';
handles.instrStack.Value = 1;
handles.baselineAxes.XTickLabels = [];
handles.AWaveAxes.XTickLabels = [];
handles.VWaveAxes.XTickLabels = [];
handles.TWaveAxes.XTickLabels = [];
generatedBeat = struct();
generatedBeat.Data = [];
generatedBeat.AVDelay = -1;
generatedBeat.VTDelay = -1;
generatedBeat.TADelay = -1;
generatedSignal = [];
AWaveStruct = struct();
VWaveStruct = struct();
TWaveStruct = struct();
BaselineStruct = struct();
oldHeartRate = 72;
handles.hrTxt.String = 72;
handles.generateBtn.Enable = 'off';
handles.bslngenBtn.Enable = 'off';
generateBtnCallCount = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EGMSigGen wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EGMSigGen_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function avdTxt_Callback(hObject, eventdata, handles)
% hObject    handle to avdTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of avdTxt as text
%        str2double(get(hObject,'String')) returns contents of avdTxt as a double


% --- Executes during object creation, after setting all properties.
function avdTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to avdTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vtdTxt_Callback(hObject, eventdata, handles)
% hObject    handle to vtdTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vtdTxt as text
%        str2double(get(hObject,'String')) returns contents of vtdTxt as a double


% --- Executes during object creation, after setting all properties.
function vtdTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vtdTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tadTxt_Callback(hObject, eventdata, handles)
% hObject    handle to tadTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tadTxt as text
%        str2double(get(hObject,'String')) returns contents of tadTxt as a double


% --- Executes during object creation, after setting all properties.
function tadTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tadTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hrTxt_Callback(hObject, eventdata, handles)
% hObject    handle to hrTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hrTxt as text
%        str2double(get(hObject,'String')) returns contents of hrTxt as a double


% --- Executes during object creation, after setting all properties.
function hrTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hrTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in resetBtn.
function resetBtn_Callback(hObject, eventdata, handles)
% hObject    handle to resetBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global generatedSignal generateBtnCallCount
handles.instrStack.String = {'Running Reset'};
handles.instrStack.Value = 1;
resetInfoHandles(handles.baselineInfo);
resetInfoHandles(handles.AWaveInfo);
resetInfoHandles(handles.VWaveInfo);
resetInfoHandles(handles.TWaveInfo);
handles.instrStack.String{end+1} = 'Reset component Information';
cla(handles.baselineAxes);
cla(handles.AWaveAxes);
cla(handles.VWaveAxes);
cla(handles.TWaveAxes);
handles.instrStack.String{end+1} = 'Cleared component plots';
AWaveStruct = struct();
VWaveStruct = struct();
TWaveStruct = struct();
BaselineStruct = struct();
handles.instrStack.String{end+1} = 'Cleared loaded components';
handles.instrStack.String{end+1} = 'Reset complete!';
generatedSignal = [];
handles.loadBtn.Enable = 'on';
handles.generateBtn.Enable = 'off';
handles.bslngenBtn.Enable = 'off';
generateBtnCallCount = 0;
handles.hrTxt.String = 72;
handles.avdTxt.String = -1;
handles.vtdTxt.String = -1;
handles.tadTxt.String = -1;


% --- Executes on button press in updateBtn.
function updateBtn_Callback(hObject, eventdata, handles)
% hObject    handle to updateBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in generateBtn.
function generateBtn_Callback(hObject, eventdata, handles)
% hObject    handle to generateBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global AWaveStruct VWaveStruct TWaveStruct BaselineStruct generatedBeat...
    generatedSignal oldHeartRate generateBtnCallCount
manualFlag = 0;
heartRate = str2double(handles.hrTxt.String);
if (generateBtnCallCount>0)
    delta = oldHeartRate - heartRate; 
else
    delta = 0;
end
oldHeartRate = heartRate;
AVDelay = str2double(handles.avdTxt.String);
VTDelay = str2double(handles.vtdTxt.String);
TADelay = str2double(handles.tadTxt.String);
[simSignal,outAVDelay,outVTDelay,outTADelay] = simulateSignal(heartRate, AWaveStruct, VWaveStruct, TWaveStruct,...
    BaselineStruct, AVDelay, VTDelay, TADelay, delta, manualFlag);
generatedBeat.Data = simSignal;
generatedBeat.AVDelay = outAVDelay;
generatedBeat.VTDelay = outVTDelay;
generatedBeat.TADelay = outTADelay;
generatedSignal = [generatedSignal; repmat(generatedBeat.Data,str2double(handles.nbeatTxt.String),1)];
plot(handles.signalAxes, generatedSignal);
handles.signalAxes.XLim = [0 length(generatedSignal)];
handles.instrStack.String{end+1} = 'Plotted Generated beat'; 
handles.instrStack.String{end+1} = ['HR:',num2str(heartRate)];
handles.instrStack.String{end+1} = ['AVDelay:',num2str(outAVDelay)];
handles.instrStack.String{end+1} = ['VTDelay:',num2str(outVTDelay)];
handles.instrStack.String{end+1} = ['TADelay:',num2str(outTADelay)];
handles.avdTxt.String = num2str(outAVDelay);
handles.vtdTxt.String = num2str(outVTDelay);
handles.tadTxt.String = num2str(outTADelay);
generateBtnCallCount = 1;



% --- Executes on selection change in instrStack.
function instrStack_Callback(hObject, eventdata, handles)
% hObject    handle to instrStack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns instrStack contents as cell array
%        contents{get(hObject,'Value')} returns selected item from instrStack


% --- Executes during object creation, after setting all properties.
function instrStack_CreateFcn(hObject, eventdata, handles)
% hObject    handle to instrStack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nbeatTxt_Callback(hObject, eventdata, handles)
% hObject    handle to nbeatTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nbeatTxt as text
%        str2double(get(hObject,'String')) returns contents of nbeatTxt as a double


% --- Executes during object creation, after setting all properties.
function nbeatTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nbeatTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in saveBtn.
function saveBtn_Callback(hObject, eventdata, handles)
% hObject    handle to saveBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global generatedSignal fileName
saveDir = './saveSignals/';

if (exist(saveDir,'dir') ~= 7)
    mkdir './saveSignals/';
end

fileName = handles.saveTxt.String;
if strcmp(fileName, 'Enter Filename')
    fileName = 'saveSignal';
end
extension = '.csv';
checkOverwrite(saveDir,extension, handles)
filePath = [saveDir, fileName, extension];
fId = fopen(filePath,'w');
if fId ~= -1
    handles.instrStack.String{end+1} = ['Saving Data to Path: ' filePath];
    fprintf(fId,'--[HEADER]--\n%s\n',string(datetime));
    fprintf(fId,'--[BASELINE]--\n');
    writeCellString(fId,handles.baselineInfo.String);
    fprintf(fId,'--[AWAVE]--\n');
    writeCellString(fId,handles.AWaveInfo.String);
    fprintf(fId,'--[VWAVE]--\n');
    writeCellString(fId,handles.VWaveInfo.String);
    fprintf(fId,'--[TWAVE]--\n');
    writeCellString(fId,handles.TWaveInfo.String);
    fprintf(fId,'--[DATA]--\n');
    fprintf(fId,'%d\n',generatedSignal);
    fprintf(fId,'--[END]--');
end
fclose(fId);


% Check for file overwrite, create a copy and save to file. 
function checkOverwrite(saveDir,extension, handles)
global fileName
allFiles = dir([saveDir fileName '*']);
if (~isempty(allFiles))
    lastFileName = allFiles(length(allFiles)).name(1:end-(length(extension)));
    fileName = [lastFileName 'Copy'];
end

function writeCellString(fId,inputStrCell)
for i=1:length(inputStrCell)
    fprintf(fId, '%s\n', inputStrCell{i});
end

% --- Executes on button press in bslngenBtn.
function bslngenBtn_Callback(hObject, eventdata, handles)
% hObject    handle to bslngenBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BaselineStruct generatedSignal
Baseline = BaselineStruct.data;
mB = mean(Baseline);
sB = sqrt(var(Baseline));
pB = max(Baseline);
HR = ceil(60e3/str2double(handles.hrTxt.String)); % heart rate in ms
generatedBaseline = simulateBaseline(HR, mB, sB, pB);
generatedSignal = [generatedSignal; repmat(generatedBaseline,str2double(handles.nbeatTxt.String),1)];
plot(handles.signalAxes, generatedSignal);
handles.signalAxes.XLim = [0 length(generatedSignal)];
handles.instrStack.String{end+1} = strcat('Added ', handles.nbeatTxt.String, ' baselines.');



% --- Executes on button press in loadBtn.
function loadBtn_Callback(hObject, eventdata, handles)
global AWaveStruct VWaveStruct TWaveStruct BaselineStruct
resetInfoHandles(handles.baselineInfo)
resetInfoHandles(handles.AWaveInfo)
resetInfoHandles(handles.VWaveInfo)
resetInfoHandles(handles.TWaveInfo)

ldPath = './Templates/VChannel/';
instrStackHndl = handles.instrStack;
instrStackHndl.String{end+1} = ['Load Data from Path: ' ldPath];
nOfFiles = length(dir('./Templates/VChannel/AWave/')) - 2;
randChannels = string([randIndex(nOfFiles) randIndex(nOfFiles) randIndex(nOfFiles) randIndex(nOfFiles)]);

BaselineStruct = xWaveStruct(strcat('./Templates/VChannel/Baseline/Baseline',randChannels(4),'.csv'));
instrStackHndl.String{end+1} = strcat('Baseline: Baseline',randChannels(4));
handles.baselineInfo.String{1} = strcat(handles.baselineInfo.String{1},strcat('Baseline',randChannels(4)));
handles.baselineInfo.String{2} = strcat(handles.baselineInfo.String{2},BaselineStruct.parent);
handles.baselineInfo.String{3} = strcat(handles.baselineInfo.String{3},BaselineStruct.wavelength);
handles.baselineInfo.String{4} = strcat(handles.baselineInfo.String{4},BaselineStruct.VMax);

AWaveStruct = xWaveStruct(strcat('./Templates/VChannel/AWave/AWave',randChannels(1),'.csv'));
instrStackHndl.String{end+1} = strcat('AWave: AWave',randChannels(1));
handles.AWaveInfo.String{1} = strcat(handles.AWaveInfo.String{1},strcat('AWave',randChannels(1)));
handles.AWaveInfo.String{2} = strcat(handles.AWaveInfo.String{2},AWaveStruct.parent);
handles.AWaveInfo.String{3} = strcat(handles.AWaveInfo.String{3},AWaveStruct.wavelength);
handles.AWaveInfo.String{4} = strcat(handles.AWaveInfo.String{4},AWaveStruct.VMax);

VWaveStruct = xWaveStruct(strcat('./Templates/VChannel/VWave/VWave',randChannels(2),'.csv'));
instrStackHndl.String{end+1} = strcat('VWave: VWave',randChannels(2));
handles.VWaveInfo.String{1} = strcat(handles.VWaveInfo.String{1},strcat('VWave',randChannels(2)));
handles.VWaveInfo.String{2} = strcat(handles.VWaveInfo.String{2},VWaveStruct.parent);
handles.VWaveInfo.String{3} = strcat(handles.VWaveInfo.String{3},VWaveStruct.wavelength);
handles.VWaveInfo.String{4} = strcat(handles.VWaveInfo.String{4},VWaveStruct.VMax);

TWaveStruct = xWaveStruct(strcat('./Templates/VChannel/TWave/TWave',randChannels(3),'.csv'));
instrStackHndl.String{end+1} = strcat('TWave: TWave',randChannels(3));
handles.TWaveInfo.String{1} = strcat(handles.TWaveInfo.String{1},strcat('TWave',randChannels(3)));
handles.TWaveInfo.String{2} = strcat(handles.TWaveInfo.String{2},TWaveStruct.parent);
handles.TWaveInfo.String{3} = strcat(handles.TWaveInfo.String{3},TWaveStruct.wavelength);
handles.TWaveInfo.String{4} = strcat(handles.TWaveInfo.String{4},TWaveStruct.VMax);

V = max([str2double(AWaveStruct.VMax), str2double(VWaveStruct.VMax),...
    str2double(TWaveStruct.VMax), str2double(BaselineStruct.VMax)]);

plot(handles.baselineAxes,BaselineStruct.data.*V);
instrStackHndl.String{end+1} = 'Plotted Baseline';
plot(handles.AWaveAxes,AWaveStruct.data.*V);
instrStackHndl.String{end+1} = 'Plotted Awave';
plot(handles.VWaveAxes,VWaveStruct.data.*V);
instrStackHndl.String{end+1} = 'Plotted Vwave';
plot(handles.TWaveAxes,TWaveStruct.data.*V);
instrStackHndl.String{end+1} = 'Plotted Twave';


handles.baselineAxes.XTickLabels = [];
handles.AWaveAxes.XTickLabels = [];
handles.VWaveAxes.XTickLabels = [];
handles.TWaveAxes.XTickLabels = [];
instrStackHndl.String{end+1} = 'Enabling generate buttons';
handles.generateBtn.Enable = 'on';
handles.bslngenBtn.Enable = 'on';
handles.loadBtn.Enable = 'off';


function resetInfoHandles(infoHandle)
infoHandle.String = cell(4,1);
infoHandle.String = {'FileName:', 'Parent File:','Wavelength:','VMax:'};



function saveTxt_Callback(hObject, eventdata, handles)
% hObject    handle to saveTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of saveTxt as text
%        str2double(get(hObject,'String')) returns contents of saveTxt as a double


% --- Executes during object creation, after setting all properties.
function saveTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to saveTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
