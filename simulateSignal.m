%% Function to simulate a single beat
% heartRate is the number of desired beats per minute
function [simSignal,AVDelay,VTDelay,TADelay] = simulateSignal(heartRate, AWaveStruct, VWaveStruct, TWaveStruct,...
    BaselineStruct, AVDelay, VTDelay, TADelay, delta, manualFlag)

beatWavelength = ceil(60e3/heartRate); %in millisecond

AVDelaySinus = 120:10:200; 
VTDelaySinus = 360:10:420;

if manualFlag
    delta = 0;
end

% In sinus VT Delay is between 360-420ms. This is measured from onset of V
% to termination of T.
if VTDelay==-1
    VTDelayRand = VTDelaySinus(randIndex(length(VTDelaySinus)));
    VTDelay = VTDelayRand - str2double(VWaveStruct.wavelength) -  ... 
        str2double(TWaveStruct.wavelength);
else
    VTDelay = VTDelay + ((-1)^(delta<0))*ceil(sqrt(abs(delta))); %VT delay changes as sqrt(RR) interval
    delta = delta - ((-1)^(delta<0))*ceil(sqrt(abs(delta))); % Update delta
    VTDelay = max(VTDelay, VTDelaySinus(1)- str2double(TWaveStruct.wavelength) - ...
        str2double(VWaveStruct.wavelength));
    VTDelay = min(VTDelay, VTDelaySinus(end)- str2double(TWaveStruct.wavelength) - ... 
        str2double(VWaveStruct.wavelength));
end

% In sinus AV Delay is between 120-200ms. This is measured from termination of A
% to onset of V.
if AVDelay==-1
    AVDelay = AVDelaySinus(randIndex(length(AVDelaySinus)));
else
    AVDelay = AVDelay + ceil(delta/2);
    AVDelay = max(AVDelay, AVDelaySinus(1));
    AVDelay = min(AVDelay, AVDelaySinus(end));
end

% TADelay depends on the heart rate. This is measured from termination of T
% to onset of A on succeeding beat.
if TADelay==-1
    TADelay = max(0,beatWavelength - str2double(AWaveStruct.wavelength) - ... 
        AVDelay - VTDelayRand);
else
    TADelay = max(0,beatWavelength - str2double(AWaveStruct.wavelength) -  ... 
        str2double(VWaveStruct.wavelength) - str2double(TWaveStruct.wavelength) ...
        - AVDelay - VTDelay);
end



AWave = AWaveStruct.data;
VWave = VWaveStruct.data;
TWave = TWaveStruct.data;
Baseline = BaselineStruct.data;

mB = mean(Baseline);
sB = sqrt(var(Baseline));
pB = max(Baseline);

simulatedAWave = movingAverage(AWave,5);
simulatedTWave = movingAverage(TWave,5);
simulatedVWave = VWave;

simSignal = [simulateBaseline(TADelay, mB, sB, pB); simulatedAWave;...
    simulateBaseline(AVDelay, mB, sB, pB); simulatedVWave; ...
    simulateBaseline(VTDelay, mB, sB, pB); simulatedTWave];


simSignal = simSignal.* max([str2double(AWaveStruct.VMax), str2double(VWaveStruct.VMax),...
    str2double(TWaveStruct.VMax), str2double(BaselineStruct.VMax)]);

end