%havedelta = �s��̃V���~���[�V�����l�@idealdelta = ���̍s��Ɠ����s�A�񐔂̍s��ł̏��R�������̍ō��l
deltadeta = havedelta
%matrixstruct�͍\���̂�cell�z��ɂ����1��ڂɍs��̖��O�A�Q��߂ɍs�񂪊i�[����Ă���
usematrix = matrixstruct;
%�ǂ̂��炢�̊��o�Ńv���b�g���邩�������Őݒ�
epsilon = 0:0.01:1;
%for���ŉ񂷂��߂ɃC�v�V�����̗�̒�����u��
[epsilonrow,epsiloncol] = size(epsilon);
%�Z�L�����e�B���[�g���i�[����ϐ���������
Rsec = zeros(epsilonrow,epsiloncol)';
%�\���̂̍Ō���̓Y��
bot = length(struct2cell(usematrix))

    for i = 1:epsiloncol
        Rsec(i) = calcevalkai(usematrix(bot).matrix,deltadeta(bot).delta,epsilon(i));
    end
    sym(Rsec)
%     T = array2table(evalution,'VariableNames',{usematrix(mi).name});
%     plotDataTable(:,mi+1) = T 
%�f�[�^�e�[�u���ɍs��̖��O�̗���쐬���A������Rsec����
 plotDataTable(:,{usematrix(bot).name}) = array2table(Rsec) ;