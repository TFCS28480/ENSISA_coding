clear all; close all; clc;

num=1800 ;
den=[1e-08 6e-05 0.0725 0] ;
sys=tf(num,den) ;

amplitude = 4 ;
freq = 0.01 ;

t = 0:0.1:100 ;
u = amplitude*sin(2*3.14*freq*t) ; 
lsim(sys,u,t) ;