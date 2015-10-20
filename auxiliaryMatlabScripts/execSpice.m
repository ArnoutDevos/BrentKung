inputfilestring = strcat(pwd,'/spicefiles/',inputfile,'.sp');
outputdirectory = strcat(pwd,'/spicefiles/');

hspicestring = ['source ~micasusr/design/scripts/hspice.rc && hspice -i ', inputfilestring, ' -o ', outputdirectory];
result = system(hspicestring);

clear inputfilestring
clear outputdirectory
clear hspicestring
