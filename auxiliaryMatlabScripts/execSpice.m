inputfilestring = strcat(pwd,'/spicefiles/',inputfile,'.sp');
outputdirectory = strcat(pwd,'/spicefiles/');

hspicestring = ['source ~micasusr/design/scripts/hspice_2012.06.rc && export SNPSLMD_LICENSE_FILE=27020@saturn && hspice -i ', inputfilestring, ' -o ', outputdirectory];
result = system(hspicestring);

clear inputfilestring
clear outputdirectory
clear hspicestring
