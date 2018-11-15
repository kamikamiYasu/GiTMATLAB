%与えられた長さnからnビットの２進数すべてを行に持つ2^n * n行列を生成
function foundationmatrix = makefoundationmatrix(n)
%生成する行列の長さを計算
rowlength = 2^n;
%戻り値を2^n * nのゼロ行列に初期化
foundationmatrix = zeros(rowlength,n);

for i = 1:rowlength
    foundationmatrix(i,:) = de2bi(i);
end
