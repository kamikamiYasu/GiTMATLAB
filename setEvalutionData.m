deltadeta = havedelta;
%matrixstruct�͍\���̂�cell�z��ɂ����1��ڂɍs��̖��O�A�Q��߂ɍs�񂪊i�[����Ă���
usematrix = matrixstruct;
%�ǂ̂��炢�̊��o�Ńv���b�g���邩�������Őݒ�
epsilon = 0:0.01:1;
%for���ŉ񂷂��߂ɃC�v�V�����̗�̒�����u��
[epsilonrow,epsiloncol] = size(epsilon);
%�Z�L�����e�B���[�g���i�[����ϐ���������
Rsec = zeros(epsilonrow,epsiloncol)';
%plot�悤�Ƀf�[�^�e�[�u�����쐬�A�ŏ��̗��x���ƂȂ�C�v�V��������
plotDataTable = array2table(epsilon','VariableNames',{'epsilon'});

%usematrix��for���񂷂���
for mi = 1:length(struct2cell(usematrix))
    for i = 1:epsiloncol
        Rsec(i) = calcevalkai(usematrix(mi).matrix,deltadeta(mi).delta,epsilon(i));
    end
    sym(Rsec);
%     T = array2table(evalution,'VariableNames',{usematrix(mi).name});
%     plotDataTable(:,mi+1) = T 
%�f�[�^�e�[�u���ɍs��̖��O�̗���쐬���A������Rsec����
 plotDataTable(:,{usematrix(mi).name}) = array2table(Rsec) ;
end

%�����͊֐�����Ȃ��ĕʂ̃X�N���v�g�ɂ����ق����ǂ�
