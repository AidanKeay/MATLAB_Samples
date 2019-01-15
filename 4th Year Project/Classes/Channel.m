classdef Channel
    % Constructs a channel object.
    
    properties
        full=[]; % Full image channel.
        center=[]; % Centrally selected region channel.
    end
    
    methods
        function obj = Channel(image, width)
          
            % Image centre coordinate.
            colindex=(size(image,2)/2);
            rowindex=(size(image,1)/2);

            obj.full = image;

            % Custom sized square region at centre of image.
            obj.center = image((rowindex-width):(rowindex+width),(colindex-width):(colindex+width));

        end
    end
end

