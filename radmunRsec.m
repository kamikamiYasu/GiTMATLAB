
%ここでどのデルタを使用するのか決める
deltadeta = deltaL'
%matrixstructは構造体でcell配列にすると1列目に行列の名前、２列めに行列が格納されている
n = 20;
m = 10
damymatrix = zeros(m,(n-m))
buff = eye(m)
damymatrix = horzcat(damymatrix,buff)
%どのぐらいの感覚でプロットするかをここで設定
epsilon = 0:0.01:1;
%for文で回すためにイプシロンの列の長さを置く
[epsilonrow,epsiloncol] = size(epsilon);
%セキュリティレートを格納する変数を初期化
Rsec = zeros(epsilonrow,epsiloncol)';
%plotようにデータテーブルを作成、最初の列にx軸となるイプシロンを代入
plotbuffTable = array2table(epsilon','VariableNames',{'epsilon'});

%usematrixでforを回すため

    for i = 1:epsiloncol
        Rsec(i) = calcevalkai(damymatrix,deltadeta,epsilon(i));
    end
    sym(Rsec);
%     T = array2table(evalution,'VariableNames',{usematrix(mi).name});
%     plotDataTable(:,mi+1) = T 
%データテーブルに行列の名前の列を作成し、そこにRsecを代入
name = 'Ram2010'
 plotbuffTable(:,name) = array2table(Rsec) ;
%deltadetaを変更したらここも変更する
plotRamdumTable = plotbuffTable;
inputData = plotRamdumTable;

xlabel('$$\varepsilon$$','Interpreter','Latex','FontSize',20);
ylabel('$$R_{sec}$$','Interpreter', 'Latex','FontSize',20);
[row,col] = size(inputData);
%x軸にセルの１列目を、それ以外をy軸にそれぞれ使用してグラフを作成
    plot(inputData{:,1},inputData{:,2:col},'-');
    legend(inputData.Properties.VariableNames{2:col});

 hold off