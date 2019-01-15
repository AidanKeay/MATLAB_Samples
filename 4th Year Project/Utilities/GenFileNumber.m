function [numout] = GenFileNumber(numin)
%Returns 00xyz string

z=numel(num2str(numin));

    switch(z)
    case 3
        numout = strcat("00",num2str(numin));
    case 2
        numout = strcat("000",num2str(numin));
    case 1
        numout = strcat("0000",num2str(numin));
        
    otherwise
        disp('Invalid File Number')
        
    end
end

