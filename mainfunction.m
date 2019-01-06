%HarfRatedelta = struct('name',[],'delta',[])
%デルタの値を計算
%deltadata = deltatest(HarfRateMatrix,HarfRatedelta,'ini');
%Rsecの値を計算(!引数に使用するものはdeltatestと同じもの!)
HarfRatedelta(1).delta = deltadata
plotData = setEvalutionData(HarfRateMatrix,HarfRatedelta,0.01);
%グラフを書く
PlotGraf(plotData)
%計算したデータを格納(!代入するのはdeltatestなどで使用した変数に!)
%HarfRatedelta = deltadata
plotHarfRate = plotData