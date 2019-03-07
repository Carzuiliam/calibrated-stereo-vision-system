%==========================================================================
%                             DISPARITY MAP
%
%   This script is responsible for the calculation of the disparity map. It
% returns the produced disparity map (using the SemiGlobal [1] matching me-
% thod) and the range of the values that was used to generate the disparity
% map.
%
% [1] HIRSCHMULLER, H., 2005. Accurate and Efficient Stereo Processing by 
%     Semi-Global Matching and Mutual Information. Proc. of Int. Conference
%     on Computer Vision and Pattern Recognition, v. 2, p. 807-814.
%==========================================================================

function [dispMap, dispRng] = disparityMap(lSnap, rSnap)

%   Defines the disparity range and applies the disparity.
dispRng = [-6 10];
dispMap = disparity(lSnap, rSnap, 'DisparityRange', dispRng);

%   Ends the script.
end