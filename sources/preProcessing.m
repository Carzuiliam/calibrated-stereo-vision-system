%==========================================================================
%                             PRE-PROCESSING
%   This script does a pre-processing in the input images. actually, it
% justs do a grayscale conversion (maybe one day I'll add more things, if
% needed).
%==========================================================================

function [lSnap, rSnap] = preProcessing(lSnap, rSnap)

%   Converting to grayscale.
lSnap = rgb2gray(lSnap);
rSnap = rgb2gray(rSnap);

%   Ends the script.
end