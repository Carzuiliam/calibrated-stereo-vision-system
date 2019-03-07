%==========================================================================
%                         RECTIFICATION METHOD
%
%   This script is responsible to apply a rectification method in the input
% images, in order to allows the disparity map calculation. Since the input
% images are given by a calibrated system, this rectification method uses 
% the calibration parameters as a reference.
%==========================================================================

function [lSnap, rSnap] = rectifyImages(lSnap, rSnap, parms)

% Applying the rectification using the calibration parameters.
pixelShift = -14;
[lSnap, rSnap] = rectifyStereoImages(lSnap, rSnap, parms, 'OutputView', 'full');
[lSnap, rSnap] = fixPixelShifting(lSnap, rSnap, pixelShift);

end