% --- Calculates and plots the variance vs mean. --- %

variance = cellfun(@(x) (std2(x))^2, channels, 'un', 0); 
mean = cellfun(@(x) mean2(x), channels, 'un', 0);

plot(cell2mat(mean),cell2mat(variance));












