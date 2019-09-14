[y1,fs1] = audioread('C:\Users\Makenzie\Documents\Labs\ECE 352\Lab4\rain_A_siteclip.wav');
[y2,fs2] = audioread('C:\Users\Makenzie\Documents\Labs\ECE 352\Lab4\rain_B_siteclip.wav');
[r1, m_peak1] = CrossCorr(y1(:,1),y1(:,2));
[r2, m_peak2] = CrossCorr(y2(:,1),y2(:,2));
[rs1, cs1] = size(r1);
[rs2, cs2] = size(r2);
c = 331;
S = 1000;
d = 1;
Ts = 1/fs1;
thetaAc = acosd(331.*Ts.*(m_peak1-round(rs1./2))./d);
thetaB = acosd(331.*Ts.*(m_peak2-round(rs2./2))./d);
[a, b] = LegSolver(thetaAc, thetaB, S);
x1 = linspace(-rs1./2.*Ts,rs1./2.*Ts,rs1);
x2 = linspace(-rs2./2.*Ts,rs2./2.*Ts,rs2);

figure;
subplot(2,1,1);
plot(x1,r1);
title('Site A');
xlabel('Seconds');
subplot(2,1,2);
plot(x2,r2);
title('Site B');
xlabel('Seconds');

figure;
subplot(2,1,1);
plot(y1);
title('Site A');
xlabel('Seconds');
subplot(2,1,2);
plot(y2);
title('Site B');
xlabel('Seconds');