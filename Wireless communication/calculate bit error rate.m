% Simulation parameters 
numBits = 20000;
modOrder = 16;
% Create source signal and apply 16-QAM modulation
srcBits = randi([0,1],numBits,1);
modOut = qammod(srcBits,modOrder,"InputType","bit","UnitAveragePower",true);

% Apply AWGN
SNR = 15;  % dB
chanOut = awgn(modOut,SNR);
scatterplot(chanOut)
% Demodulate received signal
demodOut = qamdemod(chanOut,modOrder,"OutputType","bit","UnitAveragePower",true);

%The logical operator ~= (not equal) compares two arrays element-by-element.
isBitError= srcBits~=demodOut
%nnz counts the number of nonzero elements in an array.
numBitErrors=nnz(isBitError)
%Bit error rate calculation
BER = numBitErrors/numBits

