% \\\\\\\\-------- MASTER SCRIPT --------//////// %

% Main script for importing data and running external scripts (m files).
% Image data is imported here and manipulated/plotted in the custom
% scripts section.

clear variables; % Clear all workspace variables from memory.

% IMPORTS
addpath('./Classes');
addpath('./Utilities');
addpath('./Scripts');
addpath('./Data');

% DATA RANGE SELECTION
start = 1; 
finish = 1;
width = 99; % Width of centrally selected pixel region.

channels={};

if (RangeValidity(start, finish) == true)
    
    % Read data and add image objects to an array.
    images = ImageArray('read_noise_1-16000th_capped_ISO-200_', start, finish, width);
    
    % Extract channels from image objects and add to separate columns in cell array.
    channels(:,1) = cellfun(@(x) x.green1.full, images, 'un', 0);   
    channels(:,2) = cellfun(@(x) x.red.full, images, 'un', 0);   
    channels(:,3) = cellfun(@(x) x.blue.full, images, 'un', 0);   
    channels(:,4) = cellfun(@(x) x.green2.full, images, 'un', 0);   
  
    % --- CUSTOM SCRIPTS --- %
       
    run('VerticalFourierTransform.m');
    
    %run('SignalVariance.m');
    %run('SensorDiagonal.m');
       
else

    disp('Selected data range is not valid.')
    
end
   



