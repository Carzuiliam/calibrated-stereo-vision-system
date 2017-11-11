%==========================================================================
%                             EXTRACT IMAGES
%==========================================================================

function [lSnap, rSnap, error] = extractImages(LEFT_CAM, RGHT_CAM)

% Starting Minoru ---------------------------------------------------------
try 
    lCam = videoinput('winvideo', LEFT_CAM);
    rCam = videoinput('winvideo', RGHT_CAM);
catch
    error = 1;
    return;
end

% Generating real time frames ---------------------------------------------
lSnap = getsnapshot(lCam);
rSnap = getsnapshot(rCam);

% Function status ---------------------------------------------------------
error = 0;

end