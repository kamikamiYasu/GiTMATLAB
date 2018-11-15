%�閧���̃r�b�g���ƃ��b�Z�[�W�̒�����ݒ�
m = 20
n = 100
%usematrixset = makematrixset(largematrix,m);
%���R�����ʂ��i�[����z���������
delta = zeros(1,n)
%�������Ɏg�p����s��̏�����
matrix = zeros(m,n);
%���ׂĂ̏��R�����ʃf���^L��for���Ōv�Z
for i = 1:n
    %�����_���ɍs����g�p���ď��R�����ʂ����ߐՂŕ��ϒl�����߂�
    for j = 1:1001
        iscanused = true;
        while iscanused
            matrix = randi(2,m,n);
            matrix = matrix < 2;
            if gfrank(matrix(:,(n-m+1):n)) == m
                iscanused = false;
            end
        end
        
        delta(i) = delta(i) +  calcDelta1(matrix,i);
    
    end
    delta(i) = delta(i) / 1000;
end


function matrixset = makematrixset(matrix,secinfo)
[row,col] = size(matrix);
rowindex = [1:row];
%���o���s�̑g�ݍ��킹�̈ꗗ�𗎐�
setpat = nchoosek(rowindex,secinfo);
%�����𖞂������s����i�[����cell�z����쐬
matrixset ={};
[setpatrow,setpatcol] = size(setpat);
%�����𖞂������s��̐����L��
matrixcounter = 1;
for i = 1:setpatrow
    buff = zeros(secinfo,col);
    for j = 1:setpatcol
    buff(j,:) = matrix((setpat(i,j)),:);
    end
    partbuff = buff(:,(col - secinfo + 1):col);
    if gfrank(partbuff) == secinfo
        matrixset{1,matrixcounter} = buff;
        matrixcounter = matrixcounter + 1
    end
    
end


end
