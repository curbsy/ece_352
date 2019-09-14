lp_1k = xlsread('C:\Users\Makenzie\Documents\Labs\ECE 352\Lab3\tek0004ALL.csv');
lp_10k = xlsread('C:\Users\Makenzie\Documents\Labs\ECE 352\Lab3\tek0005ALL.csv');
lp_100 = xlsread('C:\Users\Makenzie\Documents\Labs\ECE 352\Lab3\tek0003ALL.csv');
hp_1k = xlsread('C:\Users\Makenzie\Documents\Labs\ECE 352\Lab3\tek0001ALL.csv');
hp_10k = xlsread('C:\Users\Makenzie\Documents\Labs\ECE 352\Lab3\tek0002ALL.csv');
hp_100 = xlsread('C:\Users\Makenzie\Documents\Labs\ECE 352\Lab3\tek0000ALL.csv');

R1 = 10000;
% f = 10:100000;
% w = 2*pi*f;
% C1 = (1./(j*w*0.01*10^-6));
% Z1 = ((R1*C1)./(R1+C1))+R1;
% Z2 = ((C1*R1)./(R1+C1))+C1;
% H1 = C1./(Z1+C1);
% H2 = R1./(Z2+R1);

k = 1:2000;
f1 = 100;
T1 = 0.3/f1; %duty cycle is To/(T/2)
w1 = 2*pi*f1;
w = k.*w1;
C1 = (1./(j.*w*0.01*10^-6));
Z1 = ((R1.*C1)./(R1+C1))+R1;
Z2 = ((C1.*R1)./(R1+C1))+C1;
H1 = C1./(Z1+C1);
H2 = R1./(Z2+R1);

t = 0:27;
sqw = square(t,60);
X1 = sinc(0.6*k);
Y1 = X1.*H1;
ft1 = ifft(Y1);
figure, subplot(2,1,1);
plot(sqw);
title('Ideal Input Pulse Train to Filter');
xlabel('Time (seconds)');
axis([0 30 -2 2]);
subplot(2,1,2);
plot(1:length(k),ft1);
hold on
plot(-length(k):-1,ft1);
title('Ideal Low-Pass Filter Response for 100Hz Pulse Train');
xlabel('Time (seconds)');

Y2 = X1.*H2;
ft2 = ifft(Y2);
figure, subplot(2,1,1);
plot(sqw);
title('Ideal Input Pulse Train to Filter');
xlabel('Time (seconds)');
axis([0 30 -2 2]);
subplot(2,1,2);
plot(1:length(k),ft2);
hold on
plot(-length(k):-1,ft2);
title('Ideal High-Pass Filter Response for 100Hz Pulse Train');
xlabel('Time (seconds)');


%FREQUENCY = 1000HZ
f2 = 1000;
T2 = 0.3/f2; %duty cycle is To/(T/2)
w2 = 2*pi*f2;
w = k.*w2;
C2 = (1./(j.*k*w2*0.01*10^-6));
Z3 = ((R1.*C2)./(R1+C2))+R1;
Z4 = ((C2.*R1)./(R1+C2))+C2;
H3 = C2./(Z3+C2);
H4 = R1./(Z4+R1);

t = 0:27;
sqw = square(t,60);
X2 = sinc(0.6*k);
Y3 = X2.*H3;
ft3 = ifft(Y3);
figure, subplot(2,1,1);
plot(sqw);
title('Ideal Input Pulse Train to Filter');
xlabel('Time (seconds)');
axis([0 30 -2 2]);
subplot(2,1,2);
plot(1:length(k),ft3);
hold on
plot(-length(k):-1,ft3);
title('Ideal Low-Pass Filter Response for 1kHz Pulse Train');
xlabel('Time (seconds)');

Y4 = X2.*H4;
ft4 = ifft(Y4);
figure, subplot(2,1,1);
plot(sqw);
title('Ideal Input Pulse Train to Filter');
xlabel('Time (seconds)');
axis([0 30 -2 2]);
subplot(2,1,2);
plot(1:length(k),ft4);
hold on
plot(-length(k):-1,ft4);
title('Ideal High-Pass Filter Response for 1kHz Pulse Train');
xlabel('Time (seconds)');

%FREQUENCY = 10kHz
k = 1:2000;
f3 = 10000;
T3 = 0.3/f3; %duty cycle is To/(T/2)
w3 = 2*pi*f3;
w = k.*w3;
C3 = (1./(j.*w3*k*0.01*10^-6));
Z5 = ((R1.*C3)./(R1+C3))+R1;
Z6 = ((C3.*R1)./(R1+C3))+C3;
H5 = C3./(Z5+C3);
H6 = R1./(Z6+R1);

t = 0:27;
sqw = square(t,60);
X3 = sinc(0.6*k);
Y5 = X3.*H5;
ft5 = ifft(Y5);
figure, subplot(2,1,1);
plot(sqw);
title('Ideal Input Pulse Train to Filter');
xlabel('Time (seconds)');
axis([0 30 -2 2]);
subplot(2,1,2);
plot(1:length(k),ft5);
hold on
plot(-length(k):-1,ft5);
title('Ideal Low-Pass Filter Response for 10kHz Pulse Train');
xlabel('Time (seconds)');

Y6 = X3.*H6;
ft6 = ifft(Y6);
figure, subplot(2,1,1);
plot(sqw);
title('Ideal Input Pulse Train to Filter');
xlabel('Time (seconds)');
axis([0 30 -2 2]);
subplot(2,1,2);
plot(1:length(k),ft6);
hold on
plot(-length(k):-1,ft6);
title('Ideal High-Pass Filter Response for 10kHz Pulse Train');
xlabel('Time (seconds)');


% figure, subplot(2,1,1);
% semilogx(f1,mag2db(abs(Y1)));
% title('Bode Diagram For Low-Pass Filter');
% ylabel('Magnitude (dB)');
% subplot(2,1,2);
% a = (180*angle(Y1))/pi;
% semilogx(f1,a);
% ylabel('Phase (deg)');
% xlabel('Frequency (rad/s)');

%HP 100Hz
figure, subplot(2,1,1);
plot(hp_100(14:10013,1),hp_100(14:10013,2));
title('Input Pulse Train to Filter');
xlabel('Time (seconds)');
subplot(2,1,2);
plot(hp_100(14:10013,1),hp_100(14:10013,3));
title('High-Pass Filter Response for 100Hz Pulse Train');
xlabel('Time (seconds)');

%HP 1K Hz
figure, subplot(2,1,1);
plot(hp_1k(14:10013,1),hp_1k(14:10013,2));
title('Input Pulse Train to Filter');
xlabel('Time (seconds)');
subplot(2,1,2);
plot(hp_1k(14:10013,1),hp_1k(14:10013,3));
title('High-Pass Filter Response for 1kHz Pulse Train');
xlabel('Time (seconds)');

%HP 10k Hz
figure, subplot(2,1,1);
plot(hp_10k(14:10013,1),hp_10k(14:10013,2));
title('Input Pulse Train to Filter');
xlabel('Time (seconds)');
subplot(2,1,2);
plot(hp_10k(14:10013,1),hp_10k(14:10013,3));
title('High-Pass Filter Response for 10kHz Pulse Train');
xlabel('Time (seconds)');

%LP 100 Hz
figure, subplot(2,1,1);
plot(lp_100(14:10013,1),lp_100(14:10013,2));
title('Input Pulse Train to Filter');
xlabel('Time (seconds)');
subplot(2,1,2);
plot(lp_100(14:10013,1),lp_100(14:10013,3));
title('Low-Pass Filter Response for 100Hz Pulse Train');
xlabel('Time (seconds)');

%LP 1K Hz
figure, subplot(2,1,1);
plot(lp_1k(14:10013,1),lp_1k(14:10013,2));
title('Input Pulse Train to Filter');
xlabel('Time (seconds)');
subplot(2,1,2);
plot(lp_1k(14:10013,1),lp_1k(14:10013,3));
title('Low-Pass Filter Response for 1kHz Pulse Train');
xlabel('Time (seconds)');

%LP 10k Hz
figure, subplot(2,1,1);
plot(lp_10k(14:10013,1),lp_10k(14:10013,2));
title('Input Pulse Train to Filter');
xlabel('Time (seconds)');
subplot(2,1,2);
plot(lp_10k(14:10013,1),lp_10k(14:10013,3));
title('Low-Pass Filter Response for 10kHz Pulse Train');
xlabel('Time (seconds)');