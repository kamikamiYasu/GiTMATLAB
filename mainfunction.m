%HarfRatedelta = struct('name',[],'delta',[])
%�f���^�̒l���v�Z
deltadata = calcIdealdelta(FTRateMatrix)%deltatest(FTRateMatrix,FTRatedelta,'ini');
%Rsec�̒l���v�Z(!�����Ɏg�p������̂�deltatest�Ɠ�������!)
plotData = setEvalutionData(FTRateMatrix,deltadata,0.01);
%�O���t������
PlotGraf(plotData)
%�v�Z�����f�[�^���i�[(!�������̂�deltatest�ȂǂŎg�p�����ϐ���!)
FTRateIdealdelta = deltadata
plotFTIdealRate = plotData