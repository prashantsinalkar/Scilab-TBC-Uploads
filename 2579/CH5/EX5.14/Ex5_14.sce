//Ex:5.14
clc;
clear;
close;
f=4000;// frequency in MHz
d=384000;// distance in km
Lp=32.45+20*log(f)/log(10)+20*log(d)/log(10);// path loss in dB
printf("The path loss = %f dB", Lp);