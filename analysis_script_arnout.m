open m2sfiles/simpleInverter.m2s

inputfile = 'simpleInverter';
globals.supply = 0.8;
runSpice
current = evalsig(transientsim,'I_vdd');
time = evalsig(transientsim,'TIME');
plot(time,current)

start = getElementNumber(time,1e-9)
stop = getElementNumber(time,1.4e-9)

energySwitch = trapz(time(start:stop),current(start:stop))

start = getElementNumber(time,4e-10)
stop = getElementNumber(time,10e-10)

energyLeak = trapz(time(start:stop),current(start:stop))