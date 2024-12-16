% Simulation parameters
numBits = 20000
modOrder = 16  % for 16-QAM

% Create source bit sequence
srcBits = randi([0,1],numBits,1);

modOut = qammod(srcBits,modOrder,"InputType","bit","UnitAveragePower",true)

SNR=15
chanOut=awgn(modOut,SNR)
scatterplot(chanOut)
demodOut=qamdemod(chanOut,modOrder,"OutputType","bit","UnitAveragePower",true)
check = isequal(srcBits,demodOut)
