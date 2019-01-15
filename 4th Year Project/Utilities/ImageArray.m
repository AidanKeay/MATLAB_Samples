function [imgarray] = ImageArray(name, start, finish, width) 
% Creates an array of images from fits files, defined by start-finish range. 

imagecount = (finish-start+1);
imgarray = cell(1,imagecount);
index = start;

    for i=1:imagecount
        
        % Generate file name.
        filename = char(strcat(name, GenFileNumber(index),'.fit'));
        index = index+1;
        
        % Instantiate image object and add to image cell array at index i.
        imgarray{i} = Image(filename, width);
        
    end
    
end


