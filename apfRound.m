%Andrew Korts
%KortsImagingFunction Supplementary Script

%This script is meant to serve as a rounding function for determining the
%aperture field size. Using this function ensures that when the aperture is
%plotted, the plot is automatically big enough to include all of the input
%points.


function outputVal = apfRound(inputData, system)
data = xlsread(inputData);
if (strcmp("2D", system) == 1)
%     data = xlsread('inputs.xlsx'); %read in spreadsheet
    greatestValX = findGreatest("X", data); %calibrates script with maximum X value
    numDigits = findNumDigits(greatestValX); %find numdigits @bottom of apfRound script
    roundVal = round(greatestValX, numDigits .* -1); %round to nearest lesser order
    if (roundVal < greatestValX)
        roundVal = roundVal + (10.^(numDigits) .* .5); %adds half of greatest order
    end

elseif (strcmp("3D", system) == 1)
%     data = xlsread('inputs.xlsx'); %read in spreadsheet
    greatestValX = findGreatest("X", data); %calibrates script with maximum X value
    greatestValY = findGreatest("Y", data);
        if (greatestValX > greatestValY) %determines whether x or y axis has greatest value
            greatestVal = greatestValX;
        else
            greatestVal = greatestValY;
        end
    numDigits = findNumDigits(greatestVal); %find numdigits @bottom of apfRound script
    roundVal = round(greatestVal, numDigits .* -1); %round to nearest lesser order
    if (roundVal < greatestVal)
        roundVal = roundVal + (10.^(numDigits) .* .5); %adds half of greatest order
    end
end
    
outputVal = roundVal;
end


function val = findNumDigits(input)
%In order to determine the number of digits in the greatest value of the
%provided coordinates, this function divides that number by 10 until it is
%a single digit integer. The number of divisions it takes to get to this
%point will be the number of digits
if (input < 10) %if greatest value is single digit, rounds to tens place
    numReductions = 1;    
else
    numReductions = 0; %number of divisions of 10
    while (input > 10) 
        input = input ./ 10; %divide current "input" value by 10
        numReductions = numReductions + 1; %increment numReductions
    end
end
val = numReductions; %output number of digits
end
    