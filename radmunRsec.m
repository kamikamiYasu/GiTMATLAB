
%�����łǂ̃f���^���g�p����̂����߂�
deltadeta = deltaL'
%matrixstruct�͍\���̂�cell�z��ɂ����1��ڂɍs��̖��O�A�Q��߂ɍs�񂪊i�[����Ă���
n = 20;
m = 10
damymatrix = zeros(m,(n-m))
buff = eye(m)
damymatrix = horzcat(damymatrix,buff)
%�ǂ̂��炢�̊��o�Ńv���b�g���邩�������Őݒ�
epsilon = 0:0.01:1;
%for���ŉ񂷂��߂ɃC�v�V�����̗�̒�����u��
[epsilonrow,epsiloncol] = size(epsilon);
%�Z�L�����e�B���[�g���i�[����ϐ���������
Rsec = zeros(epsilonrow,epsiloncol)';
%plot�悤�Ƀf�[�^�e�[�u�����쐬�A�ŏ��̗��x���ƂȂ�C�v�V��������
plotbuffTable = array2table(epsilon','VariableNames',{'epsilon'});

%usematrix��for���񂷂���

    for i = 1:epsiloncol
        Rsec(i) = calcevalkai(damymatrix,deltadeta,epsilon(i));
    end
    sym(Rsec);
%     T = array2table(evalution,'VariableNames',{usematrix(mi).name});
%     plotDataTable(:,mi+1) = T 
%�f�[�^�e�[�u���ɍs��̖��O�̗���쐬���A������Rsec����
name = 'Ram2010'
 plotbuffTable(:,name) = array2table(Rsec) ;
%deltadeta��ύX�����炱�����ύX����
plotRamdumTable = plotbuffTable;
inputData = plotRamdumTable;

xlabel('$$\varepsilon$$','Interpreter','Latex','FontSize',20);
ylabel('$$R_{sec}$$','Interpreter', 'Latex','FontSize',20);
[row,col] = size(inputData);
%x���ɃZ���̂P��ڂ��A����ȊO��y���ɂ��ꂼ��g�p���ăO���t���쐬
    plot(inputData{:,1},inputData{:,2:col},'-');
    legend(inputData.Properties.VariableNames{2:col});

 hold off