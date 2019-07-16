clear all
clc
close all
A_20=load('B0-y-20.txt');
A_5=load('B0-y-5.txt');
figure(1);
plot(A_20(:,2),A_20(:,4));
grid on;
figure(2);
plot(A_5(:,2),A_5(:,4));
grid on;