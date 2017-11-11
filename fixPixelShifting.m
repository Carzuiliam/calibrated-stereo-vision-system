%==========================================================================
%                         FIX PIXELS SHIFTING
%==========================================================================

function [fxdFrameLeft, ...
          fxdFrameRght] = fixPixelShifting(LEFT_FRM, RGHT_FRM, SHIFT)

% Initializing values -----------------------------------------------------
[frmHeight, frmWidth] = size(LEFT_FRM);

fxdFrameLeft = LEFT_FRM;
fxdFrameRght = RGHT_FRM;

% Start to fix the pixel shifting that occurs inside the images -----------
if SHIFT > 0

    % Shifting left image
    for i = 1 : frmHeight
        for j = 1 : frmWidth - SHIFT - 1
           fxdFrameLeft(i, frmWidth - j) = ...
               LEFT_FRM(i, frmWidth - j - SHIFT); 
        end
    end

    % Shifting right image
    for i = 1 : frmHeight
        for j = 1 : frmWidth - SHIFT
           fxdFrameRght(i, j) = RGHT_FRM(i, j + SHIFT); 
        end
    end

else if SHIFT < 0

        % Shifting left image
        for i = 1 : frmHeight
            for j = 1 : frmWidth + SHIFT
               fxdFrameLeft(i, j) = LEFT_FRM(i, j - SHIFT); 
            end
        end

        % Shifting right image
        for i = 1 : frmHeight
            for j = 1 : frmWidth + SHIFT - 1
               fxdFrameRght(i, frmWidth - j) = ...
                   RGHT_FRM(i, frmWidth - j + SHIFT); 
            end
        end
    
    end

end

end