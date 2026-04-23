close all; clear; clc;

filnavn = { ...
    'forste_mann.mat', ...
    'andre_mann.mat', ...
    'tredje_mann.mat', ...
    'fjerde_mann.mat' ...
};

for i = 1:4
    filename = filnavn{i};
    load(filename)

    T{i}   = t;
    FW{i}  = w_inn;
    FM{i}  = m;
    FMF{i} = m_f;
end
labels = {'Første måling', 'Andre måling', 'Tredje måling',...
    'Fjerde måling'};

figure(1); clf;

subplot(3,1,1); hold on; grid on;
for i = 1:4, plot(T{i}, FW{i}); end
title('Påfyllingsprofiler')
xlabel('Tid [S]')
ylabel('Massestrøm w_inn [g/s]')
xlim([0 10])
legend(labels, Location="best", 'FontSize',12)

subplot(3,1,2); hold on; grid on;
for i = 1:4, plot(T{i}, FM{i}); end
title('Reell vekt')
xlabel('Tid [S]')
ylabel('Masse m [g]')
xlim([0 10])
legend(labels, Location="best")


subplot(3,1,3); hold on; grid on;
for i = 1:4, plot(T{i}, FMF{i}); end
title('Filtrert vekt')
xlabel('Tid[S]')
ylabel('Filtrert masse m\_f [g]')
xlim([0 10])
legend(labels, 'Location','best')

for i = 1:4
    disp("Sjekker: " + filnavn{i})
    S = load(filnavn{i});
    disp(fieldnames(S))
    disp(" ")
end