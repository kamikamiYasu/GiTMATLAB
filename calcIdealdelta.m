usematrix = matrixstruct;

type = 'ini'

switch type
    case 'add'
        
    case 'ini'
        idealdelta = struct('name','delta');
        for mi = 1:length(struct2cell(usematrix))
        %�s��̖��O���R�s�[
        idealdelta(mi).name = usematrix(mi).name;
        [matrixrow,matrixcol] = size(usematrix(mi).matrix);
        %���̒l���ꎞ�I�Ɋi�[����o�b�t�@���`matrixcol = �R���r�b�g���̍ő�l
        buff1 = zeros(matrixcol,1);
        %matrix�ɑ΂���i�r�b�g�R���ꍇ�̏��R���������v�Z
        for i = (matrixcol - matrixrow + 1) : matrixcol 
            buff1(i) = i -  (matrixcol - matrixrow);
        end
        idealdelta(mi).delta = buff1;
        end
end
