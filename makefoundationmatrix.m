%�^����ꂽ����n����n�r�b�g�̂Q�i�����ׂĂ��s�Ɏ���2^n * n�s��𐶐�
function foundationmatrix = makefoundationmatrix(n)
%��������s��̒������v�Z
rowlength = 2^n;
%�߂�l��2^n * n�̃[���s��ɏ�����
foundationmatrix = zeros(rowlength,n);

for i = 1:rowlength
    foundationmatrix(i,:) = de2bi(i);
end
