clc;
clear;
%close all;





















I=imread('C:\Users\pcs\Documents\MATLAB\iris_systemNew\irisPolar\010\S2010L11.jpg');
I=[I(90:200,1:250) I(90:200,450:700)];

% figure,imshow(I);

%B = imcomplement(A);

% C=I-(B./4);
% points = detectSURFFeatures(A);
% [features, valid_points] = extractFeatures(A, points);
% figure; imshow(A); hold on;
% plot(valid_points.selectStrongest(10),'showOrientation',true);
% figure,imshow(I);
% figure,imshow(A);
% figure,imshow(I);


% thresh = multithresh(I,19);
% seg_I = imquantize(I,thresh);
% figure,imshow(seg_I,[]);


dimention=size(I);
countZero=0;
powerPoint=0
I=double(I);
for r=1 : dimention(1)
    
    
    
    
   for c=1:dimention(2)
       
       if I(r,c)==0
           countZero=countZero+1;
       else
           powerPoint=powerPoint+I(r,c);
       
   end
   
    
    
   end
end
averagePower=(powerPoint)/((dimention(1)*dimention(2))-countZero);
averagePower=averagePower;
NewImage=zeros([dimention(1)] ,[dimention(2)]);

for r=1 : dimention(1)
    
    
    
    
   for c=1:dimention(2)
       if I(r,c)<averagePower-50 
       newImage(r,c)=0;
       
       elseif I(r,c)<averagePower-40 && I(r,c)> averagePower -50
       newImage(r,c)=I(r,c).^0.7;
       
       elseif I(r,c)<averagePower-30 && I(r,c)> averagePower -40
       newImage(r,c)=I(r,c).^0.6;
       
       elseif I(r,c)<averagePower-20 && I(r,c)> averagePower -30
       newImage(r,c)=I(r,c).^0.7;
       
       elseif I(r,c)<averagePower-10 && I(r,c)> averagePower -20
       newImage(r,c)=I(r,c).^0.8;
       
       
       elseif I(r,c)<averagePower && I(r,c)> averagePower -10
           newImage(r,c)=I(r,c).^0.9;
           
       
       elseif I(r,c)>averagePower && I(r,c)< averagePower +10
           newImage(r,c)=I(r,c).*1.1;
       
           
       
       elseif I(r,c)>averagePower +10 && I(r,c)< averagePower +20
           newImage(r,c)=I(r,c).^1.1;
       
       elseif I(r,c)>averagePower +20 && I(r,c)< averagePower +30
           newImage(r,c)=I(r,c).^1.2;
       
       elseif I(r,c)>averagePower +30 && I(r,c)< averagePower +40
           newImage(r,c)=I(r,c).^1.3;
       
       elseif I(r,c)>averagePower +40 && I(r,c)< averagePower +50
           newImage(r,c)=I(r,c).^1.4;     
           
       elseif I(r,c)>averagePower +50 && I(r,c)< averagePower +60
           newImage(r,c)=I(r,c).^1.5;
           
       elseif I(r,c)>averagePower +60 && I(r,c)< averagePower +70
           newImage(r,c)=I(r,c).^1.6;  
           
       elseif I(r,c)>averagePower +70 && I(r,c)< averagePower +80
           newImage(r,c)=I(r,c).^1.7;
           
       elseif I(r,c)>averagePower +80 && I(r,c)< averagePower +90
           newImage(r,c)=I(r,c).^1.7;
       
          
       else
           
   
       
   end
   
    
    
   end
end

newImage=uint8(newImage);
BW = im2bw(newImage);
figure,imshow(newImage);

% figure,imshow(newImage);
   
% points = detectSURFFeatures(newImage);
% [features, valid_points] = extractFeatures(newImage, points);
% figure; imshow(newImage); hold on;
% plot(valid_points.selectStrongest(20),'showOrientation',true);
