function gaborFeature=I_gaborFeatureExtractionSingle(irisPolar)

    finalResult=[];
    
        for M=1:20
           gabor=I_Gabor(irisPolar,M);
           for N=1:8
               average=I_featureVector(gabor,N);
               finalResult=[finalResult average];
           end
        end

    gaborFeature=finalResult;
end