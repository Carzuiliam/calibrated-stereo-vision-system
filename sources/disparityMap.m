%==========================================================================
%                             DISPARITY MAP
%
%   This script is responsible for the calculation of the disparity map. It
% returns the produced disparity map (using the SemiGlobal matching method)
% and the range of the values that was used to generate the disparity map. 
% Reference:
%
% HIRSCHMULLER, H., 2005. Accurate and Efficient Stereo Processing by Semi-
% Global Matching and Mutual Information. Proc. of Int. Conference on Com-
% puter Vision and Pattern Recognition, 2, 807-814.
%==========================================================================

function [dispMap, dispRng] = disparityMap(lSnap, rSnap)

%   Defines the disparity range and applies the disparity.
dispRng = [-6 10];
dispMap = disparity(lSnap, rSnap, 'DisparityRange', dispRng);

%   Ends the script.
end