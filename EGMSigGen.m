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

% Last Modified by GUIDE v2.5 16-Jun-2017 17:22:24

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
global generatedOutput
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
generatedOutput = struct();
generatedOutput.Data = [];
generatedOutput.AVDelay = -1;
generatedOutput.VTDelay = -1;
generatedOutput.TADelay = -1;
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
handles.instrStack.String = {'Reset'};
handles.instrStack.Value = 1;
resetInfoHandles(handles.baselineInfo);
resetInfoHandles(handles.AWaveInfo);
resetInfoHandles(handles.VWaveInfo);
resetInfoHandles(handles.TWaveInfo);
cla(handles.baselineAxes);
cla(handles.AWaveAxes);
cla(handles.VWaveAxes);
cla(handles.TWaveAxes);





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
global AWaveStruct VWaveStruct TWaveStruct BaselineStruct generatedOutput
heartRate = str2double(handles.hrTxt.String);
AVDelay = str2double(handles.avdTxt.String);
VTDelay = str2double(handles.vtdTxt.String);
TADelay = str2double(handles.tadTxt.String);
[simSignal,outAVDelay,outVTDelay,outTADelay] = simulateSignal(heartRate, AWaveStruct, VWaveStruct, TWaveStruct,...
    BaselineStruct, AVDelay, VTDelay, TADelay);
generatedOutput.Data = simSignal;
generatedOutput.AVDelay = outAVDelay;
generatedOutput.VTDelay = outVTDelay;
generatedOutput.TADelay = outTADelay;
plot(handles.signalAxes, repmat(generatedOutput.Data,str2double(handles.nbeatTxt.String),1));
handles.signalAxes.XLim = [0 5000];
handles.instrStack.String{end+1} = 'Plotted Generated beat'; 
handles.instrStack.String{end+1} = ['HR:',num2str(heartRate)];
handles.instrStack.String{end+1} = ['AVDelay:',num2str(outAVDelay)];
handles.instrStack.String{end+1} = ['VTDelay:',num2str(outVTDelay)];
handles.instrStack.String{end+1} = ['TADelay:',num2str(outTADelay)];
handles.avdTxt.String = num2str(outAVDelay);
handles.vtdTxt.String = num2str(outVTDelay);
handles.tadTxt.String = num2str(outTADelay);



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


% --- Executes on button press in bslngenBtn.
function bslngenBtn_Callback(hObject, eventdata, handles)
% hObject    handle to bslngenBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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

function resetInfoHandles(infoHandle)
infoHandle.String = cell(4,1);
infoHandle.String = {'FileName:', 'Parent File:','Wavelength:','VMax:'};
