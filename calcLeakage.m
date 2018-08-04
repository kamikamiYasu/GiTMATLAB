% ���k�Ɏg���s��A (A�̏����F���ׂĂ̗񂪔�[���x�N�g���ł��邱��)
A = getMatrix("Lin63");
if A == 0
    disp('matrix A is undefined')
    return
end
[Arow,Acol] = size(A);
% �R����̑g�ݍ��킹�v�Z�p (v = [1 2 ,,, Acol])
v = [1:Acol];
% �R���r�b�g��
l = 4;
%���S�ȃr�b�g��
s = Acol - l;
%�g�ݍ��킹�̌v�Z(leakpat = vCs * s�̔z��)
safepat = nchoosek(v,s);
%leakpatrow = vCs, leakpatcol = s
[safepatrow,safepatcol] = size(safepat);
%���R�������N���Ă��܂��g�ݍ��킹���i�[
dawnranklist = zeros(safepatrow,safepatcol);
%�����N���ǂ�قǗ����邩���i�[
rankvalue = zeros(safepatrow,1);
%��肤�郉���N�̒l�ꗗ
rankvalArray = 1:Arow;
%���̌����J�E���g���邽�߂̕ϐ�
rankcount = zeros(1,Arow);
%���ׂĂ̑g�ݍ��킹�ɑ΂���
for i = 1:safepatrow
    %rank A(n-l) ���v�Z���邽�߂̃o�b�t�@
    buff1 = zeros(Arow,1);
    %buff1�ɏ�񂪘R��Ă��Ȃ��r�b�g�̗������
    for j = 1 : s
        safebit = safepat(i,j);
        buff1 = horzcat(buff1,A(:,safebit));
    end
    %buff1����]����0�x�N�g������菜��A(n-l)�ɕό`
    buff1(:,1) = [];
    %Arank A(n-l) != rankA,�܂胉���N�������Ă��܂����ꍇ�ɂ���
    if gfrank(buff1) ~= Arow
        %�����N��������g�ݍ��킹���L��
        dawnranklist(i,:) = safepat(i,:);
        %���̍ۂ̃����N���L��
        rankvalue(i) = gfrank(buff1);
    end
    %rank A(n-l)���Ƃ����l�Ƃ��̌����L�^
    for index = rankvalArray
        if gfrank(buff1) == index
            rankcount(1,index) = rankcount(1,index) + 1;
        end
    end
    
end
%�����N��������g�ݍ��킹�Ƃ��̃����N������
drlist = horzcat(dawnranklist,rankvalue)';

[drlistrow,drlistcol] = size(drlist);
%dawnranklist�̒��ŗ񂪂O�̏ꏊ���L��
count = 0;
for i = 1:drlistcol
    if drlist(:,i) == zeros(drlistrow,1)
        count = [count;i];
    end
end
%count�쐬���ɓ��͂����O���폜
if count ==  0
else
    count(1) = [];
    [countrow,countcol] = size(count);
    %�����dawnranklist�̂O������S���폜�ł���
    drlist(:,count(:,1)) = [];
drlist = drlist';
end
%���R�����ʂ̌v�Z
delta1 = Arow;
for i = 1:Arow
    delta1 = delta1 - rankvalArray(i) * (rankcount(i) / safepatrow);
end

sprintf('Delta1 = %f',delta1)

    
