function XGiCA_code = prn_code_gen(S1_chip, S2_chip)
    
% Load both G1 and G2 shift registers with all 1s
G1 = ones(1,10);
G2 = ones(1,10);

% Calcualate first bit output, then perform corresponding bit shifts
% for PRN19

XGiCA_code = zeros(1,1023);

for i = 1:1023
    % Phase Selector as a result from function inputs
    S1 = G2(S1_chip);
    S2 = G2(S2_chip);
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

end