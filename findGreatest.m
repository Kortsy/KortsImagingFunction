%Andrew Korts
%KortsImagingFunction Suplementary Script

%This script reads the data input from KortsImagingFunction and determines
%what the greatest position value is in both the x and y direction. This
%file is meant to give the apfRound function a basis.

function greatest = findGreatest(coord, data)
if (strcmp("X", coord) == 1)
    numPointsX = height(data); %number of rows
    maxVal = abs(data(1, 1));
    for (i = 2:numPointsX)
        val = abs(data(i, 1));
        if (val > maxVal) %compare val and maxVal
            maxVal = val; %sets new max value
        end
    end
    
    greatest = maxVal;

elseif (strcmp("Y", coord) == 1)
    numPointsY = height(data); %number of rows
    maxVal = abs(data(1, 2));
    for (i = 2:numPointsY)
        val = abs(data(i, 2));
        if (val > maxVal) %compare val and maxVal
            maxVal = val; %sets new max value
        end
    end
end
    greatest = maxVal;
end