%HarfRatedelta = struct('name',[],'delta',[])
%�f���^�̒l���v�Z
deltadata = HarfRatedelta%deltatest(HarfRateMatrix,HarfRatedelta,'ini');
%Rsec�̒l���v�Z(!�����Ɏg�p������̂�deltatest�Ɠ�������!)
plotData = setEvalutionData(HarfRateMatrix,deltadata,0.01);
%�O���t������
PlotGraf(plotData)
%�v�Z�����f�[�^���i�[(!�������̂�deltatest�ȂǂŎg�p�����ϐ���!)
%HarfRatedelta = deltadata
plotHarfRate = plotData