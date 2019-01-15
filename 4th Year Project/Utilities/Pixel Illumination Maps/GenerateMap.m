function [img] = GenerateMap(w, h, fillpercentage, type)
%Generate pixel maps based on specified type and other parameters.

pfill = fillpercentage / 100;
height = h;
width = w;
pixnum = height * width;

%RANDOM GAUSSIAN BASED ILLUMINATION
if type == "random"
    pixels = zeros([pixnum, 1]); %Initialize pixel column vector of zeros.
    rindex = randperm(pixnum);
 
    %For number of pixels to be filled, assign value of 1 to element at the selected random permutation index.
    for i = 1:pixnum * pfill
        k = rindex(i);
        pixels(k) = 1;
    end
 
    %Convert colvec of pixels to matrix of specified image dimensions.
    img = reshape(pixels, [height, width]);
    count = numel(pixels(pixels == 1));
 
    %Check output fill is same as specified fill percentage.
    ratio = count / pixnum;
    disp(ratio);
end

%CORNER BASED ILLUMINATION - IN PROGRESS
if type == "corner"
    pixels = zeros([pixnum, 1]); %Initialize pixel column vector of zeros.
    pfill = fillpercentage / 100;
 
    %For number of pixels to be filled, assign value of 1 to element at the selected random permutation index.
    for i = 1:pixnum * pfill
        k = rindex(i);
        pixels(k) = 1;
    end
   
 
    %4 arrays one for each corner
    %each array occupies a corner
 
    %Convert colvec of pixels to matrix of specified image dimensions.
    img = reshape(pixels, [height, width]);
    count = numel(pixels(pixels == 1));
 
    %Check output fill is same as specified fill percentage.
    ratio = count / pixnum;
    disp(ratio);
 
end

%CENTER BASED ILLUMINATION
if type == "center"
 
    fillcount = (pfill * pixnum);
 
    matrix = zeros(height, width);
    ratio = (16 / 9);
    qwidth = 1;
    qheight = round(qwidth / ratio);
    qpixcount = qheight * qwidth;
 
    while (qpixcount < fillcount)
        qheight = round(qwidth / ratio);
        qpixcount = qheight * qwidth;
        qwidth = qwidth + 1;
    end
 
    windex = round((width - qwidth) / 2 + 1);
    hindex = round((height - qheight) / 2 + 1);
 
    if fillpercentage == 100
     
        matrix = ones(height, width);
     
    else
        for k = 1:qheight
            for j = 1:qwidth
                matrix(hindex + k, windex + j) = 1;
            end
        end
     
    end
 
    img = matrix;
    I = find(img(:) > 0); %return elements greater than 0
    count = size(I, 1); %height of column vector, i.e. number of elements greater than 0
 
    pixelratio = count / pixnum;
    error = (pixelratio - pfill) * 100;
    errors = [];
    errors = [errors; error];
    disp(max(errors));
 
end

end
