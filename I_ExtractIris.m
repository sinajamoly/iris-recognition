function [irisPolar,irisImage,irisKeeper,irisWithPupil]=I_ExtractIris(eyeImage)
%%
%test


%%


[ci, cp, imagewithnoise] = segmentiris(eyeImage);

D=size(eyeImage);
image_created=zeros(D(1),D(2));
image_created=uint8(image_created);



for r = 1:D(1)
    for c = 1:D(2)

        if sqrt(((cp(2)-c)^2)+(((cp(1)-r))^2))<ci(3)
            image_created(r,c)=eyeImage(r,c);
        
        else
            image_created(r,c) = 0;
        end

    end
end
irisWithPupil=image_created;
for r = 1:D(1)
    for c = 1:D(2)

        if sqrt(((cp(2)-c)^2)+(((cp(1)-r))^2))>cp(3)
            image_created(r,c)=image_created(r,c);
        
        else
            image_created(r,c) = 0;
        end

    end
end
irisKeeper=image_created;
irisImage=image_created(cp(1)-ci(3):cp(1)+ci(3),cp(2)-ci(3):cp(2)+ci(3));
irisPolar= double(irisImage)/255.0;
ci=double(ci);
cp=double(cp);

x =((ci(3)-cp(3))/ci(3));
irisPolar=I_ImToPolar (irisPolar,1 , 0, 200, 700);

end