%TwoThirdsRatedelta = struct('name',[],'delta',[])
%デルタの値を計算
deltadata = HarfRateIdealdelta%deltatest(TwoThirdsRateMatrix,TwoThirdsRatedelta,'ini');
%Rsecの値を計算(!引数に使用するものはdeltatestと同じもの!)
plotData = setEvalutionData(HarfRateMatrix,deltadata,0.01);
%グラフを書く
PlotGraf(plotData)
%計算したデータを格納(!代入するのはdeltatestなどで使用した変数に!)
%TwoThirdsRatedelta= deltadata
plotHarfRateIdeal = plotData