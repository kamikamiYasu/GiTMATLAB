% �����s��A(7,4)�n�~���O����
A = B;
[Arow,Acol] = size(A);
% �R����̑g�ݍ��킹�v�Z�p
v = [1:Acol];
%���S�ȃr�b�g��
s = 5;
%���R�������N���Ă��܂��g�ݍ��킹�̐�
counter = 0;


leakpat = nchoosek(v,s);
[leakpatrow,leakpatcol] = size(leakpat);
for i = 1:leakpatrow
    buff1 = zeros(Arow,1);
    for j = 1 : s
        safebit = leakpat(i,j);
        buff1 = horzcat(buff1,A(:,safebit));
    end
    buff1(:,1) = [];
    if gfrank(buff1) ~= gfrank(A)
        counter = counter +1;
        buff1
        leakpat(i,:)
        gfrank(buff1)
    end
end
    sprintf('�����N����������g�ݍ��킹��%d�ł�',counter)
    