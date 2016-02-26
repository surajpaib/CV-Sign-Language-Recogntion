colorVid = videoinput('kinect',1);
depthVid = videoinput('kinect',2);
triggerconfig([colorVid depthVid],'manual');

set([colorVid depthVid], 'FramesPerTrigger', 200);
depthSrc = getselectedsource(depthVid);
set(depthSrc, 'TrackingMode', 'Skeleton');
set(depthSrc, 'BodyPosture', 'Seated');

colorVid.FramesPerTrigger = 200;
depthVid.FramesPerTrigger = 200;

