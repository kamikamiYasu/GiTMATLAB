simulationIntegral = struct('name',[],'integralvalue',[],'theoreticalvalue',[],'ratio',[]);
[plotdatarow,plotdatacol] = size(plotDataTable);
for i = 2:plotdatacol
     simulationIntegral(i-1).name = matrixstruct(i-1).name;
    simulationIntegral(i-1).integralvalue = trapz(0.01,plotDataTable{:,i});
    simulationIntegral(i-1).theoreticalvalue = trapz(0.01,plotIdealTable{:,i});
    simulationIntegral(i-1).ratio = simulationIntegral(i-1).integralvalue / simulationIntegral(i-1).theoreticalvalue;
end
