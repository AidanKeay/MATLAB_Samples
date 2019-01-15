function [bool] = RangeValidity(start, finish)
%RANGEVALIDITY Checks whether input data selection range is valid.
    if (IsPositiveInteger(start) && IsPositiveInteger(finish) && finish-start >= 0)
        bool = true;
    else 
        bool = false;
    end
end

