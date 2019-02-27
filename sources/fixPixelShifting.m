%==========================================================================
%                         FIX PIXELS SHIFTING
%
%   This script shifts horizontally a pair of stereo images in order to
% makes the disparity generation more smooth.
%==========================================================================

function [fxdFrmLeft, fxdFrmRght] = fixPixelShifting(LEFT_FRM, RGHT_FRM, SHIFT)

%   Initializes the necessary values.
[frmHeight, frmWidth] = size(LEFT_FRM);

fxdFrmLeft = LEFT_FRM;
fxdFrmRght = RGHT_FRM;

%   Fixes the pixel shifting inside the stereo pair, if the shift is
% positive.
if SHIFT > 0

    %   First, shifts the left image...
    for i = 1 : frmHeight
        for j = 1 : frmWidth - SHIFT - 1
           fxdFrmLeft(i, frmWidth - j) = ...
               LEFT_FRM(i, frmWidth - j - SHIFT); 
        end
    end

    %   Then, the right image.
    for i = 1 : frmHeight
        for j = 1 : frmWidth - SHIFT
           fxdFrmRght(i, j) = RGHT_FRM(i, j + SHIFT); 
        end
    end

end

%   Fixes the pixel shifting inside the stereo pair, if the shift is
% negative.   
if SHIFT < 0

    %   First, shifts the left image...
    for i = 1 : frmHeight
        for j = 1 : frmWidth + SHIFT
           fxdFrmLeft(i, j) = LEFT_FRM(i, j - SHIFT); 
        end
    end

    %   Then, the right image.
    for i = 1 : frmHeight
        for j = 1 : frmWidth + SHIFT - 1
           fxdFrmRght(i, frmWidth - j) = ...
               RGHT_FRM(i, frmWidth - j + SHIFT); 
        end
    end

end

%   Ends the script.
end