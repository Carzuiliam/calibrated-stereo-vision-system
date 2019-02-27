%==========================================================================
%                             PRE-PROCESSING
%==========================================================================

function [lSnap, rSnap] = preProcessing(lSnap, rSnap)

% Converting to grayscale -------------------------------------------------
lSnap = rgb2gray(lSnap);
rSnap = rgb2gray(rSnap);

end