% --- Calculates average Fourier transform down each pixel column  --- %

%FFT down each column for first green channel.
fft = cellfun(@(x) abs(fft(x,[],1)), channels(:,1), 'un', 0); 

%Pixel bin by merging and averaging colunns.
avgfft = cellfun(@(x) mean(x,2), fft, 'un', 0); 

%Transpose to line vector.
fullfft=avgfft{1}';

%Trim off beginning and end values at f near 0.
n=5;
fullfft=fullfft((size(fullfft,2)/2)+n:end-n);

height=size(images{1}.green1.full,1);

pixels=linspace(1+n,height-n, size(fullfft,2));

plot(pixels,fullfft/max(fullfft)); 

title(strcat('Vertical FFT for Green Image Channel'));
xlabel('Spatial Frequency (per pixel)');
ylabel('Relative Signal Amplitude');


