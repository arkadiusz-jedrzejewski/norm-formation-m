clearvars; clc; close all;

subplot(1,4,4)
Q=[1.001:0.05:8 8];
plot_diagram_kq(Q)
xlim([min(Q) max(Q)])