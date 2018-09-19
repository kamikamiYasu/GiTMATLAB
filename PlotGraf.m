inputData = plotDataTable2
hold on 
xlabel('$$\varepsilon$$','Interpreter','Latex','FontSize',36);
ylabel('$$R_{sec}$$','Interpreter', 'Latex','FontSize',36);
[row,col] = size(inputData);
    plot(inputData{:,1},inputData{:,2:col},'-');
    legend(inputData.Properties.VariableNames{2:col});

hold off