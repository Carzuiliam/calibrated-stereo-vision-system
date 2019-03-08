%==========================================================================
%                             CREATE DATASET
% 
%   This scriptis responsible for create the webcam dataset (in order to
% calibrate the system).
%==========================================================================

function datasetStatus = createDataset(lCamera, rCamera, numFeatures)

%   Setups the webcams.
try    
    lCam = videoinput('winvideo', lCamera);
    rCam = videoinput('winvideo', rCamera);
catch    
    datasetStatus = 1;
    return;
end

inputStream = strcat( ...
    'Put the checkboard in front of the cameras ', ...
    'and press OK when you are ready.' ...
);
waitfor(msgbox(inputStream));

%   Extracts a set of checkboard images using the webcams.
for i = 1:numFeatures
    
    lSnap = getsnapshot(lCam);
    rSnap = getsnapshot(rCam);

    imageL = sprintf('calibration/lData/%d.jpg', i);
    imageR = sprintf('calibration/rData/%d.jpg', i);

    imwrite(lSnap, imageL, 'jpg');
    imwrite(rSnap, imageR, 'jpg');

    if i ~= numFeatures        
        inputStream = strcat( ...
            'Got the feature number', i ,'. Please, change the ', ...
            'checkboard position and press OK when you are ready.' ...
        );
        waitfor(msgbox(inputStream));
    end
    
end

%   Returns the calibration status.
datasetStatus = 0;

%   Ends the script.
end