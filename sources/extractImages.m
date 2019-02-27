%==========================================================================
%                             EXTRACT IMAGES
% 
%   This script is reponsible for snap images from a scene using the web-
% cams.
%==========================================================================

function [lSnap, rSnap, imagesStatus] = extractImages(LEFT_CAM, RGHT_CAM)

%   Starts the webcams.
try 
    lCam = videoinput('winvideo', LEFT_CAM);
    rCam = videoinput('winvideo', RGHT_CAM);
catch
    imagesStatus = 1;
    return;
end

%   Gets a snapshot from a scene using the webcam.
lSnap = getsnapshot(lCam);
rSnap = getsnapshot(rCam);

%   Finally, returns the capture status.
imagesStatus = 0;

%   Ends the script.
end