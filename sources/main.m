%==========================================================================
%                             MAIN SCRIPT
% 
%   This is the main script of the project. May be necessary a pair of web-
% cams to make this script works, if you want to use the calibration step.
%==========================================================================

function main

% =========================== PARAMETERS ==================================

%   The webcam's ids. They may change anytime, so be careful.
LEFT_CAM = 3;
RGHT_CAM = 1;

%   '1' if the system will calibrate, '0' otherwise.
USE_CALIBRATION = 0;

%   Num of images to be extracted in order to calibrate the system.
NUM_FEATURES = 30;

%   Size (mm) of the checkboard square shape of the calibration pattern.
SQUARE_SIZE = 30;

% ======================== CALIBRATION (OPTIONAL) =========================

%   Tries to do the calibration using a checkboard (if needed).
if USE_CALIBRATION == 1
    
    %   First, tries to create the dataset...
    datasetStatus = createDataset(LEFT_CAM, RGHT_CAM, NUM_FEATURES);
    
    if datasetStatus == 1
        disp('Cannot find the webcams. The script will end.');
        return;
    else        
        %   ...then, does the calibration...
        [parms, datasetStatus] = zhangCalibration(NUM_FEATURES, SQUARE_SIZE);
        
        %   ...but verifying if there is any errors during the process.
        if datasetStatus == 1
            disp('No dataset found. The script will end.');
            return;
        end        
    end
    
end

% ==================== LOADING CALIBRATION PARAMETERS =====================

%   Tries to load the calibration parameters.
path = fullfile(pwd, 'parameters/parameters.mat');

if exist(path, 'file') == 2
    load(path);
else
    disp('Cannot find the calibration parameters. The script will end.');
    return;
end

% ========================= CAPTURING IMAGES ==============================

%   Captures the images from a scene using the webcams.
[lSnap, rSnap, calResult] = extractImages(LEFT_CAM, RGHT_CAM);

if calResult == 1
    disp('Cannot detect the webcams. The script will end.');
    return;
end

% ========================== RECTIFICATION ================================

%   Pre-processes the input images...
[lSnap, rSnap] = preProcessing(lSnap, rSnap);

%   ...and applies the rectification to them.
[lSnap, rSnap] = rectifyImages(lSnap, rSnap, parms);
    
% ============================ DISPARITY ==================================

%   Generate the disparity map...
[dispMap, dispRang] = disparityMap(lSnap, rSnap);

%   ...and displays it.
figure; 
imshow(dispMap, dispRang); 
title('Disparity Mapfor the Scene');

%   Displays a success message.
disp('The disparity map were generated successfully.');

%   Ends the script.
end
                