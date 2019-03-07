%==========================================================================
%                             CREATE DATASET
% 
%   This scriptis responsible for create the webcam dataset (in order to
% calibrate the system).
%==========================================================================

function datasetStatus = createDataset(LEFT_CAM, RHGT_CAM, NUM_FEATURES)

%   First, setups the webcams...
try    
    lCam = videoinput('winvideo', LEFT_CAM);
    rCam = videoinput('winvideo', RHGT_CAM);
catch    
    datasetStatus = 1;
    return;
end

inputStream = strcat( ...
    'Put the checkboard in front of the cameras ', ...
    'and press OK when you are ready.' ...
);
waitfor(msgbox(inputStream));

%   Then, extracts a set of checkboard images using the webcams.
for i = 1:NUM_FEATURES
    
    lSnap = getsnapshot(lCam);
    rSnap = getsnapshot(rCam);

    imageL = sprintf('calibration/lData/%d.jpg', i);
    imageR = sprintf('calibration/rData/%d.jpg', i);

    imwrite(lSnap, imageL, 'jpg');
    imwrite(rSnap, imageR, 'jpg');

    if i ~= NUM_FEATURES        
        inputStream = strcat( ...
            'Got the feature number', i ,'. Please, change the ', ...
            'checkboard position and press OK when you are ready.' ...
        );
        waitfor(msgbox(inputStream));
    end
    
end

%   Finally, returns the calibration status.
datasetStatus = 0;

%   Ends the script.
end