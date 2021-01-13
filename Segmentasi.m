function varargout = Segmentasi(varargin)
% SEGMENTASI MATLAB code for Segmentasi.fig
%      SEGMENTASI, by itself, creates a new SEGMENTASI or raises the existing
%      singleton*.
%
%      H = SEGMENTASI returns the handle to a new SEGMENTASI or the handle to
%      the existing singleton*.
%
%      SEGMENTASI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEGMENTASI.M with the given input arguments.
%
%      SEGMENTASI('Property','Value',...) creates a new SEGMENTASI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Segmentasi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Segmentasi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Segmentasi

% Last Modified by GUIDE v2.5 13-Jan-2021 20:50:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Segmentasi_OpeningFcn, ...
                   'gui_OutputFcn',  @Segmentasi_OutputFcn, ...
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

% --- Executes just before Segmentasi is made visible.
function Segmentasi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Segmentasi (see VARARGIN)

% Choose default command line output for Segmentasi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Segmentasi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Segmentasi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in buttonInput.
function buttonInput_Callback(hObject, eventdata, handles)
% hObject    handle to buttonInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nama_file,nama_path] = uigetfile({'*.jpg';'*.jpeg';'*.png';});
if ~isequal(nama_file,0)
    handles.data1 = imread(fullfile(nama_path,nama_file));
    guidata(hObject,handles);
    axes(handles.axes1);
    imshow(handles.data1);
else
    return
end

% --- Executes on button press in buttonKmeans.
function buttonKmeans_Callback(hObject, eventdata, handles)
% hObject    handle to buttonKmeans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
gambar = (handles.data1);
gambar = im2double(gambar); %agar tidak terjadi error
r = gambar(:,:,1); %kita ambil warnanya
g = gambar(:,:,2);
b = gambar(:,:,3);
[m,n] = size(r); %mengambil ukuran gambar
r = reshape(r,m*n,1); %menjadikan warna dan ukuran gambar menjadi data
g = reshape(g,m*n,1);
b = reshape(b,m*n,1);
rgb = cat(2,r,g,b);
h = kmeans(rgb,3); %angka 3 ini adalah jumlah cluster
h = reshape(h,m,n);
h = h/3;
imshow(h);

% --- Executes on button press in buttonReset.
function buttonReset_Callback(hObject, eventdata, handles)
% hObject    handle to buttonReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
gambar = (handles.data1);
imshow(gambar);