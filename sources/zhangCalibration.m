%==========================================================================
%                        ZHANG METHOD CALIBRATION
%   This script is responsible for the disparity map generation. It uses
% the Zhang method in order to geenrate the map. Reference:
%
% ZHANG, Z. A Flexible New Technique for Camera Calibration. Pattern Analy-
% sis and Machine Intelligence, v.22, p. 1330-1334, 2000.
%==========================================================================

function [parameters, error] = zhangCalibration(NUM_FEATURES, SQRE_SIZE_MM)

%   Initilizes the needed variables.
lImages = cell(NUM_FEATURES, 1);
rImages = cell(NUM_FEATURES, 1);

%   Loads the dataset and store it in an array...
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

%   ...detects the checkboards and specify the world coordinates...
[imagePoints, boardSize] = detectCheckerboardPoints(lImages, rImages);
worldPoints = generateCheckerboardPoints(boardSize, SQRE_SIZE_MM);

%   ...calibrates the stereo camera system...
parameters = estimateCameraParameters(imagePoints, worldPoints);

%   ...and saves parameters in a file (used in non-calibrations).
save('parameters/parameters.mat', 'parameters');

%   Finally, returns the calibration status.
error = 0;

%   Ends the script.
end