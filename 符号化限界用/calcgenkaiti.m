genkaidelta;
keisanyoumatirix = eye(7);

epsilon = 0:0.01:1;
%for���ŉ񂷂��߂ɃC�v�V�����̗�̒�����u��
[epsilonrow,epsiloncol] = size(epsilon);
%�Z�L�����e�B���[�g���i�[����ϐ���������
Rsec = zeros(epsilonrow,epsiloncol)';
%plot�悤�Ƀf�[�^�e�[�u�����쐬�A�ŏ��̗��x���ƂȂ�C�v�V��������
plotgenkaiRsec = array2table(epsilon','VariableNames',{'epsilon'});
    for i = 1:epsiloncol
        Rsec(i) = calcevalkai(keisanyoumatirix,genkaidelta,epsilon(i));
    end
    sym(Rsec);
%     T = array2table(evalution,'VariableNames',{usematrix(mi).name});
%     plotDataTable(:,mi+1) = T 
%�f�[�^�e�[�u���ɍs��̖��O�̗���쐬���A������Rsec����
 plotgenkaiRsec(:,2) = array2table(Rsec) ;
%  plotIgenkaiRsec(:,2).Propertry.Valiablenames = 'keisanyougenkai'
plotgenkaiRsec.Properties.VariableNames{'Var2'} = 'keisanyougenkai';