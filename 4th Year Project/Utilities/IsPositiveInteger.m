function [bool] = IsPositiveInteger(value)
%ISPOSITIVEINTEGER Returns true if argument is a positive integer.
    if (isreal(value) && value > 0 && floor(value) == value)
        bool = true;
    else
        bool = false;
    end
end

