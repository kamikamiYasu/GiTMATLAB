%idealdelta�p
usematrix = matrixstruct;
%������type���f���^�̒l�����ׂČv�Z����ꍇ��ini,����܂ł̒l�ɒǉ�����ꍇ��add�ɐݒ肷��
type = 'ini';

switch type
    case 'add'
        %�f���^�̒l��ǂݍ���
        load('idealdelta.mat')
        %���݂̍s��ƃ��̌���ǂݍ���
        bottom = length(struct2cell(idealdelta));
%         havedelta(bottom+1).name = usematrix(bottom+1).name;
%�n�u�f���^�̈�ԉ��ɍ���v�Z��������ǉ�
        idealdelta(bottom+1) = adddelta(usematrix(bottom+1));
%         [matirxrow,matrixcol] = size(usematrix(bottom+1).matrix);
%         buff1 = zeros(matrixcol,1);
%         for i = 1:matrixcol
%             buff1(i) = calcDelta1(usematrix(bottom+1).matrix,i);
%         end
%         havedelta(bottom+1).delta = buff1;
    case 'ini'
        %havedelta�̏�����
        idealdelta = struct('name','delta');
        %�\���̂̂��ׂĂ̍s��ɑ΂���
    for mi = 1:length(struct2cell(usematrix))
        %�s��̖��O���R�s�[
        idealdelta(mi).name = usematrix(mi).name;
        [matirxrow,matrixcol] = size(usematrix(mi).matrix);
        %���̒l���ꎞ�I�Ɋi�[����o�b�t�@���`matrixcol = �R���r�b�g���̍ő�l
        buff1 = zeros(matrixcol,1);
        %matrix�ɑ΂���i�r�b�g�R���ꍇ�̏��R���������v�Z
        for i = 1:matrixcol
            buff1(i) = calcDelta1(usematrix(mi).matrix,i);
        end
        idealdelta(mi).delta = buff1;
    end
end
   
function deltadata = adddelta(bottommatrix)
        deltadata = struct('name',[],'delta',[]);
        deltadata.name = bottommatrix.name;
        [matirxrow,matrixcol] = size(bottommatrix.matrix);
        buff1 = zeros(matrixcol,1);
        for i = 1:matrixcol
            buff1(i) = calcDelta1(bottommatrix.matrix,i);
        end
        deltadata.delta = buff1;
end
