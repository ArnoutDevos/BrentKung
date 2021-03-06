%% Setup and run the simulation
clear transientsim
clear acsim
inputfile = 'simpleNandVec';
runSpice;

%% Plot the output and calculate the delay
plotsig(transientsim, 'in1,in2,out');  %The transient simulation is stored in transientsim, make a plot

time        = evalsig(transientsim, 'TIME');
n1          = evalsig(transientsim, 'in1');
n2          = evalsig(transientsim, 'in2');
n3          = evalsig(transientsim, 'out');
n1Crossing  = findPositiveZeroCrossings(time, n1 - globals.supply/2); %Calculate the time when the n1 crosses vdd/22
n2Crossing  = findPositiveZeroCrossings(time, n2 - globals.supply/2); %Calculate the time when the n1 crosses vdd/22
n3Crossing  = findNegativeZeroCrossings(time, n3 - globals.supply/2);

delay = (n3Crossing(2:end-1) - n1Crossing(2:end-1))*1e12;
disp(' ');
disp(strcat(num2str(delay),' ps'))


%% Print the results of the .vec
type(['spicefiles/', inputfile, '.err0'])
