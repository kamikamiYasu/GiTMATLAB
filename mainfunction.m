deltadata = struct('name',[],'delta',[])
%�f���^�̒l���v�Z
deltadata = deltatest(matrixstruct,deltadata,'ini');
%Rsec�̒l���v�Z(!�����Ɏg�p������̂�deltatest�Ɠ�������!)
plotData = setEvalutionData(matrixstruct,deltadata,0.01);
%�O���t������
PlotGraf(plotData)
%�v�Z�����f�[�^���i�[(!�������̂�deltatest�ȂǂŎg�p�����ϐ���!)
%FTRateIdealdelta = deltadata
plotDataTable = plotData