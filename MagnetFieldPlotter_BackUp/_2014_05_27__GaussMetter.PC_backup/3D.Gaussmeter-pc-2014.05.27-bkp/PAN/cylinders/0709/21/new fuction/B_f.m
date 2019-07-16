close all;
clear all;
clc;
load('21-1-new.mat');
B_1=f;
load('21-1-old.mat');
B_2=f;

figure(1)
plot(B_1,'-r')
hold on;
plot(B_2,'-b')
