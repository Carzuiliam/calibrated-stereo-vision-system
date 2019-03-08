%==========================================================================
%                           FIX PIXEL SHIFTING
%
%   This script shifts horizontally a pair of stereo images in order to
% makes the disparity generation more smooth.
%==========================================================================

function [fxdLImage, fxdRImage] = fixPixelShifting(lImage, rImage, shiftVal)

%   Initializes the necessary values.
[frmHeight, frmWidth] = size(lImage);

fxdLImage = lImage;
fxdRImage = rImage;

%   Fixes the pixel shifting inside the stereo pair, if the shift is
% positive.
if shiftVal > 0

    %   First, shifts the left image...
    for i = 1 : frmHeight
        for j = 1 : frmWidth - shiftVal - 1
           fxdLImage(i, frmWidth - j) = ...
               lImage(i, frmWidth - j - shiftVal); 
        end
    end

    %   Then, the right image.
    for i = 1 : frmHeight
        for j = 1 : frmWidth - shiftVal
           fxdRImage(i, j) = rImage(i, j + shiftVal); 
        end
    end

end

%   Fixes the pixel shifting inside the stereo pair, if the shift is
% negative.   
if shiftVal < 0

    %   First, shifts the left image...
    for i = 1 : frmHeight
        for j = 1 : frmWidth + shiftVal
           fxdLImage(i, j) = lImage(i, j - shiftVal); 
        end
    end

    %   Then, the right image.
    for i = 1 : frmHeight
        for j = 1 : frmWidth + shiftVal - 1
           fxdRImage(i, frmWidth - j) = ...
               rImage(i, frmWidth - j + shiftVal); 
        end
    end

end

%   Ends the script.
end