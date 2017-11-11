%==========================================================================
%                        CREATE MINORU DATASET
%==========================================================================

function error = createMinoruDataset(LEFT_CAM, RHGT_CAM, NUM_FEATURES)

% Setup the webcams -------------------------------------------------------
try 
    lCam = videoinput('winvideo', LEFT_CAM);
    rCam = videoinput('winvideo', RHGT_CAM);
catch    
    error = 1;
    return;
end

waitfor(msgbox(['Please, put the checkboard in front of the cameras ' ...
                'and press OK when you are ready.']));

% Extract a set of checkboard images using the cameras --------------------
for i = 1:NUM_FEATURES
    
    lSnap = getsnapshot(lCam);
    rSnap = getsnapshot(rCam);

    imageL = sprintf('calibration/lData/%d.jpg', i);
    imageR = sprintf('calibration/rData/%d.jpg', i);

    imwrite(lSnap, imageL, 'jpg');
    imwrite(rSnap, imageR, 'jpg');

    if i ~= NUM_FEATURES
        imageM = sprintf(['I got the feature number %d. Please, change ' ...
                          'the checkboard position and click OK.'], i);
        waitfor(msgbox(imageM));
    end
    
end

% Function status ---------------------------------------------------------
error = 0;
    
end