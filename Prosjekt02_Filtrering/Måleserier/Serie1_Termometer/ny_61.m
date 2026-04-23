% Måling av temperatur med termometer
clear; close all
load('Serie1_Sprang.mat')
T = Lys;  % temperatur i det kalde og varme vannet

Ts = 0.007;  

% Original tidsvektor
t = 0:Ts:(length(T)-1)*Ts;

u = T; % inputsignal u(k) = målt temperatur

tau = 7;   % tidskonstant fra YouTube

% --- FORLENG TIDSAKSEN ---
t_end = 40;                     % simuler til 40 sekunder
t_long = 0:Ts:t_end;            % ny tidsvektor

% --- FORLENG INPUTSIGNAL ---
% Etter siste måling holder vi temperaturen konstant
u_long = [u, u(end)*ones(1, length(t_long)-length(u))];

% --- LAVPASSFILTER ---
y_long = zeros(size(t_long));
y_long(1) = u_long(1);

for k = 2:length(t_long)
    alfa = 1 - exp(-Ts/tau);
    y_long(k) = (1-alfa)*y_long(k-1) + alfa*u_long(k);
end

% --- PLOTT ---
figure;
plot(t_long, u_long, 'b'); hold on;
plot(t_long, y_long, 'r', 'LineWidth', 1.5);

title('Lavpassfiltrert temperatursprang (forlenget simulering)')
xlabel('Tid [s]')
ylabel('Temperatur [°C]')
legend('Målt temperatur (u)', 'Filtrert modell (y)', 'Location', 'best')
grid on
xlim([0 t_end])
