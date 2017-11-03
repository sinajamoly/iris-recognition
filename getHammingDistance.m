function hd = getHammingDistance(string1,string2)
N=size(string1,1)*size(string2,2);
hd=0;
for i=1:size(string1,1)
    for j=1:size(string1,2)
        res=xor(string1(i,j),string2(i,j));
        if res==1
            hd=hd+1;
        end
    end
end
hd=hd/N;
%hd = NaN;

% shift template left and right, use the lowest Hamming distance
%for shifts=-8:8
    
 %   template1s = shiftbits(template1, shifts,scales);
 %   mask1s = shiftbits(mask1, shifts,scales);
    
    
 %   mask = mask1s | mask2;
    
  %  nummaskbits = sum(sum(mask == 1));
    
  %  totalbits = (size(template1s,1)*size(template1s,2)) - nummaskbits;
    
  %  C = xor(template1s,template2);
    
  %  C = C & ~mask;
  %  bitsdiff = sum(sum(C==1));
    
  %  if totalbits == 0
        
   %     hd = NaN;
        
   % else
        
    %    hd1 = bitsdiff / totalbits;
        
        
     %   if  hd1 < hd || isnan(hd)
            
      %      hd = hd1;
            
       % end
        
        
   % end
    
%end