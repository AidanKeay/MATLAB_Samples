classdef Image
    % Constructs an image object from an input fits file.
    
    properties
        green1=NaN; % 1st green channel.
        red=NaN;  % Red channel.
        blue=NaN;  % Blue channel. 
        green2=NaN; % 2nd green channel.
    end
    
    methods
        function obj = Image(filename, width) 
      
            % Panasonic G7 Bayer Array Format 
            %     1 2 1 2
            %   1 G R G R
            %   2 B G B G
            %   1 G R G R
            %   2 B G B G
           
            img=fitsread(filename);
    
            % Select pixels corresponding to specific channel from
            % bayer array.
            green1channel=img(1:2:end,1:2:end);
            redchannel=img(1:2:end,2:2:end);
            bluechannel=img(2:2:end,1:2:end);
            green2channel=img(2:2:end,2:2:end);
            
            % Assign instantiated channels to respective image channels.
            obj.green1=Channel(green1channel,width);    % odd rows,  odd columns
            obj.red=Channel(redchannel,width);      % odd rows,  even columns
            obj.blue=Channel(bluechannel,width);      % even rows, odd columns
            obj.green2=Channel(green2channel,width);    % even rows, even columns
       
        end
    end
end

