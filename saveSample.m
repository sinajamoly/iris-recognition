% function [c,count1]=I_savePolarImageFromFiles(fromFileS,ToFile)
% %,toFile,toFileP
% count1=0;
% srcFiles = dir(strcat(fromFileS,'\001*'));  % the folder in which ur images exists
% for i = 1 : length(srcFiles)
%     filename = strcat(fromFileS,'\',srcFiles(i).name);
%     srcFiles1 = dir(strcat(filename,'\L','\*.jpg'));
%     
%     for j = 1 : length(srcFiles1)
%     filename1 = strcat(filename,'\L','\',srcFiles1(j).name); 
%     c=filename1;
%     count1=count1+1;
%     
%     end
%     
%     %% %
% %finding iris radius and center coordination
% % try
% % 
% % catch
% % end
% end
% 
% 
% end

%%