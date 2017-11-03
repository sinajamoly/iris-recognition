function output=I_targetsMix(T , F)

dF=size(F);
dT=size(T);


O1=zeros(1,dF(2));
O2=ones(1,dT(2));

output=[O2 O1];

end