function varargout = interface_Evaluation(varargin)
% INTERFACE_EVALUATION MATLAB code for interface_Evaluation.fig
%      INTERFACE_EVALUATION, by itself, creates a new INTERFACE_EVALUATION or raises the existing
%      singleton*.
%
%      H = INTERFACE_EVALUATION returns the handle to a new INTERFACE_EVALUATION or the handle to
%      the existing singleton*.
%
%      INTERFACE_EVALUATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE_EVALUATION.M with the given input arguments.
%
%      INTERFACE_EVALUATION('Property','Value',...) creates a new INTERFACE_EVALUATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface_Evaluation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface_Evaluation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface_Evaluation

% Last Modified by GUIDE v2.5 27-Feb-2017 21:51:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_Evaluation_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_Evaluation_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before interface_Evaluation is made visible.
function interface_Evaluation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface_Evaluation (see VARARGIN)

% Choose default command line output for interface_Evaluation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface_Evaluation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface_Evaluation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in B_selectTrue.
function B_selectTrue_Callback(hObject, eventdata, handles)
% hObject    handle to B_selectTrue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fullPathName = uigetdir

[CC features ]=I_gaborFeatureExtraction(fullPathName,'');
axes(handles.axes1)
plot(features);
handles.trueFeatures =features;
guidata(hObject, handles);


% --- Executes on button press in B_ProvidingFalseData.
function B_ProvidingFalseData_Callback(hObject, eventdata, handles)
% hObject    handle to B_ProvidingFalseData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fullPathName = uigetdir

[CC features ]=I_gaborFeatureExtraction(fullPathName,'');
axes(handles.axes2)
plot(features);
handles.falseFeatures =features;
guidata(hObject, handles);



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
output=I_targetsMix(handles.trueFeatures , handles.falseFeatures);
handles.output =output;
guidata(hObject, handles);
input=[handles.trueFeatures handles.falseFeatures];
net = feedforwardnet(2);
[net,tr] = train(net,input,output);
handles.net =net;
guidata(hObject, handles);
%a = net(featuresTestTrue(:,5));


% --- Executes on button press in B_EvaluateSystemWithTrue.
function B_EvaluateSystemWithTrue_Callback(hObject, eventdata, handles)
% hObject    handle to B_EvaluateSystemWithTrue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fullPathName = uigetdir

[CC features ]=I_gaborFeatureExtraction(fullPathName,'');

handles.TrueTest =features;


fullPathName = uigetdir

[CC features1 ]=I_gaborFeatureExtraction(fullPathName,'');

handles.FalseTest =features1;

guidata(hObject, handles);


% --- Executes on button press in B_TestTrue.
function B_TestTrue_Callback(hObject, eventdata, handles)
% hObject    handle to B_TestTrue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
featuresTest=[handles.TrueTest handles.FalseTest];
countTrue=0;
countFalse=0;


sizeTrueTest=size(handles.TrueTest);
for c=1:sizeTrueTest(2)
    a = handles.net(handles.TrueTest(:,c))
    
    if a+0.05>0.999
        countTrue=countTrue+1;
    end
     
end



sizeFalseTest=size(handles.FalseTest);
for ce=1:sizeFalseTest(2)
    a = handles.net(handles.FalseTest(:,ce))
    
    if a<0.9400
        countFalse=countFalse+1;
    end
     
end

TP=countTrue
TN=countFalse
FP=sizeFalseTest(2)-countFalse
FN=sizeTrueTest(2)-countTrue

Sensivity=TP/(TP+FN)
specificity=TN/(TN+FP)
NPV=TN/(TN+FN)
Accuracy=(TP+TN)/(TP+FP+FN+TN)


