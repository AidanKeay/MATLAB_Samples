clear variables;

n=2; %Wave function order
L=10e-9; %Box width

psi = @(x) sqrt(2/L)*sin((n*pi*x)/L); %Possible wavefunctions equation
density = @(x) (sqrt(2/L)*sin((n*pi*x)/L)).^2; %Probability density 
flipdensity = @(x) -((sqrt(2/L)*sin((n*pi*x)/L)).^2); %Probability density flipped

x=linspace(0,L,500); % x linspace values for plot from 0 to L
%plot(x,density(x));

xmin = fminbnd(density, L/4 , (0.75*L)); % Range for minimum
xmax1 = fminbnd(flipdensity, 0 , L/2); %range for 1st max
xmax2 = fminbnd(flipdensity, L/2 , L); %range for 2nd max

