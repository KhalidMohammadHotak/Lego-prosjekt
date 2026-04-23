% Måling av temperatur med termometer
clear; close all
load('Serie1_Sprang1.mat')
T = Lys;  % temperatur i det kalde og varme vannet

Ts = 0.007;  

%t_slutt = 50 ; %Eksprimentet varte i 50 sekunder

t = 0:Ts:(length(T)-1)*Ts; %Lag tidsvektor som matcher datasett

u = T; % inputsignal u(k) = målt temperatur

tau = 7;

y(1) = u(1); 

N = length(t);

for k = 2 : N
    Ts = t(k) - t (k-1);
    alfa = 1-exp(-Ts/tau);
    y(k) = (1-alfa)*y(k-1) + alfa*u(k);
end 

figure;
plot(t, u, 'b');
hold on;
plot(t, y, 'r');
title(['Lavpassfiltrert temperatursprang, $T_s$ = ' num2str(Ts)], ...
    'Interpreter', 'latex');

xlabel('Tid [s]')
ylabel('Temperatur [°C]');
legend('Sprang $\{u_{k}\}$',...
    ['Flltrert signal $\{y_k\}$, ',...
    '$\alpha${=}',num2str(alfa,3)],...
    'location','best')
xlim([0 max(t)]);

grid on 


