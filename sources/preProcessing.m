%==========================================================================
%                             PRE-PROCESSING
%
%   This script is responsible for the pre-processing (for now, just an
% greyscale conversion and resizing) for each stereo image.
%
%   (Maybe I'll try new concepts in the future, so stay alert!)
%==========================================================================

function [lSnap, rSnap] = preProcessing(lSnap, rSnap)

%   Converts to grayscale.
lSnap = rgb2gray(lSnap);
rSnap = rgb2gray(rSnap);

%   Ends the script.
end