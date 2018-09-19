 function delta1 = calcDelta1(matrix,leakbit)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���k�Ɏg���s��A�̔��� (A�̏����F���ׂĂ̗񂪔�[���x�N�g���ł��邱��)
A = matrix;
Arank = gfrank(A);
[Arow,Acol] = size(A);
if Acol == leakbit
    delta1 = Arank;
    return
else if Acol < leakbit
        disp("error!")
        return
    end
end
% ��̃C���f�b�N�X
AcolIndex = [1:Acol];
%���S�ȃr�b�g��
s = Acol - leakbit;
%�g�ݍ��킹�̌v�Z(leakpat = vCs * s�̔z��)
safepat = nchoosek(AcolIndex,s);
%safepatrow = vCs, safepatcol = s
[safepatrow,safepatcol] = size(safepat);

%��肤�郉���N�̒l�ꗗ
rankvalArray = 1:Arank;
%���̌����J�E���g���邽�߂̕ϐ�
rankcount = zeros(1,Arank);
%���ׂĂ̑g�ݍ��킹�ɑ΂���
for i = 1:safepatrow
    %rank A(n-l) ���v�Z���邽�߂̃o�b�t�@
    buff1 = zeros(Arow,s);
    %buff1�ɏ�񂪘R��Ă��Ȃ��r�b�g�̗������
    for j = 1 : s
        safebit = safepat(i,j);
        buff1(:,j) = A(:,safebit);
    end
    %buff1����]����0�x�N�g������菜��A(n-l)�ɕό`
%     buff1(:,1) = [];
    
    %rank A(n-l)���Ƃ����l�Ƃ��̌����L�^
    tes = gfrank(buff1); 
    for index = rankvalArray
        if tes == index
            rankcount(1,index) = rankcount(1,index) + 1;
        end
    end
    
end

%de�̌v�Z
delta1 = Arank;
buff2 = rankvalArray .* sym(rankcount ./ safepatrow);
delta1 = delta1 - sum(buff2);
% for i = 1:Arow
%     delta1 = delta1 - rankvalArray(i) * (rankcount(i) / safepatrow);
% end
end


