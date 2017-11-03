function count1=I_testAllTemple(fromFileS,ToFile)
%,toFile,toFileP
count1=0;
srcFiles = dir(strcat(fromFileS,'\019*'));  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat(fromFileS,'\',srcFiles(i).name);
    srcFiles1 = dir(strcat(filename,'\*.jpg'));

    for j = 1 : length(srcFiles1)
    filename1 = strcat(filename,'\',srcFiles1(j).name); 
 %%     
       I=imread(filename1);
    
    end
end


end