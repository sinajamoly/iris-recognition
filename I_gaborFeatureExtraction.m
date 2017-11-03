function [CC features ]=I_gaborFeatureExtraction(fromFileS,ToFile)
%,toFile,toFileP
CC=0;

finalResultAll=[];
srcFiles = dir(strcat(fromFileS,'\*'));  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat(fromFileS,'\',srcFiles(i).name);
    srcFiles1 = dir(strcat(filename,'\*.jpg'));

    for j = 1 : length(srcFiles1)
    filename1 = strcat(filename,'\',srcFiles1(j).name); 
 %%     
        I=imread(filename1); % IMAGE TO IMPLEMENT GABOR FILTERS
        finalResult=[];
        %%
        for M=1:20
           gabor=I_Gabor(I,M);
           for N=1:8
               average=I_featureVector(gabor,N);
               finalResult=[finalResult average];
           end
        end
        X=finalResult';
        finalResultAll=[finalResultAll  X];
    end
    CC=CC+1;
end

features=finalResultAll;
end