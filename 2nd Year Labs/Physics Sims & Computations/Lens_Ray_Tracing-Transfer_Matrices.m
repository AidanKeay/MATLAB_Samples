clear variables;

r1 = [3;0]; %input object height of 3cm and angle 0.
s1 = [1 15; 0 1]; %Fixed object distance of 15cm

T1 = [1 0; -1/18 1]; %f = 10 (converging lens)
T2 = [1 0; -1/-1.5 1]; %f = -1.5 (diverging lens)

for i=1:51;
    q(i)=(i-1)*10/50; %formula for converting for loop integer to 0.2cm steps
    s2=[1 q(i);0 1]; %form matrix with variable if for varying image distances.
    s3=[1 5+q(i);0 1];
    r3=s3*T2*s2*T1*s1*r1; %multiply together with r1 to get output matrix r2.
    %multiply the new image properties by the transformation through the new lens
    Mag(i)=r3(1)/3; %magnification value
end
plot(q,Mag,'o');






