% �����s��A(7,4)�n�~���O����
A = [1 1 1; 1 1 0; 1 0 1; 0 1 1; 1 0 0; 0 1 0; 0 0 1;]';
[Arow,Acol] = size(A);
% �R����̑g�ݍ��킹�v�Z�p
v = [1:7];
%�R���r�b�g��
s = 4;
%���R�������N���Ă��܂��g�ݍ��킹�̐�
counter = 0;


leakpat = nchoosek(v,s);
[leakpatrow,leakpatcol] = size(leakpat);
for i = 1:leakpatrow
    buff1 = zeros(3,1);
    for j = 1 : s
        safebit = leakpat(i,j);
        buff1 = horzcat(buff1,A(:,safebit));
    end
    buff1(:,1) = [];
    if gfrank(buff1) ~= Arow
        counter = counter +1;
    end
end
    sprintf('�����N����������g�ݍ��킹��%d�ł�',counter)
    