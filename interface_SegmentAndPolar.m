function varargout = interface_SegmentAndPolar(varargin)
% INTERFACE_SEGMENTANDPOLAR MATLAB code for interface_SegmentAndPolar.fig
%      INTERFACE_SEGMENTANDPOLAR, by itself, creates a new INTERFACE_SEGMENTANDPOLAR or raises the existing
%      singleton*.
%
%      H = INTERFACE_SEGMENTANDPOLAR returns the handle to a new INTERFACE_SEGMENTANDPOLAR or the handle to
%      the existing singleton*.
%
%      INTERFACE_SEGMENTANDPOLAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE_SEGMENTANDPOLAR.M with the given input arguments.
%
%      INTERFACE_SEGMENTANDPOLAR('Property','Value',...) creates a new INTERFACE_SEGMENTANDPOLAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface_SegmentAndPolar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface_SegmentAndPolar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface_SegmentAndPolar

% Last Modified by GUIDE v2.5 27-Feb-2017 20:33:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_SegmentAndPolar_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_SegmentAndPolar_OutputFcn, ...
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
irisPolar1=[];

% --- Executes just before interface_SegmentAndPolar is made visible.
function interface_SegmentAndPolar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface_SegmentAndPolar (see VARARGIN)

% Choose default command line output for interface_SegmentAndPolar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface_SegmentAndPolar wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface_SegmentAndPolar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in B_segmentImage.
function B_segmentImage_Callback(hObject, eventdata, handles)
% hObject    handle to B_segmentImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fileName, pathName]=uigetfile({'*.jpg'},'File Selector');
fullPathName=strcat(pathName,fileName);
set(handles.T_ImageAddress,'String',fullPathName);

eyeImage=imread(fullPathName);
[irisPolar,irisImage,irisKeeper,irisWithPupil]=I_ExtractIris(eyeImage);

axes(handles.axes1)
imshow(eyeImage);

axes(handles.axes2)
imshow(irisWithPupil);

axes(handles.axes3)
imshow(irisKeeper);

axes(handles.axes4)
imshow(irisImage);

axes(handles.axes5)
imshow(irisPolar);

handles.irisPolar =irisPolar;
guidata(hObject, handles);
%figure,imshow(irisWithPupil);
%figure,imshow(irisKeeper);

%figure,imshow(irisImage);
%mkdir('irisAfterSegment');
%imwrite(irisImage,'irisAfterSegment\irisSegmented.jpg');strcat('irisAfterSegment\',fileName);
%imwrite(irisImage,strcat('irisAfterSegment\',fileName));


% --- Executes on button press in B_featuresExtractionFromImage.
function B_featuresExtractionFromImage_Callback(hObject, eventdata, handles)
% hObject    handle to B_featuresExtractionFromImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gaborFeature=I_gaborFeatureExtractionSingle(handles.irisPolar);
axes(handles.axes6)
plot(gaborFeature);
