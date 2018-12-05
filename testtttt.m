%秘密情報数
m = 10
%符号長
n = 20
%usematrixset = makematrixset(largematrix,m);
buff = zeros(100,n);
for i = 1:100
    buff(i,:) = randi(2,1,n);
end
buff = buff < 2

usematrixset = makematrixset(buff,m)
delta = zeros(1,n)
for i = 1:n
    for j = 1:1001
        x = randi(length(usematrixset));
        delta(i) = delta(i) +  calcDelta1(usematrixset{1,i},i);
    end
    delta(i) = delta(i) / 1000;
end


function matrixset = makematrixset(matrix,secinfo)
[row,col] = size(matrix);
rowindex = [1:row];
%取り出す行の組み合わせの一覧を落成
setpat = nchoosek(rowindex,secinfo);
%条件を満たした行列を格納するcell配列を作成
matrixset ={};
[setpatrow,setpatcol] = size(setpat);
%条件を満たした行列の数を記入
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