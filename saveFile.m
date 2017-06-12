%% SaveFile function
function yy = saveFile(fileName, dataWave, fileNumber, parentFile, heartRate, VMax, wavelength)
header = 'Parent,%s\nHeartRate,%s\nVMax,%s\nWavelength,%s\n [DATA] \n';
filePath = ['./Templates/VChannel/' fileName '/' fileName num2str(fileNumber) '.csv'];
fid = fopen(filePath,'w');
try
    if fid~=-1
        if strcmp(fileName,'Baseline')
            wvstr = 'N/A';
        else
            wvstr = num2str(wavelength);
        end
        fprintf(fid, header, parentFile, num2str(heartRate), num2str(VMax), wvstr);
    end
    fclose(fid);
    dlmwrite(filePath, dataWave,'-append');
    yy = 1;
catch Exception
    disp(Exception);
    yy = 0;
end
end