function fullMatrix=I_featureExtractionAll(fileAddress)


srcFiles = dir(strcat(fileAddress,'\0*'));  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat(fileAddress,'\',srcFiles(i).name);
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    
    I_featureExtraction(filename,srcFiles(i).name);
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    srcFiles(i).name;


end
fullMatrix='done';
end
%C:\Users\pcs\Documents\MATLAB\iris_system\resultOfSegmentation - Copy (2)