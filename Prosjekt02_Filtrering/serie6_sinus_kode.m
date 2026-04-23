% Pumpe vann (med luftbobler) inn og ut av ballong som en sinus-strømning
clear; close all
load('Serie6_SinusStoy_u20.mat')
q = Lys;       % volumstrøm inn og ut av ballong [cl/s]
%fjerner DC-komponent og får signalet til å svinge rundt omkring 0.
q = q(95:end);
t = t(95:end);
t= t-t(1);
q = q-mean(q);
%Velger knekkfrekvens for lavpassfilter
fc = 0.5; % Hz
fmax = 20; % 20Hz
%Beregn Nyquist
Ts = mean(diff(t));
Fs = 1/Ts;
fN = Fs/2;

% Beregner tau ut fra ønsket fc. 
tau = 1/(2*pi*fc);

y(1) = q(1);
%lavpassfiltrering
N = length(t);  % antall målinger
for k = 2:N
    Ts = t(k) - t(k-1);
    alfa = 1 - exp(-Ts/tau);
    y(k) = (1-alfa)*y(k-1) + alfa*q(k);
end
% FrekvensSpekter(t, y, title='$\{y_k\}$', fmax=fmax)
% title('Frekvensspekter av filtrert signal y')
% legend('Lavpassfiltrert signal')
% xlabel('Frekvens [Hz]')
% ylabel('Amplitude')
% Beregningen av parametervektorene B og A til et 
% første ordens lavpassfilter baserer seg på 
% gjennomsnittet av samplingstiden Ts
Ts = mean(diff(t));
tau = 1/(2*pi*fc);
alfa = 1 - exp(-Ts/tau);
B = alfa;
A = [1, -(1-alfa)];

IIRfilter(t, q, B, A, fmax=fmax, fc=fc) 







% FrekvensSpekter(t, q, fmax=fmax, fc=fc)
% title('Frekvensspekter av rå-signal q')
% legend('Rå-signal')
% xlabel('Frekvens [Hz]')
% ylabel('Amplitude')


% subplot(2, 1, 1)
% plot(t, q, 'b')
% title('Rå-signal')
% xlabel('Tid [S]')
% ylabel('Volumstrøm q [cl/c]')
% legend('Rå-signal')
% xlim([0 13])
% 
% hold on 
% subplot(2,1,2)
% plot(t,y, 'r')
% title('Lavpassfiltrert signal')
% xlabel('Tid [S]')
% ylabel('Volumstrøm q [cl/s]')
% legend('Lavpassfiltrert signal')
% xlim([0 13])


