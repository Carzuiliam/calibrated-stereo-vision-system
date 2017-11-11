%==========================================================================
%                         RECTIFICATION METHOD
%==========================================================================

function [lSnap, rSnap] = rectifyImages(lSnap, rSnap, parms)

% Applying the rectification using the calibration parameters -------------
pixelShift = -14;
[lSnap, rSnap] = rectifyStereoImages(lSnap, rSnap, parms, 'OutputView', 'full');
[lSnap, rSnap] = fixPixelShifting(lSnap, rSnap, pixelShift);

end