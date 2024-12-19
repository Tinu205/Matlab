% Simulation parameters 
numBits = 20000;
modOrder = 16;

% Create source bit sequence and modulate using 16-QAM.
srcBits = randi([0,1],numBits,1);
modOut = qammod(srcBits,modOrder,"InputType","bit","UnitAveragePower",true);

txFilt=comm.RaisedCosineTransmitFilter
rxFilt=comm.RaisedCosineReceiveFilter

txFiltOut=txFilt(modOut)
SNR = 7
chanOut = awgn(txFiltOut,SNR,"measured")
rxFiltOut = rxFilt(chanOut)

if exist("rxFiltOut","var")  % code runs after you complete Task 4
    scatterplot(rxFiltOut)
    demodOut = qamdemod(rxFiltOut,modOrder,"OutputType","bit","UnitAveragePower",true);
end

specAn = dsp.SpectrumAnalyzer(...
    "NumInputPorts",2, ...
    "SpectralAverages",50,...
    "ShowLegend",true);

specAn(txFiltOut,chanOut)

