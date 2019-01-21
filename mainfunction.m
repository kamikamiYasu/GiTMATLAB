%HarfRatedelta = struct('name',[],'delta',[])
%デルタの値を計算
deltadata =deltatest(minmatrix,mindelta,'ini');
%Rsecの値を計算(!引数に使用するものはdeltatestと同じもの!)
%plotData = setEvalutionData(ExLin94,deltadata,0.01);
%グラフを書く
%PlotGraf(plotData)
%計算したデータを格納(!代入するのはdeltatestなどで使用した変数に!)
%FTRateIdealdelta = deltadata
%plotFTIdealRate = plotData