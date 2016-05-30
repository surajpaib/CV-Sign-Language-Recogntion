start([colorVid depthVid]);
trigger([colorVid depthVid]);

[frameDataColor] = getdata(colorVid); 
    [frameDataDepth, timeDataDepth, metaDataDepth] = getdata(depthVid);
