% Pumpe vann (med luftbobler) inn og ut av ballong som en sinus-strømning
clear; close all
load('Serie6_SinusStoy_u20.mat')
u = Lys;       % volumstrøm inn og ut av ballong [cl/s]
%fjerner DC-komponent og får signalet til å svinge rundt omkring 0.
u = u(95:end);
t = t(95:end);
t= t-t(1);
u = u-mean(u);
%Velger knekkfrekvens for lavpassfilter
fc = 5; % Hz
fmax = 20; % 20Hz
% %Beregn Nyquist
Ts = mean(diff(t));
% Fs = 1/Ts;
% fN = Fs/2;
%
% % Beregner tau ut fra ønsket fc. 
tau = 1/(2*pi*fc);
betta = exp(-Ts/tau);

y(1) = u(1);
y = u;
B = [betta, -betta];
A = [1, -betta];
HoypassFilter(t, y, fc=fc);
FrekvensSpekter(t, y, title='$\{y_k\}$', fmax=fmax)
IIRfilter(t, u, B, A, fmax=fmax, fc=fc)

% N = length(t);  % antall målinger
% for k = 2:N
%     y(k) = betta*y(k-1) + betta*(u(k)-u(k-1));
% end
