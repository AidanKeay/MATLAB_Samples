clear variables;

run('Initialise_Arduino.m');

% start loop
disp('Starting main loop (it will last 60 secs)');
% loop for 1 minute
tic
dur=10;
while toc/20 < 1
% read current switch 1 values every loop
switch_value1 = a.digitalRead(switch1);
    if(switch_value1 == 1) %if the switch is on
        a.digitalWrite(redLED,1); %light the red LED 
        pause(dur); %light the red LED 
        a.digitalWrite(yellowLED,1);
        pause(dur/5)
        a.digitalWrite(redLED,0); %turn off the red LED 
        a.digitalWrite(yellowLED,0); %turn off the yellow LED 
        a.digitalWrite(greenLED,1); %turn on the green LED 
        pause(dur);
        a.digitalWrite(greenLED,0); %Change to single yellow
        a.digitalWrite(yellowLED,1);
        pause(dur*(3/10));
        a.digitalWrite(yellowLED,0); %Change back to constant red
        a.digitalWrite(redLED,1);
    else
    a.digitalWrite(redLED,0); % if not switch it off
    a.digitalWrite(yellowLED,0); % if not switch it off
    a.digitalWrite(greenLED,0); % if not switch it off
    end
end
% turn everything off
for i=9:11
    a.digitalWrite(i,0); 
end

