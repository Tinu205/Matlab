
numBits = 32768;  % power of 2, to optimize performance of fft/ifft
modOrder = 16;  % for 16-QAM

srcBits = randi([0,1],numBits,1);
qamModOut = qammod(srcBits,modOrder,"InputType","bit","UnitAveragePower",true);
scatterplot(qamModOut)
title("16-QAM Signal")
