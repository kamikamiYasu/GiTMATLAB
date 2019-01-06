%用いる符号がすべて同じレートの場合、theoreticalvalueは固定されたテーブルとなる
function ratevalue = calcIntegralSameRate(usematrix,plotDataTable,theoreticalvalue,plotIdealTable)

simulationIntegral = struct('name',[],'codelength',[],'integralvalue',[],'theoreticalvalue',[],'idealcalvalue',[],'inte_theoratio',[],'inte_idealratio',[]);
[,plotdatacol] = size(plotDataTable);
for i = 2:plotdatacol
    simulationIntegral(i-1).name = cell2mat(plotDataTable.Properties.VariableNames(2));
    simulationIntegral(i-1).codelength = length(usematrix(i-1).matrix)
    simulationIntegral(i-1).integralvalue = trapz(0.01,plotDataTable{:,i});
    simulationIntegral(i-1).theoreticalvalue = trapz(0.01,theoreticalvalue{:,2});
    simulationIntegral(i-1).idealcalvalue = trapz(0.01,plotIdealTable{:,i});
    simulationIntegral(i-1).inte_theoratio = simulationIntegral(i-1).integralvalue / simulationIntegral(i-1).theoreticalvalue;
    simulationIntegral(i-1).inte_idealratio = simulationIntegral(i-1).integralvalue / simulationIntegral(i-1).idealcalvalue;
end
ratevalue = simulationIntegral;
end
