%% ASEN 5090 GPS/GNSS
%% Justin Le
%% FALL 2026 MIDTERM SCRIPT PART 3

clc;clear;close all
% constants
c = 3E8;% m/s

rate = 6E6; % Hz

codeA = [-1,-1,-1,-1, 1, 1, 1,-1, 1, 1,-1,-1, 1,-1, 1];
codeB = [-1,-1,-1,-1, 1,-1, 1,-1,-1, 1, 1,-1, 1, 1, 1];

figure()
cyc_corr_basic(codeA, codeA)
exportgraphics(gcf, fullfile('figures', 'Midterm', 'codeA_autocorrelate.png'), 'Resolution', 900);
cyc_corr_basic(codeB, codeB)
exportgraphics(gcf, fullfile('figures', 'Midterm', 'codeB_autocorrelate.png'), 'Resolution', 900);

%b. Correlation of Code A 600 m away

t = 600 * (1/c)
chip_shift = rate*t


% Shift by 12 chips
codeA_12 = codeA([end-11:end 1:end-12]);

figure()
cyc_corr_basic(codeA_12, codeA)
exportgraphics(gcf, fullfile('figures', 'Midterm', 'codeA_autocorrelate_shift12.png'), 'Resolution', 900);


% c. Finding cross correlation
cyc_corr_basic(codeB, codeA)
exportgraphics(gcf, fullfile('figures', 'Midterm', 'cross_correlationAB.png'), 'Resolution', 900);
