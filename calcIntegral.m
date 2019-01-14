%それぞれの行列で符号レートが異なるときに用いる
function ratevalue = calcIntegral(DataTable,theoval,IdealTable)

simulationIntegral = struct('name',[],'integralvalue',[],'theoreticalvalue',[],'idealcalvalue',[],'inte_theoratio',[],'inte_idealratio',[]);
[~,plotdatacol] = size(DataTable);
switch plotdatacol
    case 2
        simultationIntegral.name = cell2mat(DataTable.Properties.VariableNames(2));
        simulationIntegral.integralvalue = trapz(0.01,DataTable{:,2});
        simulationIntegral.theoreticalvalue = trapz(0.01,theoval);
        simulationIntegral.idealcalvalue = trapz(0.01,IdealTable);
        simulationIntegral.inte_theoratio = simulationIntegral.integralvalue / simulationIntegral.theoreticalvalue;
        simulationIntegral.inte_idealratio = simulationIntegral.integralvalue / simulationIntegral.idealcalvalue;
        ratevalue = simulationIntegral;
    otherwise
        for i = 2:plotdatacol
             simulationIntegral(i-1).name = cell2mat(DataTable.Properties.VariableNames(i));
            simulationIntegral(i-1).integralvalue = trapz(0.01,DataTable{:,i});
            simulationIntegral(i-1).theoreticalvalue = trapz(0.01,theoval{:,i});
            simulationIntegral(i-1).idealcalvalue = trapz(0.01,IdealTable{:,i});
            simulationIntegral(i-1).inte_theoratio = simulationIntegral(i-1).integralvalue / simulationIntegral(i-1).theoreticalvalue;
            simulationIntegral(i-1).inte_idealratio = simulationIntegral(i-1).integralvalue / simulationIntegral(i-1).idealcalvalue;
        end
        ratevalue = simulationIntegral;
end
end
