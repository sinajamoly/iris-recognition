function count1=I_savePolarImageFromFiles(fromFileS,ToFile)
%,toFile,toFileP
count1=0;
srcFiles = dir(strcat(fromFileS,'\0*'));  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat(fromFileS,'\',srcFiles(i).name);
    srcFiles1 = dir(strcat(filename,'\*.bmp'));
    mkdir(strcat('irisSegmentIndian\',srcFiles(i).name));
    mkdir(strcat('irisPolarIndian\',srcFiles(i).name));
    for j = 1 : length(srcFiles1)
    filename1 = strcat(filename,'\',srcFiles1(j).name); 
         try
            eyeImage=imread(filename1);
            eyeImage=rgb2gray(eyeImage);
            
            [irisPolar,irisImage,irisKeeper,irisWithPupil]=I_ExtractIris(eyeImage);
            imwrite(irisImage,strcat('irisSegmentIndian\',srcFiles(i).name,'\',srcFiles1(j).name));
            imwrite(irisPolar,strcat('irisPolarIndian\',srcFiles(i).name,'\',srcFiles1(j).name));
          catch
         end
    count1=count1+1;
    
    end
    
    %% %
%finding iris radius and center coordination
% try
% 
% catch
% end
end


end


