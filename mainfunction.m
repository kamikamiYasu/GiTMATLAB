%�f���^�̒l���v�Z
deltadata = idealdelta%deltatest(matrixstruct,havedelta,'ini');
%Rsec�̒l���v�Z(!�����Ɏg�p������̂�deltatest�Ɠ�������!)
plotData = setEvalutionData(matrixstruct,deltadata,0.01);
%�O���t������
PlotGraf(plotData)
%�v�Z�����f�[�^���i�[(!�������̂�deltatest�ȂǂŎg�p�����ϐ���!)
%havedelta = deltadata
plotIdealTable = plotData