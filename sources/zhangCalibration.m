%==========================================================================
%                        ZHANG METHOD CALIBRATION
%==========================================================================

function [parameters, error] = zhangCalibration(NUM_FEATURES, SQRE_SIZE_MM)

% Initilizing values ------------------------------------------------------
lImages = cell(NUM_FEATURES, 1);
rImages = cell(NUM_FEATURES, 1);

% Load the dataset and store it in an array -------------------------------
for i = 1:NUM_FEATURES
   
    try 
        lImage = sprintf('calibration/lData/%d.jpg', i);
        rImage = sprintf('calibration/rData/%d.jpg', i);
        
        lImages{i} = lImage;
        rImages{i} = rImage;
    catch
        error = 1;
        return;
    end
    
end

% Detect the checkboards and specify the world coordinates ----------------
[imagePoints, boardSize] = detectCheckerboardPoints(lImages, rImages);
worldPoints = generateCheckerboardPoints(boardSize, SQRE_SIZE_MM);

% Calibrate the stereo camera system --------------------------------------
parameters = estimateCameraParameters(imagePoints, worldPoints);

% Save parameters in a file (used in non-calibrations) --------------------
save('parameters/parameters.mat', 'parameters');

% Function status ---------------------------------------------------------
error = 0;

end