%==========================================================================
%                             EXTRACT IMAGES
%
%   This script is responsible for the extraction of the images from a scene
% using a pair of webcams. It's necessary to set the ID of each camera (de-
% fined by the MatLab IDE).
%==========================================================================

function [lSnap, rSnap, imagesStatus] = extractImages(lCamera, rCamera)

%   Starts the webcams.
try 
    lCam = videoinput('winvideo', lCamera);
    rCam = videoinput('winvideo', rCamera);
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