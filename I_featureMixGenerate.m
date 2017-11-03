
function [input, output]=I_featureMixGenerate

srcFiles = dir('C:\Users\pcs\Documents\MATLAB\iris_systemNew\extracted features\fullMatrix0*.mat');  % the folder in which ur images exists
input=[];
output=[];
for i = 1 : length(srcFiles)
    filename = strcat('C:\Users\pcs\Documents\MATLAB\iris_systemNew\extracted features','\',srcFiles(i).name);
    MatF=load(filename);
    feature=MatF.fullMatrix;
    dimention=size(feature);
    C = strsplit(srcFiles(i).name,'x');
    
    y = str2double(C(2));
    b = de2bi(y,6);
    b=[b y];
    out=repmat(b',1,dimention(2));
    
    
    output=[output out];
    input=[input feature];
    
    
    
    
    

end


end