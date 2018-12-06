%usematrix = name��matrix�����\����,havedelta =
%�g�p�����s��̖��O�Ƃ̂��ꂼ��̏��R�����������\����,type = ����������̂��ǉ�7���𔻒f�������
function deltadata = deltatest(usematrix,havedelta,type)
%������type���f���^�̒l�����ׂČv�Z����ꍇ��ini,����܂ł̒l�ɒǉ�����ꍇ��add�ɐݒ肷��
if type ~= 'ini'
    if type ~= 'add'
        disp("error in deltaddata , type false!")
    end
end


switch type
    case 'add'
        %�f���^�̒l��ǂݍ���
        %���݂̍s��ƃ��̌���ǂݍ���
        bottom = length(struct2cell(havedelta));
%         havedelta(bottom+1).name = usematrix(bottom+1).name;
%�n�u�f���^�̈�ԉ��ɍ���v�Z��������ǉ�
        havedelta(bottom+1) = adddelta(usematrix(bottom+1));
        deltadata = havedelta
%         [matirxrow,matrixcol] = size(usematrix(bottom+1).matrix);
%         buff1 = zeros(matrixcol,1);
%         for i = 1:matrixcol
%             buff1(i) = calcDelta1(usematrix(bottom+1).matrix,i);
%         end
%         havedelta(bottom+1).delta = buff1;
    case 'ini'
        
    for mi = 1:length(struct2cell(usematrix))
        %�s��̖��O���R�s�[
        havedelta(mi).name = usematrix(mi).name;
        [~,matrixcol] = size(usematrix(mi).matrix);
        %���̒l���ꎞ�I�Ɋi�[����o�b�t�@���`matrixcol = �R���r�b�g���̍ő�l
        buff1 = zeros(matrixcol,1);
        %matrix�ɑ΂���i�r�b�g�R���ꍇ�̏��R���������v�Z
        for i = 1:matrixcol
            buff1(i) = calcDelta1(usematrix(mi).matrix,i);
        end
        havedelta(mi).delta = buff1;
    end
    deltadata = havedelta;
end
end

function delta = adddelta(bottommatrix)
        delta = struct('name',[],'delta',[]);
        delta.name = bottommatrix.name;
        [~,matrixcol] = size(bottommatrix.matrix);
        buff1 = zeros(matrixcol,1);
        for i = 1:matrixcol
            buff1(i) = calcDelta1(bottommatrix.matrix,i);
        end
        delta.delta = buff1;
end
