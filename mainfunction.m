%TwoThirdsRatedelta = struct('name',[],'delta',[])
%�f���^�̒l���v�Z
deltadata = HarfRateIdealdelta%deltatest(TwoThirdsRateMatrix,TwoThirdsRatedelta,'ini');
%Rsec�̒l���v�Z(!�����Ɏg�p������̂�deltatest�Ɠ�������!)
plotData = setEvalutionData(HarfRateMatrix,deltadata,0.01);
%�O���t������
PlotGraf(plotData)
%�v�Z�����f�[�^���i�[(!�������̂�deltatest�ȂǂŎg�p�����ϐ���!)
%TwoThirdsRatedelta= deltadata
plotHarfRateIdeal = plotData