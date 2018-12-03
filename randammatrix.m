%使用する大本の行列を設定
largematrix = [1 1 1 0 1 0 0 ; 1 1 0 1 0 1 0;1 0 1 1 0 0 1;1 1 0 1 0 0 1;1 0 1 0 1 0 1;0 1 1 0 0 1 1;1 0 1 0 0 1 1;0 1 0 1 0 1 1;1 1 0 0 1 1 0;0 1 0 0 1 1 1;1 0 1 0 1 1 0;1 0 0 1 1 0 1;1 0 0 1 1 1 0;0 1 0 1 1 0 1;0 0 1 1 0 1 1;0 0 1 1 1 0 1;1 0 1 1 0 1 0;0 1 1 0 1 1 0;0 1 1 1 0 1 0;0 1 1 0 1 0 1;1 1 0 1 1 0 0;0 0 1 1 1 0 1;1 1 1 0 1 0 0;0 1 0 0 1 1 1];
%秘密情報数
m = 10
%符号長
n = 20
%usematrixset = makematrixset(largematrix,m);
%デルタLの格納場所を設定
deltaL = zeros(1,n);
matrix = zeros(m,n);
for i = 1:n
    for j = 1:101
        matrix = randi(2,m,n);
        matrix = matrix < 2;
        if gfrank(matrix(:,(n-m+1):n)) == m
            deltaL(i) = deltaL(i) + calcDelta1(matrix,i);
        end
    end
    deltaL(i) = deltaL(i) / 1000;
end

% %delta1~deltanまで
% for i = 1:n
%     for j = 1:1001
%         %m X nのランダム行列を作成
%         x = randi(length(usematrixset));
%         deltaL(i) = deltaL(i) +  calcDelta1(usematrixset{1,i},i);
%     end
%     deltaL(i) = deltaL(i) / 1000;
% end


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

    function ranmatrix = foundationmatrix(m,n)
        
    end

end
