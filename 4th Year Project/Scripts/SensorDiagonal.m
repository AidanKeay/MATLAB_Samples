% --- Calculates and plots the values along main diagonal.- -- %

dval = cell2mat(cellfun(@(x) diag(x), channels(:,1), 'un', 0));
n = numel(diag(images{1,1}.green1.full)); %Number of pixels on diagonal.
x = linspace(1,n,n); %Diagonal pixel number.
std(dval);
plot(x,dval);
    
title(strcat('Pixel Value Along Main Sensor Diagonal (Green Channel)'));
xlabel('Pixel Number');
ylabel('Pixel Value');
