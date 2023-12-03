function varargout = faced(varargin)
% FACED M-file for faced.fig
%      FACED, by itself, creates a new FACED or raises the existing
%      singleton*.
%
%      H = FACED returns the handle to a new FACED or the handle to
%      the existing singleton*.
%
%      FACED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FACED.M with the given input arguments.
%
%      FACED('Property','Value',...) creates a new FACED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before faced_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to faced_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help faced

% Last Modified by GUIDE v2.5 26-Nov-2013 11:30:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @faced_OpeningFcn, ...
                   'gui_OutputFcn',  @faced_OutputFcn, ...
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


% --- Executes just before faced is made visible.
function faced_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to faced (see VARARGIN)

% Choose default command line output for faced
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes faced wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = faced_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in selectImage.
function selectImage_Callback(hObject, eventdata, handles)
% hObject    handle to selectImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Filename Pathname]=uigetfile('.jpg');
img=imread([Pathname Filename]);
%img = imresize(img,[512 512]);
subplot('position',[.25 .4 .5 .5]);
imshow(img);
impixelinfo;
title('The original Image');
%grayImage=rgb2gray(img);
handles.img=img;
binaryImage=imcomplement(im2bw(img));
handles.binaryImage=binaryImage;
guidata(hObject,handles);
% --- Executes on button press in binaryImage.


% --- Executes on button press in binaryImage.
function binaryImage_Callback(hObject, eventdata, handles)
% hObject    handle to binaryImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b=handles.binaryImage;
%imshow(b);
%binaryImage=BinaryFaceImage(handles.img);
K=medfilt2(b);
imshow(K),impixelinfo;
title('Binary Image ');
handles.binaryImage=K;
guidata(hObject,handles);


% --- Executes on button press in facialDetecton.
function facialDetecton_Callback(hObject, eventdata, handles)
% hObject    handle to facialDetecton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
faceImage=facialDetection(handles.binaryImage,handles.img);
imshow(faceImage);
title('Facial Region');
handles.face=faceImage;

guidata(hObject,handles);

% --- Executes on button press in convertColor.
function convertColor_Callback(hObject, eventdata, handles)
% hObject    handle to convertColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

skinImage=skinColorConvertion(handles.face);
%a=handles.skinImage;
imshow(skinImage);
title('YCbCr Conversion of the Image');
handles.skinImage = skinImage;
guidata(hObject,handles);


% --- Executes on button press in detectEdge.
function detectEdge_Callback(hObject, eventdata, handles)
% hObject    handle to detectEdge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%edgeImage=sobelEdgeDetection(handles.skinImage);
edgeImage=sobelEdgeDetection(handles.skinImage); %face
imshow(edgeImage);
title('Canny Edge Detection of the Image');
handles.edgeImage=edgeImage;
guidata(hObject,handles);


% --- Executes on button press in labelImage.
function labelImage_Callback(hObject, eventdata, handles)
% hObject    handle to labelImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

L=neighbourhood(handles.face);
imshow(L);
title('Labeled Image');
handles.lImage=L;
guidata(hObject,handles);


% --- Executes on button press in detectEyes.
function detectEyes_Callback(hObject, eventdata, handles)
% hObject    handle to detectEyebrows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

eyebrows=detectEyebrows(handles.face,handles.edgeImage);
subplot('position',[.3 .4 .5 .5]);
imshow(eyebrows);
title('Eyebrows of the person'); %changed
%[r_eyebrow,l_eyebrow]=eyebrowsDetection(handles.face,handles.edgeImage);
guidata(hObject,handles);

% --- Executes on button press in detectEyebrows.
function detectEyebrows_Callback(hObject, eventdata, handles)
% hObject    handle to detectEyes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

eyes=detectEyes(handles.face,handles.edgeImage);
subplot('position',[.3 .4 .5 .5]);
imshow(eyes);
title('Eyes of the person');
%[r_eye,l_eye]=eyesDetection(handles.face,habdles.edgeImage);

% --- Executes on button press in detectNose.
function detectNose_Callback(hObject, eventdata, handles)
% hObject    handle to detectNose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

nose=detectNose(handles.face,handles.edgeImage);
subplot('position',[.3 .4 .5 .5]);
imshow(nose);
title('Nose of the Person');
%noseDetect=noseDetection(handles.face,handles.edgeImage);


% --- Executes on button press in detectLips.
function detectLips_Callback(hObject, eventdata, handles)
% hObject    handle to detectLips (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lip=detectLips(handles.face,handles.edgeImage);
subplot('position',[.3 .4 .5 .5]);
imshow(lip);
title('Lips of the Person');
%lipsDetect=lipsDetection(handles.face,handles.edgeImage);


% --- Executes on button press in binaryImage.
