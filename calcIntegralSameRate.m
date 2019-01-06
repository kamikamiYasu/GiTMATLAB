%用いる符号がすべて同じレートの場合、theoreticalvalueは固定されたテーブルとなる
function ratevalue = calcIntegralSameRate(usematrix,DataTable,theoval,IdealTable)

simulationIntegral = struct('name',[],'codelength',[],'integralvalue',[],'theoreticalvalue',[],'idealcalvalue',[],'inte_theoratio',[],'inte_idealratio',[]);
[~,plotdatacol] = size(DataTable);
for i = 2:plotdatacol
    simulationIntegral(i-1).name = cell2mat(DataTable.Properties.VariableNames(2));
    simulationIntegral(i-1).integralvalue = trapz(0.01,DataTable{:,i});
    simulationIntegral(i-1).theoreticalvalue = trapz(0.01,theoval{:,3});
    simulationIntegral(i-1).idealcalvalue = trapz(0.01,IdealTable{:,i});
    simulationIntegral(i-1).inte_theoratio = simulationIntegral(i-1).integralvalue / simulationIntegral(i-1).theoreticalvalue;
    simulationIntegral(i-1).inte_idealratio = simulationIntegral(i-1).integralvalue / simulationIntegral(i-1).idealcalvalue;
end
for i = 1:length(usematrix)
simulationIntegral(i).codelength = length(usematrix(i).matrix)
end
ratevalue = simulationIntegral;
end
