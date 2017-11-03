function gabor=I_Gabor(I,number)

[lambda theta psi gamma bw]=I_gaborBank(number);

i=0;

%I=[I(:,1:250) I(:,450:700)];
%for i=1:9
 

I=im2double(I);
out = zeros(size(I,1), size(I,2));

 gb = gabor_fn(bw,gamma,psi(1),lambda,i*theta)...
        +  gabor_fn(bw,gamma,psi(2),lambda,theta);
    
 out = imfilter(I, gb, 'symmetric');
 
 out = sum(abs(out).^2, 3).^0.5;
 out = out./max(out(:));
 
 
 out=histeq(out);
 gabor=out;
 

end

