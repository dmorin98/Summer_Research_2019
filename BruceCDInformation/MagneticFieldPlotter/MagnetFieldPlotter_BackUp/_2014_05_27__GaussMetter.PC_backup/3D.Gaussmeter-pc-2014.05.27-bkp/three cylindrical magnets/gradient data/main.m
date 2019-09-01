clear all
clc
close all
A_20=load('y-20.txt');
A_25=load('y-25.txt');
A_28=load('y-28.txt');
A_30=load('y-30.txt');
A_35=load('y-35.txt');
A_40=load('y-40.txt');

figure(1);
plot(A_20(:,2),A_20(:,4));
grid on;
figure(2);
plot(A_25(:,2),A_25(:,4));
grid on;
figure(3);
plot(A_28(:,2),A_28(:,4));
grid on;
figure(4);
plot(A_30(:,2),A_30(:,4));
grid on;
figure(5);
plot(A_35(:,2),A_35(:,4));
grid on;
figure(6);
plot(A_40(:,2),A_40(:,4));
grid on;