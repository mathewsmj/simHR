%% Function to simulate a single beat
% heartRate is the number of desired beats per minute
function simSignal = simulateSignal(heartRate)
heartRate = min(87, heartRate);
beatWavelength = max(220, ceil(60e3/heartRate)); %in millisecond. MAX HR is 90bpm for sinus.
AWaveStruct = xWaveStruct('./Templates/VChannel/AWave/AWave1.csv');
VWaveStruct = xWaveStruct('./Templates/VChannel/VWave/VWave1.csv');
TWaveStruct = xWaveStruct('./Templates/VChannel/TWave/TWave1.csv');
BaselineStruct = xWaveStruct('./Templates/VChannel/Baseline/Baseline1.csv');

% TODO: Find a relation between TA, AV delays and HR.

% In sinus AV Delay is between 120-200ms. This is measured from termination of A
% to onset of V.
AVDelaySinus = 120:10:200; 
AVDelay = AVDelaySinus(randIndex(length(AVDelaySinus)));
% In sinus VT Delay is between 360-420ms. This is measured from onset of V 
% to termination of T.
VTDelaySinus = 360:10:420;
VTDelayRand = VTDelaySinus(randIndex(length(VTDelaySinus)));
VTDelay = VTDelayRand - str2double(VWaveStruct.wavelength) - str2double(TWaveStruct.wavelength);
% TADelay depends on the heart rate. This is measured from termination of T
% to onset of A on succeeding beat.
TADelay = beatWavelength - str2double(AWaveStruct.wavelength) - AVDelay - VTDelayRand;

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