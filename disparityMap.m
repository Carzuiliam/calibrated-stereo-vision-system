%==========================================================================
%                               DISPARITY MAP
%==========================================================================

function [dispMap, dispRng] = disparityMap(lSnap, rSnap)

% Apply the disparity -----------------------------------------------------
dispRng = [-6 10];

% Apply the disparity -----------------------------------------------------
dispMap = disparity(lSnap, rSnap, 'DisparityRange', dispRng);

end