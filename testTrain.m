clc;

% for c=1:6
%     t=sim(network1,featuresTestTrue(:,c));
%     c
%     t
% end



net = feedforwardnet(2);
[net,tr] = train(net,input,output);
a = net(featuresTestTrue(:,5));