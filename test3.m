close all;
clc;
clear;


[CC featuresTrainTrue ]=I_gaborFeatureExtraction('C:\Users\pcs\Documents\MATLAB\iris_systemNew\good segments\016','');


[CC featuresTrainFalse ]=I_gaborFeatureExtraction('C:\Users\pcs\Documents\MATLAB\iris_systemNew\good segments\033','');


[CC featuresTestFalse ]=I_gaborFeatureExtraction('C:\Users\pcs\Documents\MATLAB\iris_systemNew\good segments\test033','');

[CC featuresTestTrue ]=I_gaborFeatureExtraction('C:\Users\pcs\Documents\MATLAB\iris_systemNew\good segments\test016','');

input=[featuresTrainTrue featuresTrainFalse];

output=I_targetsMix(featuresTrainTrue , featuresTrainFalse);

