function deltastruct =  randammatrix(n,m)

%usematrixset = makematrixset(largematrix,m);
%デルタLの格納場所を設定
deltaL = zeros(n,1);
matrix = zeros(m,n);
buff = eye(m);
ranminmatrix = zeros(m,n);
ranmindelta = ones(1,n) * m;
tempdelta = zeros(n,1);

for j = 1:100
    matrix = randi(2,m,(n-m));
    matrix = matrix < 2;
    matrix = horzcat(matrix,buff);
    for k = 1:n
        tempdelta(k) = calcDelta1(matrix,k);
    end
    deltaL = deltaL + tempdelta;
    if ranmindelta >= tempdelta
        ranmindelta = tempdelta;
        ranminmatrix = matrix;
    end
end
    deltaL = deltaL / 100;
    deltastruct = struct('avrdelta',deltaL,'mindelta',ranmindelta,'minmatrix',ranminmatrix)
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


% function matrixset = makematrixset(matrix,secinfo)
% [row,col] = size(matrix);
% rowindex = [1:row];
% %取り出す行の組み合わせの一覧を落成
% setpat = nchoosek(rowindex,secinfo);
% %条件を満たした行列を格納するcell配列を作成
% matrixset ={};
% [setpatrow,setpatcol] = size(setpat);
% %条件を満たした行列の数を記入
% matrixcounter = 1;
% for i = 1:setpatrow
%     buff = zeros(secinfo,col);
%     for j = 1:setpatcol
%     buff(j,:) = matrix((setpat(i,j)),:);
%     end
%     partbuff = buff(:,(col - secinfo + 1):col);
%     if gfrank(partbuff) == secinfo
%         matrixset{1,matrixcounter} = buff;
%         matrixcounter = matrixcounter + 1
%     end
%     
% end
% 
%     function ranmatrix = foundationmatrix(m,n)
%         
%     end
% 
% end
