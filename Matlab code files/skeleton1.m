
metaDataDepth;
anyPositionsTracked1 = any(metaDataDepth(60).IsPositionTracked ~= 0);
anySkeletonsTracked1= any(metaDataDepth(60).IsSkeletonTracked ~= 0);
trackedSkeletons1 = find(metaDataDepth(60).IsSkeletonTracked);
jointCoordinates1 = metaDataDepth(60).JointWorldCoordinates(:, :, trackedSkeletons1);
jointIndices1 = metaDataDepth(60).JointImageIndices(:, :, trackedSkeletons1);
anyPositionsTracked2 = any(metaDataDepth(100).IsPositionTracked ~= 0);
anySkeletonsTracked2 = any(metaDataDepth(100).IsSkeletonTracked ~= 0);
trackedSkeletons2 = find(metaDataDepth(100).IsSkeletonTracked);
jointCoordinates2 = metaDataDepth(100).JointWorldCoordinates(:, :, trackedSkeletons2);
jointIndices2 = metaDataDepth(100).JointImageIndices(:, :, trackedSkeletons2);
anyPositionsTracked3 = any(metaDataDepth(145).IsPositionTracked ~= 0);
anySkeletonsTracked3 = any(metaDataDepth(145).IsSkeletonTracked ~= 0);
trackedSkeletons3 = find(metaDataDepth(145).IsSkeletonTracked);
jointCoordinates3 = metaDataDepth(145).JointWorldCoordinates(:, :, trackedSkeletons3);
jointIndices3 = metaDataDepth(145).JointImageIndices(:, :, trackedSkeletons3);

image1 = frameDataColor(:, :, :, 60);

image2 = frameDataColor(:, :, :, 100);

image3 = frameDataColor(:, :, :, 145);
subplot(3,2,1)
imshow(image1);
subplot(3,2,3)
imshow(image2);
subplot(3,2,5)
imshow(image3);
nSkeleton1 = length(trackedSkeletons1);
nSkeleton2 = length(trackedSkeletons2);
nSkeleton3 = length(trackedSkeletons3);

 
subplot(3,2,2)
util_skeletonViewer(jointIndices1, image1, nSkeleton1);
subplot(3,2,4)
util_skeletonViewer(jointIndices2, image2, nSkeleton2);
subplot(3,2,6)
util_skeletonViewer(jointIndices3, image3, nSkeleton3);

