function [count1,file]=I_testallFileM(fromFileS,ToFile)

count1=0;
srcFiles = dir(strcat(fromFileS,'\015*'));  % the folder in which ur images exists
file=srcFiles;
%%
for i = 1 : length(srcFiles)
    filename = strcat(fromFileS,'\',srcFiles(i).name);
    srcFiles1 = dir(strcat(filename,'\*.jpg'));

    for j = 1 : 2%length(srcFiles1)
    filename1 = strcat(filename,'\',srcFiles1(j).name); 
%%     
%         n=1;
         I=imread(filename1);
%         shifted = zeros(size(I));
%         shifted(:, 1:700-n) = I(:,1+n:700);
%         shifted=uint8(shifted);
% 
% 
%         Q=shifted-I;
        
       
       gabor=I_Gabor(I,1);
       
        figure,imshow(gabor);
%%
    end
end


end