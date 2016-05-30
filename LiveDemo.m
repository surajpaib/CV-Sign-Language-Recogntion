function varargout = LiveDemo(varargin)
% LIVEDEMO MATLAB code for LiveDemo.fig
%      LIVEDEMO, by itself, creates a new LIVEDEMO or raises the existing
%      singleton*.
%
%      H = LIVEDEMO returns the handle to a new LIVEDEMO or the handle to
%      the existing singleton*.
%
%      LIVEDEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LIVEDEMO.M with the given input arguments.
%
%      LIVEDEMO('Property','Value',...) creates a new LIVEDEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LiveDemo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LiveDemo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LiveDemo

% Last Modified by GUIDE v2.5 12-May-2016 00:39:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LiveDemo_OpeningFcn, ...
                   'gui_OutputFcn',  @LiveDemo_OutputFcn, ...
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


% --- Executes just before LiveDemo is made visible.
function LiveDemo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LiveDemo (see VARARGIN)

% Choose default command line output for LiveDemo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LiveDemo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LiveDemo_OutputFcn(hObject, eventdata, handles) 
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
initialization;
trigger;
handles.metaDataDepth=metaDataDepth;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


metaDataDepth=handles.metaDataDepth;


%Initializing the joint map for the skeleton construction
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

image2 = frameDataColor(:, :, :, f2);

image3 = frameDataColor(:, :, :, f3);

imshow(image1, 'Parent', handles.axes1);
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

imshow(image2, 'Parent', handles.axes5);
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
 

imshow(image3, 'Parent', handles.axes6);
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
 




 



%  Drawing the joints for the skeleton
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
 


 
  for i = 3:11
     
     if nSkeleton3 > 0
         X1 = [jointIndices3(SkeletonConnectionMap(i,1),1,1) jointIndices3(SkeletonConnectionMap(i,2),1,1)];
         Y1 = [jointIndices3(SkeletonConnectionMap(i,1),2,1) jointIndices3(SkeletonConnectionMap(i,2),2,1)];
         line(X1,Y1, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'black');
     end
     if nSkeleton3 > 1
         X2 = [jointIndices3(SkeletonConnectionMap(i,1),1,2) jointIndices3(SkeletonConnectionMap(i,2),1,2)];
         Y2 = [jointIndices3(SkeletonConnectionMap(i,1),2,2) jointIndices3(SkeletonConnectionMap(i,2),2,2)];     
         line(X2,Y2, 'LineWidth', 1, 'LineStyle', '-', 'Marker', '+', 'Color', 'g');
     end
  end
 imshow(image1, 'Parent', handles.axes7);
 
 img=getframe(gca);

 im=frame2im(img);
 BW=im2bw(im);
% figure
%  imshow(BW);
%  
% 
s=[481,641];
[R,C]=ind2sub(s,find(~BW));
x1=[min(C),max(R)];
x2=[max(C),max(R)];
x3=[min(C),min(R)];
x4=[max(C),min(R)];
pos=[x3,(x2(1)-x1(1)),(x1(2)-x3(2))];
rectangle('Position',pos);
f=imcrop(BW,pos);
final=imresize(f,[500 350]);
% imshow(final);
% 
 plot(handles.axis7,final);

% imwrite(final,'C:\Users\Suraj\OneDrive\Documents\8th Sem\Live Demo Test Data\test1.png','png');
 A=jointCoordinates1;
 B=jointCoordinates2;    
 C=jointCoordinates3;
 xlswrite('C:\Users\Suraj\OneDrive\Documents\8th Sem\Live Demo Test Data\test1.xls',A,1);
  xlswrite('C:\Users\Suraj\OneDrive\Documents\8th Sem\Live Demo Test Data\test1.xls',B,2);
 xlswrite('C:\Users\Suraj\OneDrive\Documents\8th Sem\Live Demo Test Data\test1.xls',C,3);


 

 



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
