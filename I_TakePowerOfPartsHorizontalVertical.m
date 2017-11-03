function power=I_TakePowerOfPartsHorizontalVertical(polarImage)
polarImage=polarImage(80:200,1:700);
D=size(polarImage);
amount=0;
polarImage=im2double(polarImage);
iterationV=700/50;
iterationH=120/20;
%%
for n=1:20
    for r= ((n-1)*iterationH)+1:(n*iterationH)
       for c=1:D(2)-1
          amount=amount+polarImage(r,c); 
       end
    end
    power1(n)=amount;
    amount=0;
    
end

%%
for n=1:50
    for c= ((n-1)*iterationV)+1:(n*iterationV)
       for r=10:D(1)-10
          amount=amount+polarImage(r,c); 
       end
    end
    power2(n)=amount;
    amount=0;
    
end

power=[power1 power2];

%%


end