%% Simulate data over a range of supply voltages

supplyarray = 0.70:0.01:1;
delayarray = zeros(size(supplyarray));
energyarray = zeros(size(supplyarray));
DCpowerarray = zeros(size(supplyarray));

displayOn = 1;
for j=1:numel(supplyarray)
    supply = supplyarray(j);
    Adder16b;
    delayarray(j) = delay;
    energyarray(j) = SwitchingEnergyWC;
    DCpowerarray(j) = DCpower;
end

%% Generate LaTeX document

homepath = pwd;
cd doc/figures
system('pdflatex Brent-Kung_tex.tex');
cd ..
system('pdflatex Template_report.tex');
cd(homepath)

if min(delayarray) > 650e-12
    display('Warning, your project does not yet meet')
    display('the requirements in terms of speed')
else
    v_650ps = interp1(delayarray, supplyarray, 650e-12);
    e_650ps = interp1(supplyarray, energyarray, v_650ps);
    p_650ps = interp1(supplyarray, DCpowerarray, v_650ps);
    display(' ')
    display(' ')
    display(' ')
    display(' ')
    display(['Your project has supply voltage of ', num2str(v_650ps), ' V,'])
    display(['a worst case switching energy of ', num2str(e_650ps*1e15), ' fJ,'])
    display(['and a DC power consumption of ', num2str(p_650ps*1e9), ' nW.'])
    display(' ')
    display('Please add this to your report')
end

close all

figure(1)
plot(delayarray.*1e9,energyarray.*1e15)
xlabel('Delay [ns]')
ylabel('Switching energy [fJ]')

figure(2)
plot(supplyarray,delayarray.*1e9)
xlabel('Supply voltage [V]')
ylabel('Delay [ns]')

figure(3)
plot(supplyarray,energyarray.*1e15)
xlabel('Supply voltage [V]')
ylabel('Switching energy [fJ]')

figure(4)
plot(supplyarray,DCpowerarray.*1e9)
xlabel('Supply voltage [V]')
ylabel('Standby Power [nW]')
