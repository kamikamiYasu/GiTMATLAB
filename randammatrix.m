%�g�p�����{�̍s���ݒ�
largematrix = [1 1 1 0 1 1 0 ; 1 0 1 1 0 1 0; 1 0 1 0 1 1 1;1 0 0 1 1 0 1;0 1 1 1 0 1 0; 0 1 1 0 1 0 1 ; 1 1 0 1 1 0 0;];
m = 3
n = 7
usematrixset = makematrixset(largematrix,m);
delta = zeros(1,n)
for i = 1:n
    for j = 1:101
        x = randi(length(usematrixset));
        delta(i) = delta(i) +  calcDelta1(usematrixset{1,i},i);
    end
    delta(i) = delta(i) / 100
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
