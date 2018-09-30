%入力に使うデータセルを指定
inputData = plotDataTable2
%グラフの上書き設定
hold on 
%x，y軸のラベル設定
xlabel('$$\varepsilon$$','Interpreter','Latex','FontSize',36);
ylabel('$$R_{sec}$$','Interpreter', 'Latex','FontSize',36);
[row,col] = size(inputData);
%x軸にセルの１列目を、それ以外をy軸にそれぞれ使用してグラフを作成
    plot(inputData{:,1},inputData{:,2:col},'-');
    legend(inputData.Properties.VariableNames{2:col});

hold off