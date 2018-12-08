%デルタの値を計算
deltadata = idealdelta%deltatest(matrixstruct,havedelta,'ini');
%Rsecの値を計算(!引数に使用するものはdeltatestと同じもの!)
plotData = setEvalutionData(matrixstruct,deltadata,0.01);
%グラフを書く
PlotGraf(plotData)
%計算したデータを格納(!代入するのはdeltatestなどで使用した変数に!)
%havedelta = deltadata
plotIdealTable = plotData