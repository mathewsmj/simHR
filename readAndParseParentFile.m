%% This function is to read and parse the parent file
function EGMData = readAndParseParentFile(filename1)
    
EGMData_File = csvread(filename1, 192,0); %192nd line is where the Data starts
EGMData = {};
for i=1:size(EGMData_File,2)
    EGMData{i} = EGMData_File(:,i); %Returns a cell with data from all channels
end

end