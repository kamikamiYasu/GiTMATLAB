usematrix = matrixstruct;

epsilon = 0:0.05:1;
[epsilonrow,epsiloncol] = size(epsilon);
evalution = zeros(epsilonrow,epsiloncol)';
plotDataTable = array2table(epsilon','VariableNames',{'epsilon'});


for mi = 1:length(struct2cell(usematrix))
    for i = 1:epsiloncol
        evalution(i) = calcEvalution(usematrix(mi).matrix,epsilon(i));
    end
    sym(evalution)
%     T = array2table(evalution,'VariableNames',{usematrix(mi).name});
%     plotDataTable(:,mi+1) = T 
 plotDataTable(:,{usematrix(mi).name}) = array2table(evalution) ;
end

myplot(plotDataTable)

function myplot(inputData)
hold on 
xlabel('$$\varepsilon$$','Interpreter','Latex');
ylabel('$$r - \frac{\Delta}{n}$$','Interpreter', 'Latex');
[row,col] = size(inputData);
    plot(inputData{:,1},inputData{:,2:col},'-*')
    legend(inputData.Properties.VariableNames{2:col})

hold off
end