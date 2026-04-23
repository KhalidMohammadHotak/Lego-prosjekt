% Filtrering av pixelstripe fra bilde av Lena
clear; close all
load('Serie2_Bilde.mat')
u = Lys;  % intensitetsprofilen i bilde
t = t-t(1);
fc = 2;
fmax = 20;
tau = 1/(2*pi*fc);
uf1 = LavpassFilter(t, u, fc=fc, IC=u(1));
uf2 = LavpassFilter(t, uf1, fc=fc, IC=u(1));
uf3 = LavpassFilter(t, uf2, fc=fc, IC=u(1));
% subplot(3, 1, 1)
% plot(t, uf1)
% hold on 
% subplot(3,1,2)
% plot(t, uf2)
% hold on
% subplot(3,1,3)
% plot(t,uf3)

plot(t, uf1, t, uf3)

legend( ...
    'Første ordens lavpassfilter', ...
    'Tredje ordens lavpassfilter');
title('Effekten av filterorden: første vs. tredje ordens lavpassfiltrering',...
    FontWeight='normal', FontSize=13 )
xlim([0 18])
xlabel('tid [s]')










