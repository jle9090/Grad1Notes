%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW1 PRN GENERATOR

clc; clear; close all

% Load both G1 and G2 shift registers with all 1s
G1 = ones(1,10);
G2 = ones(1,10);

% Calcualate first bit output, then perform corresponding bit shifts
% for PRN19

XGiCA_code = zeros(1,1023);

for i = 1:1023
    % Phase Selector
    S1 = G2(3);
    S2 = G2(6);
    G2i = mod(S1+S2,2);
    
    %CA Code output
    XGiCA_code(i) = mod(G1(10)+G2i,2);

    % G1:
    G1_newBit = mod(G1(3)+G1(10),2);
    G1 = [G1_newBit G1(1:9)];
    
    % G2:
    G2_newBit = mod(G2(2)+G2(3)+G2(6)+G2(8)+G2(9)+G2(10),2);
    G2 = [G2_newBit G2(1:9)];
end

% Obtain first and last 16 bits
first16 = XGiCA_code(1:16);
last16 = XGiCA_code(end-15:end);

%Convert to hex for checking
firstHex = dec2hex(bin2dec(char(first16 + '0')), 4)
lastHex  = dec2hex(bin2dec(char(last16 + '0')), 4)