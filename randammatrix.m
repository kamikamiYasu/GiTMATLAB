%秘密情報のビット数とメッセージの長さを設定
m = 20
n = 100
%usematrixset = makematrixset(largematrix,m);
%情報漏えい量を格納する配列を初期化
delta = zeros(1,n)
%符号化に使用する行列の初期化
matrix = zeros(m,n);
%すべての情報漏えい量デルタLをfor文で計算
for i = 1:n
    %ランダムに行列を使用して情報漏えい量を求め跡で平均値を求める
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
