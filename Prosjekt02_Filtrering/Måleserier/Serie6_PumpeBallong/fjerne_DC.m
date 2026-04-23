

% Pumpe vann (med luftbobler) inn og ut av ballong som en sinus-strømning
clear; close all
load('Serie6_SinusStoy_u20.mat')
q = Lys;       % volumstrøm inn og ut av ballong [cl/s]

plot(t, q)
legend('Rå-signal med DC-komponent')
xlabel('Tid [s]')
ylabel('Volumstrøm q [cl/s]')

