simulationIntegral = struct('name',[],'integralvalue',[]);
[plotdatarow,plotdatacol] = size(plotDataTable);
for i = 2:plotdatacol
     simulationIntegral(i-1).name = matrixstruct(i-1).name;
    simulationIntegral(i-1).integralvalue = trapz(0.01,plotDataTable{:,i})
end
