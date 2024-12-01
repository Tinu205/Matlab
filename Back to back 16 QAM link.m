%Creates a column vector of 20000 rows of 1s and 0s 
srcBits=randi([0,1],20000,1)

modOrder = 16

modOut = qammod(srcBits,modOrder,"InputType","bit")

scatterplot(modOut)

chanOut = modOut

demodOut = qamdemod(chanOut,modOrder,"OutputType","bit")

check = isequal(srcBits,demodOut)

