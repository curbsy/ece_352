[file1, fs] = audioread('C:\Users\Makenzie\Documents\Labs\ECE 352\Lab4\taxi_honk.wav');

x1 = file1(:,1);
x2 = file1(:,2);

[r,m_peak] = crosscorr(file1(:,1),file1(:,2));

figure;
subplot(2,1,1);
plot(r);
subplot(2,1,2);
plot(r((m_peak-200):(m_peak+200)));
%xlabel('Time Shift(ms)');

