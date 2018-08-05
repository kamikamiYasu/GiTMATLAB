%matrixstructは構造体でcell配列にすると1列目に行列の名前、２列めに行列が格納されている
usematrix = matrixstruct;
%どのぐらいの感覚でプロットするかをここで設定
epsilon = 0:0.05:1;
%for文で回すためにイプシロンの列の長さを置く
[epsilonrow,epsiloncol] = size(epsilon);
%セキュリティレートを格納する変数を初期化
Rsec = zeros(epsilonrow,epsiloncol)';
%plotようにデータテーブルを作成、最初の列にx軸となるイプシロンを代入
plotDataTable = array2table(epsilon','VariableNames',{'epsilon'});

%usematrixでforを回すため
for mi = 1:length(struct2cell(usematrix))
    for i = 1:epsiloncol
        Rsec(i) = calcEvalution(usematrix(mi).matrix,epsilon(i));
    end
    sym(Rsec)
%     T = array2table(evalution,'VariableNames',{usematrix(mi).name});
%     plotDataTable(:,mi+1) = T 
%データテーブルに行列の名前の列を作成し、そこにRsecを代入
 plotDataTable(:,{usematrix(mi).name}) = array2table(Rsec) ;
end

%ここは関数じゃなくて別のスクリプトにしたほうが良い
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