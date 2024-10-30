
clear all;
close all;
clc;

num=[1800];
den=[1*10^-8 6*10^-05 0.0725 0]*pi;
sys=tf(num,den);

ampli=54 ;

step(ampli*sys,1.5);