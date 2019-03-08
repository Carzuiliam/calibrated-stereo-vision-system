%==========================================================================
%                             PRE-PROCESSING
%
%   This script is responsible for the pre-processing (for now, just an
% greyscale conversion and resizing) for each stereo image.
%
%   (Maybe I'll try new concepts in the future, so stay alert!)
%==========================================================================

function [lImage, rImage] = preProcessing(lImage, rImage)

%   Converts to grayscale.
lImage = rgb2gray(lImage);
rImage = rgb2gray(rImage);

%   Ends the script.
end