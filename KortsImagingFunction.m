%Andrew Korts
%Imaging Function
%The goal of this project is to combine many of the latter parts of the
%Rochester OPT261 curriculum. This code will allow the user to define a lens.
%Assuming the system is diffraction limited, the user will create a spreadsheet
%with coordinates that define a source plane (point sources with respective
%irradiances. The code will take all of this information and, using a systems approach,
%and point spread functions, create an array of plots relating to the detector plane.

%A goal for an expansion of this project would allow the user to upload an
%image, scan that image, and display it's resultant image in the detector
%plane.

%Inputs
%The inputs for this program are going to be a selection variable that
%determines what type of system you are trying to analyze (2D/3D, 
%sourcetoobservation/obsvervationtosource. The other thing that you will be
%required to input is a spreadsheet outlining the points in your system
%and their relative intensities.

function KortsImagingFunction(system, file)
data = xlsxread(file);

%2D System
if (strcmp("2D", system) == 1)
%     data = xlsread('inputs.xlsx'); %read in spreadsheet
    numPointsX = height(data); %number of coordinate points
    apf = apfRound(data, "2D"); %Defines aperture field
    
    for (i = 1:numPointsX)
       xCoords(i) = data(i, 1);
       irrad(i) = data(i, 2);
    end

elseif (strcmp("3D", system) == 1)
%     data = xlsread('inputs.xlsx'); %read in spreadsheet
    numPointsX = length(data); %number of coordinate points
    
    for (ij = 1:numPointsX)
        xCoords(i) = data(i,
    end
end
end

% end