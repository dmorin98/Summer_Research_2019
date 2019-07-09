close all;
clear all;
clc;
load('27-1.mat');
B_1=f;
load('27-2.mat');
B_2=f;
load('27-3.mat');
B_3=f;
load('27-4.mat');
B_4=f;
figure(1)
plot(B_1,'-r')
hold on;
plot(B_2,'-b')
hold on;
plot(B_3,'-g')
hold on;
plot(B_4,'-k')
grid on;