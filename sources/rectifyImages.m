%==========================================================================
%                         RECTIFICATION METHOD
%
%   This script is responsible to apply a rectification method in the input
% images, in order to allows the disparity map calculation. Since the input
% images are given by a calibrated system, this rectification method uses 
% the calibration parameters as a reference.
%==========================================================================

function [lImage, rImage] = rectifyImages(lImage, rImage, params)

%   Applies the rectification using the calibration parameters.
pixelShift = -14;
[lImage, rImage] = rectifyStereoImages(lImage, rImage, params, 'OutputView', 'full');
[lImage, rImage] = fixPixelShifting(lImage, rImage, pixelShift);

%   Ends the script.
end