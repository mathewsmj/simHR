%% Create a structure from a signal file
function waveStruct = xWaveStruct(signalFile)
fid=fopen(signalFile);
waveStruct = struct();
% Get header data
if fid ~=1
    line = split(fgetl(fid),',');
    waveStruct.parent = line(end);
    clear line;
    line = split(fgetl(fid),',');
    waveStruct.parentHR = line(end);
    clear line;
    line = split(fgetl(fid),',');
    waveStruct.VMax = line(end);
    clear line;
    line = split(fgetl(fid),',');
    waveStruct.wavelength = line(end);
end
fclose(fid);

% Data starts from the 5th line
waveStruct.data = csvread(signalFile, 5); 

end