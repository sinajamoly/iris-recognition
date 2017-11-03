function x = getBinaryString(wpacket)
x=wpacket;
for i=1:size(x,1)
    for j=1:size(x,2)
        if x(i,j)>=0
            x(i,j)=1;
        else
           x(i,j)=0;
        end
    end
end
x=logical(x);