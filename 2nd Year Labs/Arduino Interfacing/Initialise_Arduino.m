% create arduino object and connect to board

if exist('a') && isa(a,'arduino') && isvalid(a),
% nothing to do
else
a=arduino('COM4'); % Connect the device to e.g. port COM3
% If COM3 is not available, MATLAB tells you the available ports
end

% initialize pins
disp('Initializing Pins ...');
% label pins
redLED = 9;
yellowLED = 10;
greenLED = 11;
switch1 = 2;
switch2 = 4;
switch3 = 7;
switch4 = 8;
% sets digital input pins
a.pinMode(switch1, 'INPUT');
a.pinMode(switch2, 'INPUT');
a.pinMode(switch3, 'INPUT');
a.pinMode(switch4, 'INPUT');

% sets digital and analog (pwm) output pins
a.pinMode(redLED, 'OUTPUT'); % pwm here
a.pinMode(yellowLED,'OUTPUT'); % pwm here
a.pinMode(greenLED,'OUTPUT'); % pwm here
% analog pin
aPin=0;
% initialize state
state=0;


