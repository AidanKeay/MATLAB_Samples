clear variables;

n=3; %Wave function order
L=10e-9; %Box width

psi = @(x) sqrt(2/L)*sin((n*pi*x)/L); %Possible wavefunctions equation
density = @(x) (sqrt(2/L)*sin((n*pi*x)/L)).^2; %Probability density 


llim = [0 L/2 0 0 L/2 0]; %Lower limit matrix
uplim = [L/2 L L L/2 L L]; %Upper limit matrix
conj = [0 0 0 1 1 1]; %Boolean matrix for integral type


for i=1:6 %For loop iterations of integrals
    if conj(i)==0 %Determines whether psi or probability density
        eq=psi;
    else
        eq=density;
    end
    a=llim(i); %Gets ith lower limit
    b=uplim(i); %Gets ith upper limit
Integral = quad(eq, a, b); %Integral calculation
results(i)=Integral; %Array of integral results

results(i) %Outputs the ith integral value
end

% z=linspace(0,L,100);
% plot(z,density(z));
