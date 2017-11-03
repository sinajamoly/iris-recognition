function average=I_featureVector(image,number)
image=[image(30:150 ,1:233 ) image(30:150 ,467:700 )];
dimention =size(image);
columnDiv=dimention(2)/8;
columnDiv=round(columnDiv)-1;
N=0;
power=0;
image=im2double(image);
image=image.*255;
    for c= ((number-1)*columnDiv)+1: number*columnDiv
        for r=1:dimention(1)
            N=N+1;
            power=power+image(r,c);
        end
        
    end
    
average=power/N;

end