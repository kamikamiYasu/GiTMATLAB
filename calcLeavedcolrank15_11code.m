% �����s��A(15,11)�n�~���O����
A = [1 1 1 1; 1 1 1 0; 1 1 0 1;1 1 0 0; 1 0 1 1 ;1 0 0 1;1 0 1 0; 0 1 1 1; 0 1 1 0; 0 1 0 1; 0 0 1 1 ; 1 0 0 0 ; 0 1 0 0; 0 0 1 0;0 0 0 1]';


[Arow,Acol] = size(A);
% �R����̑g�ݍ��킹�v�Z�p
v = [1:Acol];
% �R���r�b�g��
l = 5;
%���S�ȃr�b�g��
s = Acol - l;
%���R�������N���Ă��܂��g�ݍ��킹�̐�
counter = 0;
%�g�ݍ��킹�̌v�Z(leakpat = vCs * s�̔z��)
leakpat = nchoosek(v,s);
[leakpatrow,leakpatcol] = size(leakpat);
%���R�������N���Ă��܂��g�ݍ��킹���i�[
falselist = zeros(leakpatrow,leakpatcol);
%�����N���ǂ�قǗ����邩���i�[
ranklist = zeros(leakpatrow,1);

rank1 = 0;
rank2 = 0;
rank3 = 0;

for i = 1:leakpatrow
    buff1 = zeros(Arow,1);
    for j = 1 : s
        safebit = leakpat(i,j);
        buff1 = horzcat(buff1,A(:,safebit));
    end
    buff1(:,1) = [];
    if gfrank(buff1) ~= Arow
        counter = counter +1;
        falselist(i,:) = leakpat(i,:);
        ranklist(i) = gfrank(buff1);
    end
    switch gfrank(buff1)
        case 1
            rank1 = rank1 + 1;
        case 2
            rank2 = rank2 + 1;
        case 3
            rank3 = rank3 + 1;
        otherwise
            
    end
end
    sprintf('�����N����������g�ݍ��킹��%d�ł�',counter)