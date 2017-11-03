function power=I_TakePowerOfParts(polarImage)
polarImage=polarImage(90:200,1:700);
D=size(polarImage);
amount=0;
polarImage=im2double(polarImage);
iteration=700/20;
%%
average=0;
    for c= 1: 700
       for r=1:110
          average=average+polarImage(r,c); 
       end
    end
    average=average/77000;
    



%%
for n=1:20
    for c= ((n-1)*iteration)+1:(n*iteration)
       for r=10:D(1)-1
          amount=amount+polarImage(r,c); 
       end
    end
    power(n)=amount/average;
    amount=0;
    
end



%%


end