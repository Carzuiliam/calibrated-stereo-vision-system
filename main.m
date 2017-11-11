%==========================================================================
%                           MAIN PROCEDURE
%==========================================================================

function main

% Constants: PLEASE VERIFY THE CAMERAS ID. They change everytime. ---------
LEFT_CAM = 3;
RGHT_CAM = 1;

USE_ZHANG_CL =  0;
NUM_FEATURES = 30;          % Num of images to be extracted
SQRE_SIZE_MM = 30;          % Size of the checkboard square shape (mm)

% ============================== CALIBRATION ==============================

% Try calibrate if needed -------------------------------------------------
if USE_ZHANG_CL == 1
    
    error = createMinoruDataset(LEFT_CAM, RGHT_CAM, NUM_FEATURES);
    
    if error == 1
        % Can't find the webcams
        disp('I could not detect your webcams! Try again!');
        return;
    else        
        % Apply the Zhang calibration
        [parms, error] = zhangCalibration(NUM_FEATURES, SQRE_SIZE_MM);
        
        if error == 1
            % Can't read data
            disp('You need to generate a dataset first! Try again!');
            return;
        end        
    end
    
end

% ============================= RECTIFICATION =============================

% Read the calibration parameters -----------------------------------------
path = fullfile(pwd, 'parms.mat');

if exist(path, 'file') == 2
    load(path);
else
    disp('You need to calibrate first! Try again!');
    return;
end

% Show projection errors --------------------------------------------------
%figure; showReprojectionErrors(parms);
%figure; showExtrinsics(parms);

% Extract images ----------------------------------------------------------
[lSnap, rSnap, error] = extractImages(LEFT_CAM, RGHT_CAM);
%[lSnap, rSnap, error] = testData;

if error == 1
    disp('I could not detect your webcams! Try again!');
    return;
end

% Pre-processing ----------------------------------------------------------
[lSnap, rSnap] = preProcessing(lSnap, rSnap);

% Rectify images ----------------------------------------------------------
[lSnap, rSnap] = rectifyImages(lSnap, rSnap, parms);
    
% =============================== DISPARITY ===============================

% Generate the disparity map ----------------------------------------------
[dispMap, dispRang] = disparityMap(lSnap, rSnap);

% Display the disparity map -----------------------------------------------
figure; imshow(dispMap, dispRang); title('Final Disparity Map');

end
                