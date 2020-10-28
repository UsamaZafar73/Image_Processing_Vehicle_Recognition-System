function varargout = version2(varargin)
% VERSION2 MATLAB code for version2.fig
%      VERSION2, by itself, creates a new VERSION2 or raises the existing
%      singleton*.
%
%      H = VERSION2 returns the handle to a new VERSION2 or the handle to
%      the existing singleton*.
%
%      VERSION2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VERSION2.M with the given input arguments.
%
%      VERSION2('Property','Value',...) creates a new VERSION2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before version2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to version2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help version2

% Last Modified by GUIDE v2.5 27-Jul-2020 15:42:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @version2_OpeningFcn, ...
                   'gui_OutputFcn',  @version2_OutputFcn, ...
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


% --- Executes just before version2 is made visible.
function version2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version2 of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to version2 (see VARARGIN)

% Choose default command line output for version2
handles.output = hObject;
%{

hEdit = uicontrol('Style','Edit'); 
jEdit = findobj(hEdit);
jEdit.Border ;
jEdit.Border.get;
lineColor = java.awt.Color(1,0,0);  % =red
thickness = 3;  % pixels
roundedCorners = true;
newBorder = javax.swing.border.LineBorder(lineColor,thickness,roundedCorners);
jEdit.Border = newBorder;
jEdit.repaint;  % redraw the modified control
%}


% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('bgfinal.jpg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes version2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = version2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version2 of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in Browse.
function Browse_Callback(hObject, eventdata, handles)
% hObject    handle to Browse (see GCBO)
% eventdata  reserved - to be defined in a future version2 of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,FilePath ]= uigetfile({'*.JPEG';'*.jpg';'*.bmp';'*.png' },'File Selector');

ExPath = fullfile(FilePath, FileName);
 if isequal(FileName,0) || isequal(FilePath,0)
 h=msgbox('You Pressed Cancel','message');
  return
 end
set(handles.path,'string',ExPath);
img1=imread([FilePath,FileName]);
imshow(img1, 'Parent', handles.axes1);
%h=imshow(img1, 'Parent', handles.axes2);
i=rgb2gray(img1);
%J = imnoise(i,'gaussian',0,0.005);
%K = wiener2(J,[5 5]);
%level = graythresh(K);                  
%BW = im2bw(K,level);
x=imcrop(i,[730 100 500 200]);  
%imshow(x);
imshow(x, 'Parent', handles.axes8);
Mehran = ocr(x,'Language','..\CODE\mehran\tessdata\mehran.traineddata');
disp(Mehran);
Bolan = ocr(x,'Language','..\bolan\myLang\tessdata\myLang.traineddata');
disp(Bolan);
Corolla = ocr(x,'Language','..\OCR Trainer\myLang\tessdata\myLang.traineddata');
disp(Corolla);

l1=length(Mehran.Text); 
disp(l1);
l2=length(Bolan.Text);
disp(l2);
l3=length(Corolla.Text);
disp(l3);

if isequal(l1,0) && isequal(l2,0) && isequal(l3,0)
 msgbox('Not a Corolla/Mehran/Bolan','message');
 disp("Hello");
  return
end

 
for m = 1:l2
    if (Bolan.Text(m) == 'B' && Bolan.Text(m+1) == 'O' && Bolan.Text(m+2) == 'L')
    set(handles.edit8,'String',"BOLAn");
    imshow(img1, 'Parent', handles.axes2);
      return
    end
    
    if ( Bolan.Text(m) == 'O' && Bolan.Text(m+1) == 'L'&& Bolan.Text(m+2) == 'A')
    set(handles.edit8,'String',"BOLAn");
    imshow(img1, 'Parent', handles.axes2);
      return
    end
end



for m = 1:l1
    if (Mehran.Text(m) == 'M')
    set(handles.edit8,'String',"MEHRAN");
    imshow(img1, 'Parent', handles.axes2);
      return
    end
 end

for m = 1:l3
    if (Corolla.Text(m) == 'C'||'c')
    set(handles.edit8,'String',"COROLLA");                                  
    imshow(img1, 'Parent', handles.axes2);
    end
    
    if ( Bolan.Text(m) == 'O' && Bolan.Text(m+1) == 'L'&& Bolan.Text(m+2) == 'A')
    set(handles.edit8,'String',"BOLAn");
    imshow(img1, 'Parent', handles.axes2);
      return
    end
end
 
 
lineColor = java.awt.Color(1,0,0);  % =red
thickness = 200;  % pixels
roundedCorners = true;
newBorder = javax.swing.border.LineBorder(lineColor,thickness,roundedCorners);
edit8.Border = newBorder;

function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version2 of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version2 of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function path_Callback(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version2 of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path as text
%        str2double(get(hObject,'String')) returns contents of path as a double


% --- Executes during object creation, after setting all properties.
function path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version2 of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in Recognize.
function Recognize_Callback(hObject, eventdata, handles)
% hObject    handle to Recognize (see GCBO)
% eventdata  reserved - to be defined in a future version2 of MATLAB
% handles    structure with handles and user data (see GUIDATA)
getappdata(0,'edit12');
axis on
  ClearImagesFromAxes(handles.axes1)
     axes(handles.axes1);axis on
        set(handles.axes1,'xtick',[],'ytick',[]);
        ClearImagesFromAxes(handles.axes2)
         axes(handles.axes2);axis on
        set(handles.axes2,'xtick',[],'ytick',[]);
% --- Executes on button press in pushbutton3.
