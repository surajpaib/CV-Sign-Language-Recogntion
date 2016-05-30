function varargout = LiveDemofinal(varargin)
% LIVEDEMOFINAL MATLAB code for LiveDemofinal.fig
%      LIVEDEMOFINAL, by itself, creates a new LIVEDEMOFINAL or raises the existing
%      singleton*.
%
%      H = LIVEDEMOFINAL returns the handle to a new LIVEDEMOFINAL or the handle to
%      the existing singleton*.
%
%      LIVEDEMOFINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LIVEDEMOFINAL.M with the given input arguments.
%
%      LIVEDEMOFINAL('Property','Value',...) creates a new LIVEDEMOFINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LiveDemofinal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LiveDemofinal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LiveDemofinal

% Last Modified by GUIDE v2.5 12-May-2016 01:20:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LiveDemofinal_OpeningFcn, ...
                   'gui_OutputFcn',  @LiveDemofinal_OutputFcn, ...
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


% --- Executes just before LiveDemofinal is made visible.
function LiveDemofinal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LiveDemofinal (see VARARGIN)
set(handles.text2, 'String', ' ');
set(handles.text1, 'String', ' ');
% Choose default command line output for LiveDemofinal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LiveDemofinal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LiveDemofinal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text2, 'String', 'Kinect Triggered');
global metaDataDepth;
global frameDataColor;
initialization;
trigger;



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text2, 'String', 'Data Displayed');
global metaDataDepth;
global frameDataColor;
SkeletonConnectionMap = [[1 2]; % Spine
                         [2 3];
                         [3 4];
                         [3 5]; %Left Hand
                         [5 6];
                         [6 7];
                         [7 8];
                         [3 9]; %Right Hand
                         [9 10];
                         [10 11];
                         [11 12];   
                         [1 17]; % Right Leg
                         [17 18];
                         [18 19];
                         [19 20];
                         [1 13]; % Left Leg
                         [13 14];
                         [14 15];
                         [15 16]];

f1=1;
%To check if any skeletons are tracked

for j=1:200
        if(any(metaDataDepth(j).IsSkeletonTracked == 1))
            f1=j;
            break;
      
        end
    
end
f3=200;
f2=floor((f3+f1)/2);

    
anyPositionsTracked1 = any(metaDataDepth(f1).IsPositionTracked ~= 0);
anySkeletonsTracked1= any(metaDataDepth(f1).IsSkeletonTracked ~= 0);
%To find tracked skeleton numbers
trackedSkeletons1 = find(metaDataDepth(f1).IsSkeletonTracked);
%To extract joint coordinates and indices
jointCoordinates1 = metaDataDepth(f1).JointWorldCoordinates(:, :, trackedSkeletons1);
jointIndices1 = metaDataDepth(f1).JointImageIndices(:, :, trackedSkeletons1);
%Repeat for different frame intervals
anyPositionsTracked2 = any(metaDataDepth(f2).IsPositionTracked ~= 0);
anySkeletonsTracked2 = any(metaDataDepth(f2).IsSkeletonTracked ~= 0);
trackedSkeletons2 = find(metaDataDepth(f2).IsSkeletonTracked);
jointCoordinates2 = metaDataDepth(f2).JointWorldCoordinates(:, :, trackedSkeletons2);
jointIndices2 = metaDataDepth(f2).JointImageIndices(:, :, trackedSkeletons2);
anyPositionsTracked3 = any(metaDataDepth(f3).IsPositionTracked ~= 0);
anySkeletonsTracked3 = any(metaDataDepth(f3).IsSkeletonTracked ~= 0);
trackedSkeletons3 = find(metaDataDepth(f3).IsSkeletonTracked);
jointCoordinates3 = metaDataDepth(f3).JointWorldCoordinates(:, :, trackedSkeletons3);
jointIndices3 = metaDataDepth(f3).JointImageIndices(:, :, trackedSkeletons3);
%Initializing nSkeleton for total number of skeletons
nSkeleton1 = length(trackedSkeletons1);
nSkeleton2 = length(trackedSkeletons2);
nSkeleton3 = length(trackedSkeletons3);

%Extracting RGB images from camera







image1 = frameDataColor(:, :, :, f1);
imshow(image1, 'Parent', handles.axes1);
hold(handles.axes1)
 for i = 3:11
     
     if nSkeleton1 > 0
         X1 = [jointIndices1(SkeletonConnectionMap(i,1),1,1) jointIndices1(SkeletonConnectionMap(i,2),1,1)];
         Y1 = [jointIndices1(SkeletonConnectionMap(i,1),2,1) jointIndices1(SkeletonConnectionMap(i,2),2,1)];
         line(X1,Y1, 'LineWidth', 1, 'LineStyle', '-', 'Marker','+' , 'Color', 'b');
     end
     if nSkeleton1 > 1
         X2 = [jointIndices1(SkeletonConnectionMap(i,1),1,2) jointIndices1(SkeletonConnectionMap(i,2),1,2)];
         Y2 = [jointIndices1(SkeletonConnectionMap(i,1),2,2) jointIndices1(SkeletonConnectionMap(i,2),2,2)];     
         line(X2,Y2, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
     end
 end
 hold off
image2 = frameDataColor(:, :, :, f2);
imshow(image2, 'Parent', handles.axes8);
hold(handles.axes8)
 for i = 3:11
     
     if nSkeleton2 > 0
         X1 = [jointIndices2(SkeletonConnectionMap(i,1),1,1) jointIndices2(SkeletonConnectionMap(i,2),1,1)];
         Y1 = [jointIndices2(SkeletonConnectionMap(i,1),2,1) jointIndices2(SkeletonConnectionMap(i,2),2,1)];
         line(X1,Y1, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
     end
     if nSkeleton2 > 1
         X2 = [jointIndices2(SkeletonConnectionMap(i,1),1,2) jointIndices2(SkeletonConnectionMap(i,2),1,2)];
         Y2 = [jointIndices2(SkeletonConnectionMap(i,1),2,2) jointIndices2(SkeletonConnectionMap(i,2),2,2)];     
         line(X2,Y2, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
     end
 end
 
image3 = frameDataColor(:, :, :, f3);
imshow(image3, 'Parent', handles.axes9);
hold(handles.axes9)
  for i = 3:11
     
     if nSkeleton3 > 0
         X1 = [jointIndices3(SkeletonConnectionMap(i,1),1,1) jointIndices3(SkeletonConnectionMap(i,2),1,1)];
         Y1 = [jointIndices3(SkeletonConnectionMap(i,1),2,1) jointIndices3(SkeletonConnectionMap(i,2),2,1)];
         line(X1,Y1, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'r');
     end
     if nSkeleton3 > 1
         X2 = [jointIndices3(SkeletonConnectionMap(i,1),1,2) jointIndices3(SkeletonConnectionMap(i,2),1,2)];
         Y2 = [jointIndices3(SkeletonConnectionMap(i,1),2,2) jointIndices3(SkeletonConnectionMap(i,2),2,2)];     
         line(X2,Y2, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
     end
  end
  
  
  
  
  
  
  
  

  
  a=ones(480,640);
  imshow(a, 'Parent', handles.axes11);
 

  for i = 3:11
     
     if nSkeleton1 > 0
         X1 = [jointIndices1(SkeletonConnectionMap(i,1),1,1) jointIndices1(SkeletonConnectionMap(i,2),1,1)];
         Y1 = [jointIndices1(SkeletonConnectionMap(i,1),2,1) jointIndices1(SkeletonConnectionMap(i,2),2,1)];
         line(X1,Y1, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'black');
     end
     if nSkeleton1 > 1
         X2 = [jointIndices1(SkeletonConnectionMap(i,1),1,2) jointIndices1(SkeletonConnectionMap(i,2),1,2)];
         Y2 = [jointIndices1(SkeletonConnectionMap(i,1),2,2) jointIndices1(SkeletonConnectionMap(i,2),2,2)];     
         line(X2,Y2, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
     end
 end
 
  for i = 3:11
     
     if nSkeleton2 > 0
         X1 = [jointIndices2(SkeletonConnectionMap(i,1),1,1) jointIndices2(SkeletonConnectionMap(i,2),1,1)];
         Y1 = [jointIndices2(SkeletonConnectionMap(i,1),2,1) jointIndices2(SkeletonConnectionMap(i,2),2,1)];
         line(X1,Y1, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'black');
     end
     if nSkeleton2 > 1
         X2 = [jointIndices2(SkeletonConnectionMap(i,1),1,2) jointIndices2(SkeletonConnectionMap(i,2),1,2)];
         Y2 = [jointIndices2(SkeletonConnectionMap(i,1),2,2) jointIndices2(SkeletonConnectionMap(i,2),2,2)];     
         line(X2,Y2, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
     end
  end
 
% img=getframe(gca);
% 
%  im=frame2im(img);
%  BW=im2bw(im);
% 
%  
% 
% s=[481,641];
% [R,C]=ind2sub(s,find(~BW));
% x1=[min(C),max(R)];
% x2=[max(C),max(R)];
% x3=[min(C),min(R)];
% x4=[max(C),min(R)];
% pos=[x3,(x2(1)-x1(1)),(x1(2)-x3(2))];
% rectangle('Position',pos);
% f=imcrop(BW,pos);
% final=imresize(f,[500 350]);
%  imshow(final, 'Parent', handles.axes11);

 A=jointCoordinates1;
 B=jointCoordinates2;    
 C=jointCoordinates3;
 xlswrite('C:\Users\Suraj\OneDrive\Documents\8th Sem\Live Demo Test Data\test1.xls',A,1);
  xlswrite('C:\Users\Suraj\OneDrive\Documents\8th Sem\Live Demo Test Data\test1.xls',B,2);
 xlswrite('C:\Users\Suraj\OneDrive\Documents\8th Sem\Live Demo Test Data\test1.xls',C,3);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
set(handles.text2, 'String', 'SVM initiated');
global y;
TrainedSVM;
if (y==1)
    set(handles.text1, 'String', '"Hello" has been identified');
   [w fs]=audioread('hello.wav');
player=audioplayer(w,fs);
play(player)
playblocking(player)
end
if (y==2)
    set(handles.text1, 'String', '"Welcome" has been identified');
    [w fs]=audioread('welcome.wav');
player=audioplayer(w,fs);
play(player)
playblocking(player)
end
if (y==3)
    set(handles.text1, 'String', '"Good" has been identified');
[w fs]=audioread('good.wav');
player=audioplayer(w,fs);
play(player)
playblocking(player)
end
    
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
