%% Setup and run the simulation
clear transientsim
clear acsim
inputfile = 'switchableInverter';
runSpice;

%% Plot the output and calculate the delay
plotsig(transientsim, 'in0,out0');  %The transient simulation is stored in transientsim, make a plot

time        = evalsig(transientsim, 'TIME');
n1          = evalsig(transientsim, 'in0');
n2          = evalsig(transientsim, 'out0');
n1Crossing  = findPositiveZeroCrossings(time, n1 - globals.supply/2); %Calculate the time when the n1 crosses vdd/22
n2Crossing  = findNegativeZeroCrossings(time, n2 - globals.supply/2);

delay = (n2Crossing(2:end-1) - n1Crossing(2:end-1))*1e12;
disp(' ');
disp(strcat(num2str(delay),' ps'))


%% Print the results of the .vec
type(['spicefiles/', inputfile, '.err0'])