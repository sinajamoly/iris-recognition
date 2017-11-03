function fullMatrix=I_featureExtraction(fileAddress,str)

srcFiles = dir(strcat(fileAddress,'\*.jpg'));  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat(fileAddress,'\',srcFiles(i).name);
    eyeImage = imread(filename);


power=I_TakePowerOfParts(eyeImage);
power=power';



fullMatrix(:,i)=power;





end
save(strcat('extracted features\fullMatrix',str,'x'));
end
